
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.IO

Partial Class GembaAuditNodeForm
    Inherits Page

    Dim ImageSourceIDPH As String = DateTime.Now.ToString("yyMMdd")
    Dim UserLogin As String = Page.User.Identity.Name.ToString()
    Dim PS_EmptyBins As Integer = 0
    Dim PS_BackBins As Integer = 0
    Dim PS_StockOuts As Integer = 0
    Dim PS_ReturnVolume As Integer = 0
    Dim PS_NonBBT As Integer = 0
    Dim PS_OrangeCones As Integer = 0
    Dim PS_Comments As String
    Dim RS_BinsFilled As Integer = 0
    Dim RS_EmptiesCollected As Integer = 0
    Dim RS_BinServices As Integer = 0
    Dim RS_NodeSwept As Integer = 0
    Dim RS_NodeCorrections As Integer = 0
    Dim RS_ShadowedUser As String
    Dim RS_Comments As String
    Dim SS_Supplied As Integer = 0
    Dim SS_KanbansPP As Integer = 0
    Dim SS_StockoutsPT As Integer = 0
    Dim SS_StockoutsMatch As Integer = 0
    Dim SS_HuddleBoardMatch As Integer = 0
    Dim SS_Comments As String
    Dim NIS_Labels As Integer = 0
    Dim NIS_CardHolders As Integer = 0
    Dim NIS_BinsRacks As Integer = 0
    Dim NIS_GeneralAppearance As Integer = 0
    Dim NIS_Signage As Integer = 0
    Dim NIS_Comments As String
    Dim PS_TotalScore As Integer = 0
    Dim RS_TotalScore As Integer = 0
    Dim SS_TotalScore As Integer = 0
    Dim NIS_TotalScore As Integer = 0
    Dim TotalScore As Integer = 0



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CurrentTimeTB.Text = DateTime.Now.ToString("MM/dd/yyyy")
        AuditerTB.Text = UserLogin
        GridViewImages.Visible = True
        hiddenImages.Visible = True

        'UserLogin2 As System.Security.Principal.IPrincipal = System.Web.HttpContext.Current.User
    End Sub


    Public Sub GembaAuditNodeFormSubmit_Click(sender As Object, e As EventArgs) Handles GembaAuditNodeFormSubmit.Click
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
        Dim cmd As New SqlCommand

        cmd.Connection = con
        con.Open()

        Dim Location As String
        Dim Auditer As String
        Dim AdditionalComments As String


        'Pull Standards
        PS_EmptyBins = PS_EmptyBinsRL.SelectedValue
        PS_BackBins = PS_BackBinsRL.SelectedValue
        PS_StockOuts = PS_StockOutsRL.SelectedValue
        PS_ReturnVolume = PS_ReturnVolumeRL.SelectedValue
        PS_NonBBT = PS_NonBBTRL.SelectedValue
        PS_OrangeCones = PS_OrangeConesDD.SelectedValue


        'Replenishment
        RS_BinsFilled = RS_BinsFilledRL.SelectedValue
        RS_EmptiesCollected = RS_EmptiesCollectedRL.SelectedValue
        RS_BinServices = RS_BinServicesRL.SelectedValue
        RS_NodeSwept = RS_NodeSweptRL.SelectedValue
        RS_NodeCorrections = RS_NodeCorrectionsRL.SelectedValue

        'Stage
        SS_Supplied = SS_SuppliedRL.SelectedValue
        SS_KanbansPP = SS_KanbansPPRL.SelectedValue
        SS_StockoutsPT = SS_StockoutsPTRL.SelectedValue
        SS_StockoutsMatch = SS_StockoutsMatchRL.SelectedValue
        SS_HuddleBoardMatch = SS_HuddleBoardMatchRL.SelectedValue

        'NodeIntegrity
        NIS_Labels = NIS_LabelsRL.SelectedValue
        NIS_CardHolders = NIS_CardHoldersRL.SelectedValue
        NIS_BinsRacks = NIS_BinsRacksRL.SelectedValue
        NIS_GeneralAppearance = NIS_GeneralAppearanceRL.SelectedValue
        NIS_Signage = NIS_SignageRL.SelectedValue



        Location = LocationDD.SelectedItem.Value
        Auditer = AuditerTB.Text
        AdditionalComments = AdditionalCommentsTB.Text
        PS_Comments = PSCommentsTB.Text
        RS_Comments = RSCommentsTB.Text
        SS_Comments = SS_CommentsTB.Text
        RS_ShadowedUser = ShadowedUserDD.SelectedItem.Value
        NIS_Comments = NISCommentsTB.Text
        cmd.CommandType = System.Data.CommandType.Text
        PS_TotalScore = PS_EmptyBins + PS_BackBins + PS_StockOuts + PS_ReturnVolume + PS_NonBBT
        RS_TotalScore = RS_BinsFilled + RS_EmptiesCollected + RS_BinServices + RS_NodeSwept + RS_NodeCorrections
        SS_TotalScore = SS_Supplied + SS_KanbansPP + SS_StockoutsPT + SS_StockoutsMatch + SS_HuddleBoardMatch
        NIS_TotalScore = NIS_Labels + NIS_CardHolders + NIS_BinsRacks + NIS_GeneralAppearance + NIS_Signage
        TotalScore = PS_TotalScore + RS_TotalScore + SS_TotalScore + NIS_TotalScore
        TotalScore = TotalScore.ToString
        PS_TotalScore = PS_TotalScore.ToString
        RS_TotalScore = RS_TotalScore.ToString
        SS_TotalScore = SS_TotalScore.ToString
        NIS_TotalScore = NIS_TotalScore.ToString
        cmd.CommandText = "

                    exec sp_InsertGembaAuditNode
                    '" & Location & "',
                    '" & Auditer & "',
                    '" & AdditionalComments & "',
                    '" & PS_EmptyBins & "',
                    '" & PS_BackBins & "',
                    '" & PS_StockOuts & "',
                    '" & PS_ReturnVolume & "',
                    '" & PS_NonBBT & "',
                    '" & PS_OrangeCones & "',
                    '" & PS_Comments & "',
                    '" & RS_BinsFilled & "',
                    '" & RS_EmptiesCollected & "',
                    '" & RS_BinServices & "',
                    '" & RS_NodeSwept & "',
                    '" & RS_NodeCorrections & "',
                    '" & RS_ShadowedUser & "',
                    '" & RS_Comments & "',
                    '" & SS_Supplied & "',
                    '" & SS_KanbansPP & "',
                    '" & SS_StockoutsPT & "',
                    '" & SS_StockoutsMatch & "',
                    '" & SS_HuddleBoardMatch & "',
                    '" & SS_Comments & "',
                    '" & NIS_Labels & "',
                    '" & NIS_CardHolders & "',
                    '" & NIS_BinsRacks & "',
                    '" & NIS_GeneralAppearance & "',
                    '" & NIS_Signage & "',
                    '" & NIS_Comments & "',
                    '" & PS_TotalScore & "',
                    '" & RS_TotalScore & "',
                    '" & SS_TotalScore & "',
                    '" & NIS_TotalScore & "',
                    '" & TotalScore & "',
                                            '" & ImageSourceIDPH & "'


