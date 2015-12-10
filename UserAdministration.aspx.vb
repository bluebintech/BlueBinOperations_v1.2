Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Configuration
Imports System.Net.Mail
Imports System.Web.UI.WebControls

Partial Class UserAdministration
    Inherits Page
    Dim CreatorUserLogin As String = Page.User.Identity.Name.ToString()
    Protected Sub UsersB_Click(sender As Object, e As EventArgs) Handles UsersB.Click
        GridViewUsers.Visible = True
        SearchTable.Visible = True
        GridViewRoles.Visible = False
        GridViewUsers.DataBind()
        hiddenUsers.Visible = True
        hiddenRoles.Visible = False
    End Sub

    Protected Sub RolesB_Click(sender As Object, e As EventArgs) Handles RolesB.Click
        GridViewUsers.Visible = False
        SearchTable.Visible = False
        GridViewRoles.Visible = True
        GridViewRoles.DataBind()
        hiddenRoles.Visible = True
        hiddenUsers.Visible = False
    End Sub



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack() Then
            GridViewUsers.DataBind()
            GridViewRoles.DataBind()
            GridViewUsers.Visible = True
            SearchTable.Visible = True
            GridViewRoles.Visible = False
            AddUserErrorLabel.Text = ""
        End If
    End Sub

    Protected Sub GridViewUsers_RowCommand(ByVal sender As System.Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName = "UsersInsert" Then
            Dim NewPassword As String
            Dim txtUserLogin As TextBox = DirectCast(GridViewUsers.FooterRow.FindControl("UserLogin"), TextBox)
            Dim txtFirstName As TextBox = DirectCast(GridViewUsers.FooterRow.FindControl("FirstName"), TextBox)
            Dim txtLastName As TextBox = DirectCast(GridViewUsers.FooterRow.FindControl("LastName"), TextBox)
            Dim txtMiddleName As TextBox = DirectCast(GridViewUsers.FooterRow.FindControl("MiddleName"), TextBox)
            Dim txtRoleName As String = TryCast(GridViewUsers.FooterRow.FindControl("RoleDDF"), DropDownList).SelectedItem.Value '" & txtRoleName.SelectedItem.Value & "
            Dim txtEmail As TextBox = DirectCast(GridViewUsers.FooterRow.FindControl("Email"), TextBox)

            Dim constr As String = ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("sp_InsertUser")
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@UserLogin", txtUserLogin.Text)
                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text)
                    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text)
                    cmd.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text)
                    cmd.Parameters.AddWithValue("@RoleName", txtRoleName)
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text)
                    cmd.Connection = con
                    con.Open()
                    'cmd.ExecuteNonQuery()
                    NewPassword = Convert.ToString(cmd.ExecuteScalar())
                    con.Close()
                End Using
            End Using

            If NewPassword = "exists" Then
                AddUserErrorLabel.Text = "User already Exists!"
            Else
                Dim SiteAddress As String
                Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
                con.Open()
                Dim da As New SqlDataAdapter("select ConfigValue from bluebin.Config where ConfigName = 'SiteAppURL'", con)
                Dim dt As New DataTable
                da.Fill(dt)
                SiteAddress = dt.Rows(0)("ConfigValue").ToString()


                Dim SmtpServer As New SmtpClient()
                SmtpServer.Credentials = New Net.NetworkCredential("BlueBinTrac@gmail.com", "BBT2015!")
                SmtpServer.Port = 587
                SmtpServer.Host = "smtp.gmail.com"
                SmtpServer.EnableSsl = True

                Dim Mail As New MailMessage()
                Dim addr() As String = txtUserLogin.Text.Split(", ")
                Try
                    Mail.From = New MailAddress("support@BlueBin.com",
                        "BlueBin Operations Application", System.Text.Encoding.UTF8)
                    Dim i As Byte
                    For i = 0 To addr.Length - 1

                    Next

                    Mail.[To].Add(New MailAddress(txtUserLogin.Text))
                    Mail.CC.Add(New MailAddress("support@bluebin.com"))
                    Mail.Bcc.Add(New MailAddress("gbutler@bluebin.com"))
                    Mail.Subject = "New BlueBin Account - " & txtUserLogin.Text
                    Mail.IsBodyHtml = True
                    Mail.Body = "<html>
                                    <head>
                                        <style>
                                            table {
                                                      width: 40%;
                                                      border: 1px solid #000;
                                                    }

                                                    th, td {
                                                      width: 50%;
                                                      text-align: left; 
                                                      vertical-align: top; 
                                                      border: 1px solid #000;
                                                      border-collapse: collapse;
                                                      padding: 0.5em;
                                                    }
                                                    th {
                                                      background: #eee;
                                                    }
                                                    .qty th td {
                                                       width: 10px;
                                        </style>    
                                    </head>
                                    <body>
                                    <b>Date:</b> " & DateTime.Now.ToString("MM/dd/yyyy") &
                                    "<br /><br /><b>BlueBin Site:</b> http://dashboard.bluebin.com/" & SiteAddress &
                                    "<br /><br />Hello " & txtFirstName.Text & " " & txtLastName.Text & "," &
                                    "<br /><br />You are receiving this email as the result of a New Account created for you at your BlueBin.com site.  
                                    <br /><br />Your new account information is below. Please enter your Password at the Login screen and you will be prompted to change the password to a new one on successful entry.
                                    <br /><br />Thank you and have a great day!" &
                                        "<br /><br />
                                        <table>
                                        <tr>
                                            <th>UserID</th>
                                            <th>Password</th>
                                        </tr>" &
                                        "<tr><td>" & txtUserLogin.Text & "</td><td>" & NewPassword & "</td></tr></table>" &
                                        "<br /><br /><b>If you did not request a new account, please contact BlueBin Support at your earliest convenience at support@bluebin.com.</b>  " &
                                "<br /><br /><br />BlueBin Technical Support
                                        <br />support@BlueBin.com
                                        <br />1-855-TWO-BINS (896-2467)
                                </body></html>"
                    'mail.Body = "Date: " & CurrentTimeTB.Text & ", From: " & NameTB.Text
                    Mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure
                    Mail.ReplyToList.Add("support@BlueBin.com")

                    SmtpServer.Send(Mail)
                    AddUserErrorLabel.Text = "User Created"


                Catch ex As Exception
                    MsgBox(ex.ToString())
                End Try
            End If
            'AddUserErrorLabel.Text = "User Created"
        End If

        GridViewUsers.DataBind()
    End Sub

    Protected Sub GridViewRoles_RowCommand(ByVal sender As System.Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName = "RolesInsert" Then
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            Dim ad As New SqlDataAdapter()
            Dim cmd As New SqlCommand()
            Dim txtRoleName As TextBox = DirectCast(GridViewRoles.FooterRow.FindControl("RoleName"), TextBox)
            cmd.Connection = conn
            cmd.CommandText = "exec sp_InsertRoles '" & txtRoleName.Text & "'"
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
            GridViewRoles.DataBind()
        End If
    End Sub


End Class