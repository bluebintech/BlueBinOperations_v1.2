Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack() Then
            'Comment
            'Comment
            Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            con.Open()
            Dim da As New SqlDataAdapter("exec sp_SelectLogoImage", con)
            Dim dt As New DataTable

            da.Fill(dt)

            Dim LogoString As String = dt.Rows(0)("ConfigValue").ToString()
            LogoImage.ImageUrl = "~/img/" & LogoString

            con.Close()
        End If
    End Sub


End Class