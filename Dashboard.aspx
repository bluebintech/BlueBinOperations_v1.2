<%@ Page Title="BlueBin Analytics Dashboard" Language="VB" AutoEventWireup="true" CodeFile="Dashboard.aspx.vb" Inherits="Dashboard" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>BlueBin Analytics</title>
<script type="text/javascript" src="https://online.tableau.com/javascripts/api/tableau-2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/cerulean/bootstrap.min.css">
</head>

<body>

<div class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="~/" runat="server" class="navbar-brand" onClick="switchView('Home')">&nbsp;<asp:Image runat="server" style="display:inline;" ID="Image1" Height="20px" ImageUrl="~/img/BlueBin_icon.png" Width="20px" />&nbsp;BlueBin Analytics</a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
          <ul class="nav navbar-nav">
		    <li><a runat="server" href="~/">Home</a></li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">Supply Chain <span class="caret"></span></a>
              <ul class="dropdown-menu" aria-labelledby="themes">
							<li><a href="#" onClick="switchView('Daily Management Dashboard')">Daily Management Dashboard</a></li>
                            <li class="divider"></li>
                            <li><a href="#" onClick="switchView('Node Activity')">Node Activity</a></li>
							<li><a href="#" onClick="switchView('Bin Activity Report')">Bin Activity</a></li>
                            <li><a href="#" onClick="switchView('Bin Velocity Report')">Bin Velocity Report</a></li>
                            <li><a href="#" onClick="switchView('Slow Bin Report')">Slow Bin Report</a></li>
                            <li class="divider"></li>
                            <li><a href="#" onClick="switchView('BlueBin Par Master')">BlueBin Par Master</a></li>
                            <li><a href="#" onClick="switchView('Item Master Report')">Item Master</a></li> 
                            <li class="divider"></li>
                            <li><a href="#" onClick="switchView('Open Scans')">Open Scans</a></li>
							<li><a href="#" onClick="switchView('Order Details')">Order Details</a></li>
                            <li class="divider"></li>
                            <li><a href="#" onClick="switchView('Item Locator')">Item Locator</a></li>
                            <li><a href="#" onClick="switchView('Par Valuation Report')">Par Valuation</a></li>  
              </ul>
            </li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download2">Operational Performance <span class="caret"></span></a>
              <ul class="dropdown-menu" aria-labelledby="download2">
                			<li><a href="#" onClick="switchView('Supply Spend')">Supply Spend</a></li>
                            <li><a href="#" onClick="switchView('Stat Calls')">Stat Calls</a></li>
                            <li><a href="#" onClick="switchView('Warehouse Volume')">Warehouse Volume*</a></li>
                            <li><a href="#" onClick="switchView('Warehouse Size')">Warehouse Size*</a></li>
                            <li><a href="#" onClick="switchView('Pick Line Volume')">Pick Line Volume</a></li>
                            <li><a href="#" onClick="switchView('Requisition Volume')">Requisition Volume*</a></li>
                            <li><a href="#" onClick="switchView('Overall Line Volume')">Overall Line Volume</a></li>
                            <li><a href="#" onClick="switchView('QCN Dashboard')">QCN Tracker</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download3">Strategic Sourcing <span class="caret"></span></a>
              <ul class="dropdown-menu" aria-labelledby="download3">
                			<li><a href="#" onClick="switchView('Buyer Performance Dashboard')">Buyer Performance</a></li>
                            <li><a href="#" onClick="switchView('Specials Dashboard')">Special Item Volume</a></li>
                            <li><a href="#" onClick="switchView('Supplier Performance Dashboard')">Supplier Performance</a></li>
                            <li><a href="#" onClick="switchView('Sourcing Calendar')">Sourcing Calendar (Contracts Dashboard)</a></li>
                            <li><a href="#" onClick="switchView('Supplier Spend Manager')">Supplier Spend Manager</a></li>
                            <li><a href="#" onClick="switchView('Item Cost Impact Dashboard')">Cost Impact Calculator</a></li>
                            <li class="divider"></li>
                            <li><a href="#" onClick="switchView('Open PO Report')">Open PO Report</a></li>
                            <li class="divider"></li>
                            <li><a href="#" onClick="switchView('Cost Variance Report')">Cost Variance*</a></li>
                            <li><a href="#" onClick="switchView('Department Cost')">Department Cost*</a></li>
                            
                            
              </ul>
            </li>
              
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                        <a href="#" onClick="revertAll()">Reset View</a>
                    </li>
					<li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Export <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" onClick="exportXL()">Excel</a></li>
                            <li><a href="#" onClick="exportData()">Data</a></li>
							<li><a href="#" onClick="exportPDF()">PDF</a></li>
							<li><a href="#" onClick="exportIMG()">Image</a></li>
							 <li class="divider"></li>
							<li><a href="#" onClick="downloadWorkbook()">Download Workbook</a></li> 
							
                            
                        </ul>
                    </li>
					<li class="dropdown">
                        <a href="#" onClick="shareViz()">Share This!</a>
                    </li>
          </ul>

        </div>
      </div>
    </div>
<div id="viz" style="width:100%; margin:0 auto;">
</div>

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
</body>
</html>
