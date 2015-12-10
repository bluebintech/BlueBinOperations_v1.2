Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Imports System.ComponentModel
Imports System.Drawing
Imports System.IO
Imports System.Net.Mail
Imports System.Web.UI.WebControls

Partial Public Class Login
    Inherits Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

        If Not Page.IsPostBack() Then
            Login1.Visible = True
            ForgotPasswordLinkTable.Visible = True
            ForgotPasswordTable.Visible = False
            ChangePassword1.Visible = False

            Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            con.Open()
            Dim da As New SqlDataAdapter("exec sp_SelectVersion", con)
            Dim dt As New DataTable

            da.Fill(dt)

            Dim Version As String = dt.Rows(0)("ConfigValue").ToString()
            LabelVersion.Text = "Version " & Version

            con.Close()

        End If

    End Sub
    Protected Sub ValidateUser(sender As Object, e As EventArgs)
        Dim BlueBinUserID As Integer

        Dim constr As String = ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("sp_ValidateBlueBinUser")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UserLogin", Login1.UserName)
                cmd.Parameters.AddWithValue("@Password", Login1.Password)
                cmd.Connection = con
                con.Open()
                BlueBinUserID = Convert.ToInt32(cmd.ExecuteScalar())
                con.Close()
            End Using
            Select Case BlueBinUserID
                Case -1
                    Login1.FailureText = "UserLogin and/or password is incorrect."
                    Exit Select
                Case -2
                    Login1.FailureText = "Account is currently disabled  Please contact BlueBin Support to reactivate."
                    Exit Select
                Case -3
                    Login1.FailureText = "Password is Expired.  Please Change your password below."
                    Login1.Visible = True
                    Login1.Enabled = False

                    ForgotPasswordLinkTable.Visible = False
                    ChangePassword1.Visible = True


                    Exit Select
                Case Else
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet)
                    Exit Select
            End Select
        End Using
    End Sub

    Protected Sub OnChangingPassword(sender As Object, e As LoginCancelEventArgs)
        Dim BlueBinUserID As Integer
        'Dim query As String = "exec sp_ChangePasswordBlueBinUser @UserLogin,@OldPassword,@NewPassword,@ConfirmNewPassword"
        Dim constr As String = ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("sp_ChangePasswordBlueBinUser")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UserLogin", Login1.UserName)
                cmd.Parameters.AddWithValue("@OldPassword", ChangePassword1.CurrentPassword)
                cmd.Parameters.AddWithValue("@NewPassword", ChangePassword1.NewPassword)
                cmd.Parameters.AddWithValue("@ConfirmNewPassword", ChangePassword1.ConfirmNewPassword)
                cmd.Connection = con
                con.Open()
                'cmd.ExecuteNonQuery()
                BlueBinUserID = Convert.ToInt32(cmd.ExecuteScalar())
                con.Close()
            End Using
            Select Case BlueBinUserID
                Case -1
                    ChangePassword1.ChangePasswordFailureText = "Passwords do Not match."
                    Exit Select
                Case -2
                    ChangePassword1.ChangePasswordFailureText = "Must use a different password than previous."
                    Exit Select
                Case -3
                    ChangePassword1.ChangePasswordFailureText = "Must use at least one number in New Password."
                    Exit Select
                Case -4
                    ChangePassword1.ChangePasswordFailureText = "Old Password does Not match with our database records."

                    Exit Select
                Case Else
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet)
                    Exit Select
            End Select

        End Using
        ChangePasswordErrorL.Text = ChangePassword1.ChangePasswordFailureText
        e.Cancel = True
    End Sub

    Protected Sub ForgotPasswordLB_Click(sender As Object, e As EventArgs) Handles ForgotPasswordLB.Click
        Login1.Visible = True
        Login1.Enabled = False
        ForgotPasswordLinkTable.Visible = True
        ForgotPasswordTable.Visible = True
        ChangePassword1.Visible = False

    End Sub

    Protected Sub ForgotPasswordB_Click(sender As System.Object, e As System.EventArgs) Handles ForgotPasswordB.Click
        Dim UserLogin As String = ForgotPasswordTB.Text
        Dim NewPWD As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("sp_ForgotPasswordBlueBinUser")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UserLogin", UserLogin)
                cmd.Connection = con
                con.Open()
                'cmd.ExecuteNonQuery()
                NewPWD = Convert.ToString(cmd.ExecuteScalar())
                con.Close()
            End Using
        End Using

        Dim SmtpServer As New SmtpClient()
        SmtpServer.Credentials = New Net.NetworkCredential("BlueBinTrac@gmail.com", "BBT2015!")
        SmtpServer.Port = 587
        SmtpServer.Host = "smtp.gmail.com"
        SmtpServer.EnableSsl = True

        Dim Mail As New MailMessage()
        Dim addr() As String = ForgotPasswordTB.Text.Split(",")
        Try
            Mail.From = New MailAddress("support@BlueBin.com",
                "Reset Password for BlueBin Account", System.Text.Encoding.UTF8)
            Dim i As Byte
            For i = 0 To addr.Length - 1

            Next

            Mail.[To].Add(New MailAddress(ForgotPasswordTB.Text))
            Mail.Bcc.Add(New MailAddress("gbutler@bluebin.com"))
            Mail.Subject = "Reset Password for BlueBin Account - " & ForgotPasswordTB.Text
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
                            "<br /><br />You are receiving this email as the result of a New Password Request made at your BlueBin.com site.  
                            <br /><br />Your new password is below. Please enter your new Password at the Login screen.  You will be prompted to change the password to a new one on successful entry.
                            <br /><br />Thank you and have a great day!" &
                                "<br /><br />
                                <table>
                                <tr>
                                    <th>UserID</th>
                                    <th>Password</th>
                                </tr>" &
                                "<tr><td>" & UserLogin & "</td><td>" & NewPWD & "</td></tr></table>" &
                                "<br /><br /><b>If you did not request a new password, please contact BlueBin Support at your earliest convenience at support@bluebin.com.</b>  " &
                        "<br /><br /><br />BlueBin Technical Support
                                <br />support@BlueBin.com
                                <br />1-855-TWO-BINS (896-2467)
                        </body></html>"
            'mail.Body = "Date: " & CurrentTimeTB.Text & ", From: " & NameTB.Text
            Mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure
            Mail.ReplyToList.Add("support@BlueBin.com")
            SmtpServer.Send(Mail)
        Catch ex As Exception
            MsgBox(ex.ToString())
        End Try
        Response.Redirect("~/Login")
        Login1.Visible = True
        ForgotPasswordLinkTable.Visible = True
        ForgotPasswordTable.Visible = False
        ChangePassword1.Visible = False
    End Sub

End Class


