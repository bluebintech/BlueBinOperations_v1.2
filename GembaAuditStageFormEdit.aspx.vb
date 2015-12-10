
Imports System
Imports System.Data
Imports System.Web
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class GembaAuditStageFormEdit
    Inherits Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        Dim GembaAuditStageID As String = Request.QueryString("GembaAuditStageID")
        If Not Page.IsPostBack() Then
            'Comment
            'Comment
            Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            con.Open()
            Dim da As New SqlDataAdapter("exec sp_SelectGembaAuditStageEdit " + GembaAuditStageID, con)
            Dim dt As New DataTable

            da.Fill(dt)

            'Dim KanbansFilled As Object = dt.Rows(0)("KanbansFilled")
            GembaAuditStageIDTB.Text = dt.Rows(0)("GembaAuditStageID").ToString()
            CurrentTimeTB.Text = dt.Rows(0)("Date").ToString()
            LastUpdatedTB.Text = dt.Rows(0)("LastUpdated").ToString()
            AuditerTB.Text = dt.Rows(0)("Auditer").ToString()
            KanbansFilledDD.SelectedValue = dt.Rows(0)("KanbansFilled").ToString() 'KanbansFilled.ToString()
            KanbansFilledTB.Text = dt.Rows(0)("KanbansFilledText").ToString()
            LeftBehindDD.SelectedValue = dt.Rows(0)("LeftBehind").ToString()
            FollowUpDistribDD.SelectedValue = dt.Rows(0)("FollowUpDistrib").ToString()
            FollowUpDistribTB.Text = dt.Rows(0)("FollowUpDistribText").ToString()
            DirectOrderBinsDD.SelectedValue = dt.Rows(0)("DirectOrderBins").ToString()
            OldestBinTB.Text = dt.Rows(0)("OldestBin").ToString()
            CheckedOpenOrdersDD.SelectedValue = dt.Rows(0)("CheckOpenOrders").ToString()
            CheckedOpenOrdersTB.Text = dt.Rows(0)("CheckOpenOrdersText").ToString()
            HowManyLateDD.SelectedValue = dt.Rows(0)("HowManyLate").ToString()
            FollowUpBuyersDD.SelectedValue = dt.Rows(0)("FollowUpBuyers").ToString()
            FollowUpBuyersTB.Text = dt.Rows(0)("FollowUpBuyersText").ToString()
            UpdatedStatusTagDD.SelectedValue = dt.Rows(0)("UpdatedStatusTag").ToString()
            UpdatedStatusTagTB.Text = dt.Rows(0)("UpdatedStatusTagText").ToString()
            ReqsSubmittedDD.SelectedValue = dt.Rows(0)("ReqsSubmitted").ToString()
            ReqsSubmittedTB.Text = dt.Rows(0)("ReqsSubmittedText").ToString()
            BinsInOrderDD.SelectedValue = dt.Rows(0)("BinsInOrder").ToString()
            BinsInOrderTB.Text = dt.Rows(0)("BinsInOrderText").ToString()
            AreaNeatTidyDD.SelectedValue = dt.Rows(0)("AreaNeatTidy").ToString()
            AreaNeatTidyTB.Text = dt.Rows(0)("AreaNeatTidyText").ToString()
            CartsCleanDD.SelectedValue = dt.Rows(0)("CartsClean").ToString()
            CartsCleanTB.Text = dt.Rows(0)("CartsCleanText").ToString()
            AdditionalCommentsTB.Text = dt.Rows(0)("AdditionalComments").ToString()
            ConcernsTB.Text = dt.Rows(0)("Concerns").ToString()
            con.Close()
        End If
    End Sub

    Protected Sub GembaAuditStageFormSubmit_Click(sender As Object, e As EventArgs) Handles GembaAuditStageFormSubmit.Click
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)

        con.Open()

        Dim GembaAuditStageID As String
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

        GembaAuditStageID = GembaAuditStageIDTB.Text
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


        Dim UpdateString As String = "
exec sp_EditGembaAuditStage
	'" & GembaAuditStageID & "',
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
    
exec sp_InsertMasterLog '" & Auditer & "','Gemba','Update Gemba Stage Audit','" & GembaAuditStageID & "' 
"

        Dim Updatecmd As New SqlCommand(UpdateString, con)
            Trace.Write(UpdateString)
            Updatecmd.ExecuteNonQuery()
            'MsgBox("Audit Updated " & AdditionalCommentsText)

            con.Close()

        Response.Redirect("~/Gemba")
    End Sub

    Protected Sub GembaAuditStageFormCancel_Click(sender As Object, e As EventArgs) Handles GembaAuditStageFormCancel.Click
        Response.Redirect("~/Gemba")
    End Sub

End Class