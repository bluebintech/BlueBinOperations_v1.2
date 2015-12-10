Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security

Partial Public Class QCNReportViewer
    Inherits Page
    Protected TableauFullURL As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
        con.Open()
        Dim da As New SqlDataAdapter("exec sp_SelectTableauURL", con)
        Dim dt As New DataTable

        da.Fill(dt)
        Dim Report As String = "/QCNDashboard"
        Dim TableaURLDB As String = dt.Rows(0)("ConfigValue").ToString()
        TableauFullURL = "https://10ay.online.tableau.com/#/site" & TableaURLDB & "QCNDashboard"

        con.Close()
    End Sub
End Class


