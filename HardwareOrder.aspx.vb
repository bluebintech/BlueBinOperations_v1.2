Imports System.Data
Imports System.Data.SqlClient

Partial Class HardwareOrder
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack() Then
            'Comment
            'This populates the Customer linked to Hardware tables displaying from the config value
            Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            con.Open()
            Dim da As New SqlDataAdapter("exec sp_SelectHardwareCustomer", con)
            Dim dt As New DataTable

            da.Fill(dt)

            Dim HardwareCustomer As String = dt.Rows(0)("ConfigValue").ToString()
            con.Close()

            Dim SqlDataSourceHardware As New SqlDataSource()
            SqlDataSourceHardware.ID = "SqlDataSourceHardware"
            Me.Page.Controls.Add(SqlDataSourceHardware)
            SqlDataSourceHardware.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("BlueBinHardwareConnectionString").ConnectionString
            SqlDataSourceHardware.SelectCommand =
                "exec sp_SelectHardwareOrders '" & HardwareCustomer & "'"
            GridViewHardware.DataSource = SqlDataSourceHardware

            GridViewHardware.DataBind()
            GridView2.DataBind()
        End If
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles NewHardware.Click
        Response.Redirect("~/HardwareOrderNew")
        GridViewHardware.DataBind()
    End Sub


End Class