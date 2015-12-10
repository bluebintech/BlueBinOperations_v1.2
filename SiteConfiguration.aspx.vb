Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Configuration

Partial Class SiteConfiguration
    Inherits Page

    Protected Sub AdvancedConfigB_Click(sender As Object, e As EventArgs) Handles AdvancedConfigB.Click
        GridViewConfig.Visible = True
        GridViewQCNType.Visible = False
        GridViewQCNStatus.Visible = False
        GridViewConfig.DataBind()
        hiddenConfig.Visible = True
        hiddenQCNType.Visible = False
        hiddenQCNStatus.Visible = False
    End Sub

    Protected Sub QCNTypeConfigB_Click(sender As Object, e As EventArgs) Handles QCNTypeConfigB.Click
        GridViewConfig.Visible = False
        GridViewQCNType.Visible = True
        GridViewQCNStatus.Visible = False
        GridViewQCNType.DataBind()
        hiddenQCNType.Visible = True
        hiddenConfig.Visible = False
        hiddenQCNStatus.Visible = False
    End Sub

    Protected Sub QCNStatusConfigB_Click(sender As Object, e As EventArgs) Handles QCNStatusConfigB.Click
        GridViewConfig.Visible = False
        GridViewQCNType.Visible = False
        GridViewQCNStatus.Visible = True
        GridViewQCNStatus.DataBind()
        hiddenQCNStatus.Visible = True
        hiddenConfig.Visible = False
        hiddenQCNType.Visible = False
    End Sub

    Protected Sub AllConfigB_Click(sender As Object, e As EventArgs) Handles AllConfigB.Click
        GridViewConfig.Visible = True
        GridViewQCNType.Visible = True
        GridViewQCNStatus.Visible = True
        GridViewQCNType.DataBind()
        GridViewQCNStatus.DataBind()
        hiddenConfig.Visible = True
        hiddenQCNType.Visible = True
        hiddenQCNStatus.Visible = True
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack() Then
            GridViewConfig.DataBind()
            GridViewQCNType.DataBind()
            GridViewQCNStatus.DataBind()
            GridViewConfig.Visible = False
            GridViewQCNType.Visible = False
            GridViewQCNStatus.Visible = False
        End If
    End Sub

    Protected Sub GridViewConfig_RowCommand(ByVal sender As System.Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName = "ConfigInsert" Then
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            Dim ad As New SqlDataAdapter()
            Dim cmd As New SqlCommand()
            Dim txtConfigName As TextBox = DirectCast(GridViewConfig.FooterRow.FindControl("ConfigName"), TextBox)
            Dim txtConfigValue As TextBox = DirectCast(GridViewConfig.FooterRow.FindControl("ConfigValue"), TextBox)
            Dim txtConfigType As String = TryCast(GridViewConfig.FooterRow.FindControl("ConfigTypeInsertDDF"), DropDownList).SelectedItem.Value
            cmd.Connection = conn
            cmd.CommandText = "exec sp_InsertConfig '" + txtConfigName.Text & "','" + txtConfigValue.Text & "','" + txtConfigType & "'"
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
            GridViewConfig.DataBind()
        End If
    End Sub

    Protected Sub GridViewQCNType_RowCommand(ByVal sender As System.Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName = "QCNTypeInsert" Then
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            Dim ad As New SqlDataAdapter()
            Dim cmd As New SqlCommand()
            Dim txtName As TextBox = DirectCast(GridViewQCNType.FooterRow.FindControl("Name"), TextBox)
            cmd.Connection = conn
            cmd.CommandText = "exec sp_InsertQCNType '" + txtName.Text & "'"
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
            GridViewQCNType.DataBind()
        End If
    End Sub

    Protected Sub GridViewQCNStatus_RowCommand(ByVal sender As System.Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName = "QCNStatusInsert" Then
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            Dim ad As New SqlDataAdapter()
            Dim cmd As New SqlCommand()
            Dim txtStatus As TextBox = DirectCast(GridViewQCNStatus.FooterRow.FindControl("Status"), TextBox)
            cmd.Connection = conn
            cmd.CommandText = "exec sp_InsertQCNStatus '" + txtStatus.Text & "'"
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
            GridViewQCNStatus.DataBind()
        End If
    End Sub
End Class