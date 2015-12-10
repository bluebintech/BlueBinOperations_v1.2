
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.UserControl



Public Class Dashboard
    Inherits Page
    Protected TableauFullURL As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
        con.Open()
        Dim da As New SqlDataAdapter("exec sp_SelectTableauURL", con)
        Dim dt As New DataTable

        da.Fill(dt)

        Dim TableaURLDB As String = dt.Rows(0)("ConfigValue").ToString()
        TableauFullURL = "https://10ay.online.tableau.com/#/site" & TableaURLDB & "Home"

        con.Close()

    End Sub


    '/bluebinanalytics/views/MHS/Home
    ' TableauFullURL.ToString()
End Class