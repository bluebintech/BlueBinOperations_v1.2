
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class QCNForm
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CurrentTimeTB.Text = DateTime.Now.ToString("MM/dd/yyyy")

    End Sub

    Protected Sub QCNSubmit_Click(sender As Object, e As EventArgs) Handles QCNSubmit.Click
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
        Dim cmd As New SqlCommand


        cmd.Connection = con
        con.Open()

        Dim UserLogin As String = Page.User.Identity.Name.ToString()
        Dim Location As String
        Dim Item As String
        Dim Requester As String
        Dim Assigned As String
        Dim QCNType As String
        Dim QCNStatus As String
        Dim Details As String
        Dim Updates As String

        Location = LocationDD.SelectedItem.Value
        Item = ClinicalDescriptionDD.SelectedItem.Value
        Requester = RequesterDD.SelectedItem.Value
        Assigned = AssignedDD.SelectedItem.Value
        QCNType = QCNTypeDD.SelectedItem.Value
        QCNStatus = QCNStatusDD.SelectedItem.Value
        Details = DetailsTB.Text
        Updates = UpdatesTB.Text

        If String.IsNullOrEmpty(AssignedDD.SelectedItem.Value.ToString()) Then
            Assigned = ", "
        End If


        cmd.CommandType = System.Data.CommandType.Text

        cmd.CommandText = "
                exec sp_InsertQCN
                '" & Location & "',
                '" & Item & "',
                '" & Requester & "',
                '" & Assigned & "',
                '" & QCNType & "',
                '" & Details & "',
                '" & Updates & "',
                '" & QCNStatus & "',
                '" & UserLogin & "'


"



        cmd.ExecuteNonQuery()

        con.Close()
        'MsgBox("New QCN Saved for " & Location)

        Response.Redirect("~/QCN")
    End Sub
    Protected Sub QCNCancel_Click(sender As Object, e As EventArgs) Handles QCNCancel.Click
        Response.Redirect("~/QCN")
    End Sub
End Class