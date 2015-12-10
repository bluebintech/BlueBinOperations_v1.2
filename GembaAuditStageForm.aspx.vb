
Imports System
Imports System.Data
Imports System.Web
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class GembaAuditStageForm
    Inherits Page


    Protected Sub GembaAuditStageFormSubmit_Click(sender As Object, e As EventArgs) Handles GembaAuditStageFormSubmit.Click
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
        Dim cmd As New SqlCommand


        cmd.Connection = con
        con.Open()


        Dim Auditer As String
        Dim KanbansFilled As String
        Dim KanbansFilledText As String
        Dim LeftBehind As String
        Dim FollowUpDistrib As String
        Dim FollowUpDistribText As String
        Dim Concerns As String
        Dim DirectOrderBins As String
        Dim OldestBin As String
        Dim CheckedOpenOrders As String
        Dim CheckedOpenOrdersText As String
        Dim HowManyLate As String
        Dim FollowUpBuyers As String
        Dim FollowUpBuyersText As String
        Dim UpdatedStatusTag As String
        Dim UpdatedStatusTagText As String
        Dim ReqsSubmitted As String
        Dim ReqsSubmittedText As String
        Dim BinsInOrder As String
        Dim BinsInOrderText As String
        Dim AreaNeatTidy As String
        Dim AreaNeatTidyText As String
        Dim CartsClean As String
        Dim CartsCleanText As String
        Dim AdditionalCommentsText As String

        Auditer = AuditerTB.Text
        KanbansFilled = KanbansFilledDD.SelectedItem.Value
        KanbansFilledText = KanbansFilledTB.Text
        LeftBehind = LeftBehindDD.SelectedItem.Value
        FollowUpDistrib = FollowUpDistribDD.SelectedItem.Value
        FollowUpDistribText = FollowUpDistribTB.Text
        Concerns = ConcernsTB.Text
        DirectOrderBins = DirectOrderBinsDD.SelectedItem.Value
        OldestBin = OldestBinTB.Text
        CheckedOpenOrders = CheckedOpenOrdersDD.SelectedItem.Value
        CheckedOpenOrdersText = CheckedOpenOrdersTB.Text
        HowManyLate = HowManyLateDD.SelectedItem.Value
        FollowUpBuyers = FollowUpBuyersDD.SelectedItem.Value
        FollowUpBuyersText = FollowUpBuyersTB.Text
        UpdatedStatusTag = UpdatedStatusTagDD.SelectedItem.Value
        UpdatedStatusTagText = UpdatedStatusTagTB.Text
        ReqsSubmitted = ReqsSubmittedDD.SelectedItem.Value
        ReqsSubmittedText = ReqsSubmittedTB.Text
        BinsInOrder = BinsInOrderDD.SelectedItem.Value
        BinsInOrderText = BinsInOrderTB.Text
        AreaNeatTidy = AreaNeatTidyDD.SelectedItem.Value
        AreaNeatTidyText = AreaNeatTidyTB.Text
        CartsClean = CartsCleanDD.SelectedItem.Value
        CartsCleanText = CartsCleanTB.Text
        AdditionalCommentsText = AdditionalCommentsTB.Text

        cmd.CommandType = System.Data.CommandType.Text

        cmd.CommandText = "
    exec sp_InsertGembaAuditStage 
            '" & Auditer & "',
            '" & KanbansFilled & "',
            '" & KanbansFilledText & "',
            '" & LeftBehind & "',
            '" & FollowUpDistrib & "',
            '" & FollowUpDistribText & "',
            '" & Concerns & "',
            '" & DirectOrderBins & "',
            '" & OldestBin & "',
            '" & CheckedOpenOrders & "',
            '" & CheckedOpenOrdersText & "',
            '" & HowManyLate & "',
            '" & FollowUpBuyers & "',
            '" & FollowUpBuyersText & "',
            '" & UpdatedStatusTag & "',
            '" & UpdatedStatusTagText & "',
            '" & ReqsSubmitted & "',
            '" & ReqsSubmittedText & "',
            '" & BinsInOrder & "',
            '" & BinsInOrderText & "',
            '" & AreaNeatTidy & "',
            '" & AreaNeatTidyText & "',
            '" & CartsClean & "',
            '" & CartsCleanText & "',
            '" & AdditionalCommentsText & "'


"

        cmd.ExecuteNonQuery()

        con.Close()
        'MsgBox("New QCN Saved for " & Location)

        Response.Redirect("~/Gemba")
    End Sub
    Protected Sub GembaAuditStageFormCancel_Click(sender As Object, e As EventArgs) Handles GembaAuditStageFormCancel.Click
        Response.Redirect("~/Gemba")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CurrentTime.Text = DateTime.Now.ToString("MM/dd/yyyy")
        AuditerTB.Text = Page.User.Identity.Name.ToString()
    End Sub
End Class