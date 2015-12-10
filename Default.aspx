    <%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:Image id="LogoImage" runat="server"></asp:Image>
        <h1>BlueBin Operations Application</h1>
         <p class="lead">Hello&nbsp;<asp:LoginName ID="LoginName2" runat="server" Font-Bold = "true" /> and welcome to the BlueBin DMS App (Daily Management System Application) for your Facility!&nbsp; Please click below to learn more about the setup of this application and for other documentation.</p>
        <p><a href="~/LearnAbout"  runat="server" class="btn btn-primary btn-lg">Learn About&raquo;</a> <a href="~/Contact"  runat="server" class="btn btn-primary btn-lg">Contact &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            
            <h2>BlueBin Dashboard</h2>
            <p>
                View your Daily Management Dashboard Reports by logging into the BlueBin Hosted Solution.
            </p>
            <p>
                <a runat="server" class="btn btn-default" href="~/Dashboard">Click Here &raquo;</a>
            </p>
        </div>

        <div class="col-md-4">
            <h2>QCN</h2>
            <p>
                You can easily create, track, and store QCNs in this easy to use module.</p>
            <p>
                <a class="btn btn-default" runat="server" href="~/QCN">Click Here &raquo;</a>
            </p>
        </div>
       <div class="col-md-4">
            <h2>Gemba Auditing</h2>
            <p>
                You can easily perform Gemba Audits on Nodes and your Staging Area and store them for future reference in this easy to use module.</p>
            <p>
                <a class="btn btn-default" runat="server" href="~/Gemba">Click Here &raquo;</a>
            </p>
        </div>
         </div>
    <div class="row">        <div class="col-md-4">
            <h2>Hardware Orders</h2>
            <p>
                You can easily place orders for more hardware that will be routed to the BlueBin Operations team.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/HardwareOrder">Click Here &raquo;</a>
            </p>
        </div>
 
      <div class="col-md-4">
            <h2>Operational Procedures</h2>
            <p>
                Review Standard Operating Procedures and Documentation for your BlueBin Solution.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/OperationalProcedures">Click Here &raquo;</a>
            </p>
       
    </div>  
        
    </div>

</asp:Content>
