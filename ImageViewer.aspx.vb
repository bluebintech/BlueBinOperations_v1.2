Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security

Partial Public Class ImageViewer
    Inherits Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ImageID As Integer = Convert.ToInt32(Request.QueryString("ImageID"))

        'Connect to the database and bring back the image contents & MIME type for the specified picture
        Using myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)

            Const SQL As String = "SELECT [ImageType], [Image] FROM bluebin.[Image] WHERE [ImageID] = @ImageID"
            Dim myCommand As New SqlCommand(SQL, myConnection)
            myCommand.Parameters.AddWithValue("@ImageID", ImageID)

            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader

            If myReader.Read Then
                Response.ContentType = myReader("ImageType").ToString()
                Response.BinaryWrite(myReader("Image"))
            End If

            myReader.Close()
            myConnection.Close()
        End Using
    End Sub
End Class


