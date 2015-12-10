
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class QCNFormEdit
    Inherits Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        Dim QCNID As String = Request.QueryString("QCNID")
        If Not Page.IsPostBack() Then
            'Comment
            'Comment
            Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            con.Open()
            Dim da As New SqlDataAdapter("exec sp_SelectQCNFormEdit " + QCNID, con)
            Dim dt As New DataTable

            da.Fill(dt)

            'Dim KanbansFilled As Object = dt.Rows(0)("KanbansFilled")
            QCNIDTB.Text = QCNID.ToString()
            DateEnteredTB.Text = dt.Rows(0)("DateEntered").ToString()
            DateCompletedTB.Text = dt.Rows(0)("DateCompleted").ToString()
            LocationDD.SelectedValue = dt.Rows(0)("LocationID").ToString()
            RequesterDD.SelectedValue = dt.Rows(0)("RequesterUser").ToString()
            If (dt.Rows(0)("AssignedUser").ToString()) = ", " Then
                IsNothing(AssignedDD.SelectedValue)
            Else AssignedDD.SelectedValue = dt.Rows(0)("AssignedUser").ToString()
            End If
            QCNTypeDD.SelectedValue = dt.Rows(0)("QCNType").ToString()
            ClinicalDescriptionDD.SelectedValue = dt.Rows(0)("ItemID").ToString()
            QCNStatusDD.SelectedValue = dt.Rows(0)("QCNStatus").ToString()
            DetailsTB.Text = dt.Rows(0)("Details").ToString()
            UpdatesTB.Text = dt.Rows(0)("Updates").ToString()
            LastUpdatedTB.Text = dt.Rows(0)("LastUpdated").ToString()
            con.Close()
        End If
    End Sub


    Protected Sub QCNSubmit_Click(sender As Object, e As EventArgs) Handles QCNSubmit.Click
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
        Dim cmd As New SqlCommand


        cmd.Connection = con
        con.Open()

        Dim UserLogin As String = Page.User.Identity.Name.ToString()
        Dim QCNID As String
        Dim Location As String
        Dim Requester As String
        Dim Assigned As String
        Dim QCNType As String
        Dim Item As String
        Dim QCNStatus As String
        Dim Details As String
        Dim Updates As String
        Dim DateCompleted As String
        Dim LastUpdated As String

        QCNID = QCNIDTB.Text
        Location = LocationDD.SelectedItem.Value
        Requester = RequesterDD.SelectedItem.Value
        Assigned = AssignedDD.SelectedItem.Value
        QCNType = QCNTypeDD.SelectedItem.Value
        Item = ClinicalDescriptionDD.SelectedItem.Value
        QCNStatus = QCNStatusDD.SelectedItem.Value
        Details = DetailsTB.Text
        Updates = UpdatesTB.Text
        DateCompleted = DateCompletedTB.Text
        LastUpdated = LastUpdatedTB.Text

        If String.IsNullOrEmpty(AssignedDD.SelectedItem.Value.ToString()) Then
            Assigned = ", "
        End If


        cmd.CommandType = System.Data.CommandType.Text

        cmd.CommandText = "exec sp_EditQCN
                            '" & QCNID & "',
                            '" & Location & "',
                            '" & Item & "',
                            '" & Requester & "',
                            '" & Assigned & "',
                            '" & QCNType & "',
                            '" & Details & "',
                            '" & Updates & "',
                            '" & QCNStatus & "'

exec sp_InsertMasterLog '" & UserLogin & "','QCN','Edit QCN Form','" & QCNID & "'
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