"
        cmd.ExecuteNonQuery()


        'MsgBox("New Gemba Saved for with score = " & TotalScore & "")
        Response.Redirect("~/Gemba")

        PullStandardTB.Text = PS_TotalScore
        ReplenishmentTB.Text = RS_TotalScore
        StageTB.Text = SS_TotalScore
        NodeIntegrityTB.Text = NIS_TotalScore
        TotalScoreTB.Text = TotalScore
    End Sub


    Protected Sub GembaAuditNodeFormCancel_Click(sender As Object, e As EventArgs) Handles GembaAuditNodeFormCancel.Click
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
        Dim cmd As New SqlCommand

        cmd.Connection = con
        con.Open()

        cmd.CommandText = "exec sp_DeleteImages '" & UserLogin & "','" & ImageSourceIDPH & "'"
        cmd.ExecuteNonQuery()
        Response.Redirect("~/Gemba")
    End Sub

    Protected Sub GembaAuditNodeFormSubmit_Calculate(sender As Object, e As EventArgs) Handles GembaAuditNodeFormCalculate.Click
        'Pull Standards
        PS_EmptyBins = PS_EmptyBinsRL.SelectedValue
        PS_BackBins = PS_BackBinsRL.SelectedValue
        PS_StockOuts = PS_StockOutsRL.SelectedValue
        PS_ReturnVolume = PS_ReturnVolumeRL.SelectedValue
        PS_NonBBT = PS_NonBBTRL.SelectedValue


        'Replenishment
        RS_BinsFilled = RS_BinsFilledRL.SelectedValue
        RS_EmptiesCollected = RS_EmptiesCollectedRL.SelectedValue
        RS_BinServices = RS_BinServicesRL.SelectedValue
        RS_NodeSwept = RS_NodeSweptRL.SelectedValue
        RS_NodeCorrections = RS_NodeCorrectionsRL.SelectedValue

        'Stage
        SS_Supplied = SS_SuppliedRL.SelectedValue
        SS_KanbansPP = SS_KanbansPPRL.SelectedValue
        SS_StockoutsPT = SS_StockoutsPTRL.SelectedValue
        SS_StockoutsMatch = SS_StockoutsMatchRL.SelectedValue
        SS_HuddleBoardMatch = SS_HuddleBoardMatchRL.SelectedValue

        'NodeIntegrity
        NIS_Labels = NIS_LabelsRL.SelectedValue
        NIS_CardHolders = NIS_CardHoldersRL.SelectedValue
        NIS_BinsRacks = NIS_BinsRacksRL.SelectedValue
        NIS_GeneralAppearance = NIS_GeneralAppearanceRL.SelectedValue
        NIS_Signage = NIS_SignageRL.SelectedValue


        PS_TotalScore = PS_EmptyBins + PS_BackBins + PS_StockOuts + PS_ReturnVolume + PS_NonBBT
        RS_TotalScore = RS_BinsFilled + RS_EmptiesCollected + RS_BinServices + RS_NodeSwept + RS_NodeCorrections
        SS_TotalScore = SS_Supplied + SS_KanbansPP + SS_StockoutsPT + SS_StockoutsMatch + SS_HuddleBoardMatch
        NIS_TotalScore = NIS_Labels + NIS_CardHolders + NIS_BinsRacks + NIS_GeneralAppearance + NIS_Signage
        TotalScore = PS_TotalScore + RS_TotalScore + SS_TotalScore + NIS_TotalScore
        TotalScore = TotalScore.ToString
        PS_TotalScore = PS_TotalScore.ToString
        RS_TotalScore = RS_TotalScore.ToString
        SS_TotalScore = SS_TotalScore.ToString
        NIS_TotalScore = NIS_TotalScore.ToString

        PullStandardTB.Text = PS_TotalScore
        ReplenishmentTB.Text = RS_TotalScore
        StageTB.Text = SS_TotalScore
        NodeIntegrityTB.Text = NIS_TotalScore
        TotalScoreTB.Text = TotalScore

        GridViewImages.Visible = True
        hiddenImages.Visible = True
    End Sub


    Protected Sub picInsertPS_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles picInsertPS.Click
        'Make sure a file has been successfully uploaded
        If UploadedPicPS.PostedFile Is Nothing OrElse String.IsNullOrEmpty(UploadedPicPS.PostedFile.FileName) OrElse UploadedPicPS.PostedFile.InputStream Is Nothing Then
            Response.Write("Please upload a GIF, TIFF or JPEG file")
            Exit Sub
        End If

        'Make sure we are dealing with a JPG or GIF file
        Dim extension As String = Path.GetExtension(UploadedPicPS.PostedFile.FileName).ToLower()
        Dim ImageType As String = Nothing

        Select Case extension
            Case ".gif"
                ImageType = "image/gif"
            Case ".jpg", ".jpeg", ".jpe"
                ImageType = "image/jpeg"
            Case ".png"
                ImageType = "image/png"

            Case Else
                'Invalid file type uploaded
                Response.Write("Please upload a GIF, TIFF or JPEG file")
                Exit Sub
        End Select


        'Connect to the database and insert a new record into Products
        Using myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)

            Const SQL As String = "exec sp_InsertImage @ImageName,@ImageType,@ImageSource,@UserLogin,@ImageSourceID,@Image"
            Dim myCommand As New SqlCommand(SQL, myConnection)
            myCommand.Parameters.AddWithValue("@ImageName", ImageNamePSTB.Text)
            myCommand.Parameters.AddWithValue("@ImageType", ImageType)
            myCommand.Parameters.AddWithValue("@ImageSource", "GembaAuditNode_PS")
            myCommand.Parameters.AddWithValue("@ImageSourceID", ImageSourceIDPH)
            myCommand.Parameters.AddWithValue("@UserLogin", UserLogin)

            'Load FileUpload's InputStream into Byte array
            Dim imageBytes(UploadedPicPS.PostedFile.InputStream.Length) As Byte
            UploadedPicPS.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length)
            myCommand.Parameters.AddWithValue("@Image", imageBytes)

            myConnection.Open()
            myCommand.ExecuteNonQuery()
            myConnection.Close()

        End Using

        Dim SqlDataSourceImages As New SqlDataSource()
        SqlDataSourceImages.ID = "SqlDataSourceImages"
        Me.Page.Controls.Add(SqlDataSourceImages)
        SqlDataSourceImages.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString
        SqlDataSourceImages.SelectCommand = "exec sp_SelectImages '','" & UserLogin & "','" & ImageSourceIDPH & "'"
        GridViewImages.DataSource = SqlDataSourceImages
        GridViewImages.DataBind()
        GridViewImages.Visible = True
        hiddenImages.Visible = True
        ImageNamePSTB.Text = ""
    End Sub

    Protected Sub picInsertRS_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles picInsertRS.Click
        'Make sure a file has been successfully uploaded
        If UploadedPicRS.PostedFile Is Nothing OrElse String.IsNullOrEmpty(UploadedPicRS.PostedFile.FileName) OrElse UploadedPicRS.PostedFile.InputStream Is Nothing Then
            Response.Write("Please upload a GIF, TIFF or JPEG file")
            Exit Sub
        End If

        'Make sure we are dealing with a JPG or GIF file
        Dim extension As String = Path.GetExtension(UploadedPicRS.PostedFile.FileName).ToLower()
        Dim ImageType As String = Nothing

        Select Case extension
            Case ".gif"
                ImageType = "image/gif"
            Case ".jpg", ".jpeg", ".jpe"
                ImageType = "image/jpeg"
            Case ".png"
                ImageType = "image/png"

            Case Else
                'Invalid file type uploaded
                Response.Write("Please upload a GIF, TIFF or JPEG file")
                Exit Sub
        End Select


        'Connect to the database and insert a new record into Products
        Using myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)

            Const SQL As String = "exec sp_InsertImage @ImageName,@ImageType,@ImageSource,@UserLogin,@ImageSourceID,@Image"
            Dim myCommand As New SqlCommand(SQL, myConnection)
            myCommand.Parameters.AddWithValue("@ImageName", ImageNameRSTB.Text)
            myCommand.Parameters.AddWithValue("@ImageType", ImageType)
            myCommand.Parameters.AddWithValue("@ImageSource", "GembaAuditNode_RS")
            myCommand.Parameters.AddWithValue("@ImageSourceID", ImageSourceIDPH)
            myCommand.Parameters.AddWithValue("@UserLogin", UserLogin)

            'Load FileUpload's InputStream into Byte array
            Dim imageBytes(UploadedPicRS.PostedFile.InputStream.Length) As Byte
            UploadedPicRS.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length)
            myCommand.Parameters.AddWithValue("@Image", imageBytes)

            myConnection.Open()
            myCommand.ExecuteNonQuery()
            myConnection.Close()

        End Using

        Dim SqlDataSourceImages As New SqlDataSource()
        SqlDataSourceImages.ID = "SqlDataSourceImages"
        Me.Page.Controls.Add(SqlDataSourceImages)
        SqlDataSourceImages.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString
        SqlDataSourceImages.SelectCommand = "exec sp_SelectImages '','" & UserLogin & "','" & ImageSourceIDPH & "'"
        GridViewImages.DataSource = SqlDataSourceImages
        GridViewImages.DataBind()
        GridViewImages.Visible = True
        hiddenImages.Visible = True
        ImageNameRSTB.Text = ""
    End Sub

    Protected Sub picInsertSS_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles picInsertSS.Click
        'Make sure a file has been successfully uploaded
        If UploadedPicSS.PostedFile Is Nothing OrElse String.IsNullOrEmpty(UploadedPicSS.PostedFile.FileName) OrElse UploadedPicSS.PostedFile.InputStream Is Nothing Then
            Response.Write("Please upload a GIF, TIFF or JPEG file")
            Exit Sub
        End If

        'Make sure we are dealing with a JPG or GIF file
        Dim extension As String = Path.GetExtension(UploadedPicSS.PostedFile.FileName).ToLower()
        Dim ImageType As String = Nothing

        Select Case extension
            Case ".gif"
                ImageType = "image/gif"
            Case ".jpg", ".jpeg", ".jpe"
                ImageType = "image/jpeg"
            Case ".png"
                ImageType = "image/png"

            Case Else
                'Invalid file type uploaded
                Response.Write("Please upload a GIF, TIFF or JPEG file")
                Exit Sub
        End Select


        'Connect to the database and insert a new record into Products
        Using myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)

            Const SQL As String = "exec sp_InsertImage @ImageName,@ImageType,@ImageSource,@UserLogin,@ImageSourceID,@Image"
            Dim myCommand As New SqlCommand(SQL, myConnection)
            myCommand.Parameters.AddWithValue("@ImageName", ImageNameSSTB.Text)
            myCommand.Parameters.AddWithValue("@ImageType", ImageType)
            myCommand.Parameters.AddWithValue("@ImageSource", "GembaAuditNode_SS")
            myCommand.Parameters.AddWithValue("@ImageSourceID", ImageSourceIDPH)
            myCommand.Parameters.AddWithValue("@UserLogin", UserLogin)

            'Load FileUpload's InputStream into Byte array
            Dim imageBytes(UploadedPicSS.PostedFile.InputStream.Length) As Byte
            UploadedPicSS.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length)
            myCommand.Parameters.AddWithValue("@Image", imageBytes)

            myConnection.Open()
            myCommand.ExecuteNonQuery()
            myConnection.Close()

        End Using

        Dim SqlDataSourceImages As New SqlDataSource()
        SqlDataSourceImages.ID = "SqlDataSourceImages"
        Me.Page.Controls.Add(SqlDataSourceImages)
        SqlDataSourceImages.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString
        SqlDataSourceImages.SelectCommand = "exec sp_SelectImages '','" & UserLogin & "','" & ImageSourceIDPH & "'"
        GridViewImages.DataSource = SqlDataSourceImages
        GridViewImages.DataBind()
        GridViewImages.Visible = True
        hiddenImages.Visible = True
        ImageNameSSTB.Text = ""
    End Sub


    Protected Sub picInsertNIS_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles picInsertNIS.Click
        'Make sure a file has been succeNISfully uploaded
        If UploadedPicNIS.PostedFile Is Nothing OrElse String.IsNullOrEmpty(UploadedPicNIS.PostedFile.FileName) OrElse UploadedPicNIS.PostedFile.InputStream Is Nothing Then
            Response.Write("Please upload a GIF, TIFF or JPEG file")
            Exit Sub
        End If

        'Make sure we are dealing with a JPG or GIF file
        Dim extension As String = Path.GetExtension(UploadedPicNIS.PostedFile.FileName).ToLower()
        Dim ImageType As String = Nothing

        Select Case extension
            Case ".gif"
                ImageType = "image/gif"
            Case ".jpg", ".jpeg", ".jpe"
                ImageType = "image/jpeg"
            Case ".png"
                ImageType = "image/png"

            Case Else
                'Invalid file type uploaded
                Response.Write("Please upload a GIF, PNG or JPEG file")
                Exit Sub
        End Select


        'Connect to the database and insert a new record into Products
        Using myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)

            Const SQL As String = "exec sp_InsertImage @ImageName,@ImageType,@ImageSource,@UserLogin,@ImageSourceID,@Image"
            Dim myCommand As New SqlCommand(SQL, myConnection)
            myCommand.Parameters.AddWithValue("@ImageName", ImageNameNISTB.Text)
            myCommand.Parameters.AddWithValue("@ImageType", ImageType)
            myCommand.Parameters.AddWithValue("@ImageSource", "GembaAuditNode_NIS")
            myCommand.Parameters.AddWithValue("@ImageSourceID", ImageSourceIDPH)
            myCommand.Parameters.AddWithValue("@UserLogin", UserLogin)

            'Load FileUpload's InputStream into Byte array
            Dim imageBytes(UploadedPicNIS.PostedFile.InputStream.Length) As Byte
            UploadedPicNIS.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length)
            myCommand.Parameters.AddWithValue("@Image", imageBytes)

            myConnection.Open()
            myCommand.ExecuteNonQuery()
            myConnection.Close()

        End Using

        Dim SqlDataSourceImages As New SqlDataSource()
        SqlDataSourceImages.ID = "SqlDataSourceImages"
        Me.Page.Controls.Add(SqlDataSourceImages)
        SqlDataSourceImages.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString
        SqlDataSourceImages.SelectCommand = "exec sp_SelectImages '','" & UserLogin & "','" & ImageSourceIDPH & "'"
        GridViewImages.DataSource = SqlDataSourceImages
        GridViewImages.DataBind()
        GridViewImages.Visible = True
        hiddenImages.Visible = True
        ImageNameNISTB.Text = ""
    End Sub



End Class