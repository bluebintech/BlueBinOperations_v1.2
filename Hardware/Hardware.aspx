<%@ Page Title="Hardware" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Hardware.aspx.vb" Inherits="Hardware" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>
    </h2>
    <p>Please Select a Page to navigate to and update</p>
    <p>
<form action="../">
<select name="mySelectbox">
    <option value="Hardware_Customers">Customers</option>
    <option value="Hardware_Vendors">Vendors</option>
    <option value="Hardware_Items">Items</option>
    <option value="Hardware_ItemCustomerCost">Item Customer Cost</option>
        <option value="Hardware_POs">POs</option>
        <option value="Hardware_VendorInvoices">VendorInvoices</option>
        <option value="Hardware_ClientInvoices">ClientInvoices</option>
</select>

    <input type="button" onclick="window.open(this.form.mySelectbox.options[this.form.mySelectbox.selectedIndex].value,'_top')" value="Go">
    <br />
    <br />
    There are several main pages for Hardware.&nbsp; They are described below:<br />
    Customers - &lt;description&gt;<br />
    IItems - &lt;description&gt;<br />
    IItem Customer Costs - &lt;description&gt;<br />
    Vendors - &lt;description&gt;<br />
    Vendor Invoice - &lt;description&gt;<br />
    PO - &lt;description&gt;<br />
    Customer Invoice - &lt;description&gt;</form>
    
</asp:Content>
