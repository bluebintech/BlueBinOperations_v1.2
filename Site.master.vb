Imports System.Collections.Generic
Imports System.Security.Claims
Imports System.Security.Principal
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.UserControl
Imports System.Data.SqlClient
Imports System.Data

Partial Public Class SiteMaster
    Inherits MasterPage





    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
        End If

        If Not Page.IsPostBack() Then
            'Comment
            'This populates the Logo displaying from the config value
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


End Class