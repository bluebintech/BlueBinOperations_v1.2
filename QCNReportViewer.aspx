<%@ Page Title="QCN Report Viewer - BlueBin DMS App" Language="VB" AutoEventWireup="true" CodeFile="QCNReportViewer.aspx.vb" Inherits="QCNReportViewer" %>

<!DOCTYPE html>

<html lang="en">


    
    
    <head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BlueBin QCN Report Viewer</title>


</head>

    <body>

    </body>
    <script type="text/javascript" src="https://online.tableau.com/javascripts/api/tableau-2.min.js"></script>
        <script>
var placeholderDiv = document.getElementById("viz");
var url = "<%=Me.TableauFullURL.ToString()%>";
var options = {
   hideTabs: true,
   hideToolbar: true,
   width: "100%",   
   height: "980px"
};
var viz = new tableauSoftware.Viz(placeholderDiv, url, options);

var switchView = function(sheetName) {
	
	workBook = viz.getWorkbook();
	workBook.activateSheetAsync(sheetName);
	
}

var revertAll = function(){
	viz.revertAllAsync();
}

var exportPDF = function(){
	viz.showExportPDFDialog();
}

var exportXL = function(){
	viz.showExportCrossTabDialog();
}

var exportIMG = function(){
	viz.showExportImageDialog();
}

var exportData = function(){
	viz.showExportDataDialog();
}

var downloadWorkbook = function(){
	viz.showDownloadWorkbookDialog();
}

var shareViz = function(){
	viz.showShareDialog();
}

</script>
</html>



      
