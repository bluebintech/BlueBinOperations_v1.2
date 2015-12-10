<%@ Page Title="Learn About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="LearnAbout.aspx.vb" Inherits="LearnAbout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
<p>Welcome to the Learning and Documentation Page for BlueBin Operations.  You will find Documentation pertaining to the BlueBin Program in the form of Presentations, Guides, and Specifications.</p>


    <div>
        <h3>BlueBin Program</h3>
        <a href="/BlueBinDocuments/BBI INTRO-MAIN.ppsx" runat="server" target="_blank">BlueBin Overview Presentation</a><br />
    </div>
    <div>
        <h3>Introduction to LEAN</h3>
        <a href="/BlueBinDocuments/BBI Module #1 - LEAN INTRO.ppsx" runat="server" target="_blank">Lean Introduction</a><br />
        <a href="/BlueBinDocuments/BBI Module #2 - 5S.ppsx" runat="server" target="_blank">6S Workplace Organization</a><br />
        <a href="/BlueBinDocuments/BBI Module #3 - STANDARD WORK.ppsx" runat="server" target="_blank">Standard Work</a><br />
        <a href="/BlueBinDocuments/BBI Module #4 - FLOW.ppsx" runat="server" target="_blank">Operational Efficiency</a><br />
    </div>
    <div>
        <h3>BlueBin Technical Documentation</h3>
        <a href="/BlueBinDocuments/BlueBin - Technical Specification.pdf" runat="server" target="_blank">Technical Specification</a><br />
    </div>

  </asp:Content>
