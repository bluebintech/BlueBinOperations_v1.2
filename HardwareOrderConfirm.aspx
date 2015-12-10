<%@ Page Title="HardwareOrderConfirm" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="HardwareOrderConfirm.aspx.vb" Inherits="HardwareOrderConfirm" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:panel runat ="server">
<asp:Table ID="PageTable" runat="server" Width="500px" align = "center">
<asp:TableRow><asp:TableCell><h2>New Hardware Order Form</h2></asp:TableCell></asp:TableRow>
<asp:TableRow>
    <asp:TableCell Width="500px"  BorderColor="#032169" BorderStyle="Solid" BorderWidth="1">


        <asp:Table ID="Table3" runat="server" CellPadding="10" Width="500px" BorderWidth="10" BorderColor="#eeeeee" BackColor="#eeeeee">
            <asp:TableRow Height="10"><asp:TableCell Width="150px"><img src="img/Bluebin_logo-inline.png" width="150" /></asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
            </asp:Table>
        <asp:Table ID="Table1" runat="server" CellPadding="10" Width="500px" BorderWidth="10" BorderColor="#eeeeee" BackColor="#eeeeee">
        <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="Date" runat="server" Text="Thank you For your submission, we will contact you with an invoice and update the tracking page shortly."></asp:Label>
                </asp:TableCell>

            </asp:TableRow> <asp:TableRow Height="10"></asp:TableRow>
            
            
            
        </asp:Table>
 
 </asp:TableCell> 

    </asp:TableRow> 
    
    <asp:TableRow Height="10"></asp:TableRow>
 <asp:TableRow>
     <asp:TableCell></asp:TableCell>
 </asp:TableRow>       
      
        </asp:Table>

    
   
    
    
  
</asp:panel>
    <p><asp:SqlDataSource ID="ItemSource" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="
        SELECT 
		i.[ItemID]
      ,i.[ItemNumber]
      ,i.[ItemDescription]
      
  FROM [Item] i

        "></asp:SqlDataSource>      
</p>
    <p><asp:SqlDataSource ID="ItemSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="
        SELECT 
		i.[ItemID]
      ,i.[ItemNumber]
      ,i.[ItemDescription]
      ,v.[VendorName]
      ,i.[VendorItemNumber]
      ,i.[UOM]
      ,i.[OrderUOM]
      ,i.[OrderUOMqty]
	  ,icc.CustomUnitCost
  FROM [Item] i
  inner join Vendor v on i.VendorID = v.VendorID
  inner join ItemCustomerCost icc on icc.ItemID = i.ItemID and icc.CustomerID = (Select CustomerID from Customer where CustomerName = 'MHS')
        "></asp:SqlDataSource>      
</p>
    <p><asp:SqlDataSource ID="UOMCostSource" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="
        SELECT 
		i.[ItemID]
      ,i.[UOM]
      ,i.[OrderUOM]
      ,i.[OrderUOMqty]
	  ,icc.CustomUnitCost
  FROM [Item] i
  inner join Vendor v on i.VendorID = v.VendorID
  inner join ItemCustomerCost icc on icc.ItemID = i.ItemID and icc.CustomerID = (Select CustomerID from Customer where CustomerName = 'MHS')" FilterExpression="ItemID = '{0}'
        "></asp:SqlDataSource>      
</p>
</asp:Content>
