Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Configuration

Partial Class Resources
    Inherits Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack() Then
            GridViewBlueBinResource.DataBind()
        End If
    End Sub
    Protected Sub BlueBinResource_RowCommand(ByVal sender As System.Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName = "ResourceInsert" Then
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            Dim ad As New SqlDataAdapter()
            Dim cmd As New SqlCommand()
            Dim txtLastName As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("LastName"), TextBox)
            Dim txtFirstName As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("FirstName"), TextBox)
            Dim txtMiddleName As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("MiddleName"), TextBox)
            Dim txtLogin As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("Login"), TextBox)
            Dim txtEmail As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("Email"), TextBox)
            Dim txtTitle As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("Title"), TextBox)
            Dim txtPhone As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("Phone"), TextBox)
            Dim txtCell As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("Cell"), TextBox)

            cmd.Connection = conn
            cmd.CommandText = "exec sp_InsertBlueBinResource 
                                '" + txtLastName.Text & "',
                                    '" + txtFirstName.Text & "',
                                        '" + txtMiddleName.Text & "',
                                                    '" + txtLogin.Text & "',
                                                        '" + txtEmail.Text & "',
                                                                    '" + txtPhone.Text & "',
                                                                            '" + txtCell.Text & "',
                                                                                    '" + txtTitle.Text & "'"
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
            GridViewBlueBinResource.DataBind()
        End If
    End Sub

    Protected Sub ExportToExcelResouces(sender As Object, e As EventArgs)
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=ResourcesExport.xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Using sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            'To Export all pages
            GridViewBlueBinResource.AllowPaging = False
            GridViewBlueBinResource.DataBind()
            GridViewBlueBinResource.HeaderRow.BackColor = Color.White
            GridViewBlueBinResource.HeaderRow.Cells(0).Visible = False
            GridViewBlueBinResource.FooterRow.Visible = False

            For Each cell As TableCell In GridViewBlueBinResource.HeaderRow.Cells
                cell.BackColor = GridViewBlueBinResource.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In GridViewBlueBinResource.Rows
                row.BackColor = Color.White
                row.Cells(0).Visible = False
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = GridViewBlueBinResource.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = GridViewBlueBinResource.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"


                Next
            Next

            GridViewBlueBinResource.RenderControl(hw)
            'style to format numbers to string
            Dim style As String = "<style> .textmode { } </style>"
            Response.Write(Regex.Replace(sw.ToString(), "(<a[^>]*>)|(</a>)", " ", RegexOptions.IgnoreCase))

            Response.[End]()
        End Using
    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub



End Class