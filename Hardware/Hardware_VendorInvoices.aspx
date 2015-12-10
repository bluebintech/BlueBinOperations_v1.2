<%@ Page Title="Hardware Vendor Invoices" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Hardware_VendorInvoices.aspx.vb" Inherits="Hardware_VendorInvoices" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
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

            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="178px"></asp:TextBox>
            <asp:LinkButton ID="LinkButton1" runat="server">Search Client</asp:LinkButton>

    <br />
<p>
        <asp:GridView ID="GridView1"   CssClass="GridViewitem" DataKeyNames="VendorInvoiceID" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="VendorInvoiceID" HeaderText="VendorInvoiceID" SortExpression="VendorInvoiceID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="VendorInvoice" HeaderText="VendorInvoice" SortExpression="VendorInvoice" />
                <asp:BoundField DataField="PO" HeaderText="PO" SortExpression="PO" />
                <asp:BoundField DataField="VendorName" HeaderText="VendorName" SortExpression="VendorName" />
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" />
                <asp:BoundField DataField="Tax" HeaderText="Tax" SortExpression="Tax" DataFormatString="{0:c}"/>
                <asp:BoundField DataField="Shipping" HeaderText="Shipping" SortExpression="Shipping" DataFormatString="{0:c}"/>
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:c}"/>
                <asp:BoundField DataField="ShipDate" HeaderText="ShipDate" SortExpression="ShipDate" DataFormatString="{0:d}"/>
                <asp:BoundField DataField="ReceiveDate" HeaderText="ReceiveDate" SortExpression="ReceiveDate" DataFormatString="{0:d}"/>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" DeleteCommand="DELETE FROM [VendorInvoice] WHERE [VendorInvoiceID] = @VendorInvoiceID" InsertCommand="INSERT INTO [VendorInvoice] ([VendorInvoice], [POID], [VendorID], [CustomerID], [Subtotal], [Tax], [Shipping], [Total], [ShipDate], [ReceiveDate]) VALUES (@VendorInvoice, (select POID from PO where PO = @PO), (select VendorID from Vendor where VendorName = @VendorName), (Select CustomerID from Customer where CustomerName = @CustomerName), @Subtotal, @Tax, @Shipping, @Total, @ShipDate, @ReceiveDate)" SelectCommand="SELECT 
a.VendorInvoiceID,
a.VendorInvoice,
p.PO,
v.VendorName,
c.CustomerName,
a.Subtotal,
a.Tax,
a.Shipping,
a.Total,
a.ShipDate,
a.ReceiveDate
FROM [VendorInvoice] a
inner join PO p on a.POID = p.POID
inner join Vendor v on a.VendorID = v.VendorID
inner join Customer c on a.CustomerID = c.CustomerID
WHERE
(c.CustomerName LIKE '%' + @CustomerName + '%')" UpdateCommand="UPDATE [VendorInvoice] SET [VendorInvoice] = @VendorInvoice, [POID] = (select POID from PO where PO = @PO), [VendorID] = (select VendorID from Vendor where VendorName = @VendorName), [CustomerID] = (Select CustomerID from Customer where CustomerName = @CustomerName), [Subtotal] = @Subtotal, [Tax] = @Tax, [Shipping] = @Shipping, [Total] = @Total, [ShipDate] = @ShipDate, [ReceiveDate] = @ReceiveDate WHERE [VendorInvoiceID] = @VendorInvoiceID">
            <DeleteParameters>
                <asp:Parameter Name="VendorInvoiceID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VendorInvoice" Type="String" />
                <asp:Parameter Name="PO" />
                <asp:Parameter Name="VendorName" />
                <asp:Parameter Name="CustomerName" />
                <asp:Parameter Name="Subtotal" Type="Decimal" />
                <asp:Parameter Name="Tax" Type="Decimal" />
                <asp:Parameter Name="Shipping" Type="Decimal" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="ShipDate" />
                <asp:Parameter DbType="Date" Name="ReceiveDate" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="CustomerName" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="VendorInvoice" Type="String" />
                <asp:Parameter Name="PO" />
                <asp:Parameter Name="VendorName" />
                <asp:Parameter Name="CustomerName" />
                <asp:Parameter Name="Subtotal" Type="Decimal" />
                <asp:Parameter Name="Tax" Type="Decimal" />
                <asp:Parameter Name="Shipping" Type="Decimal" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="ShipDate" />
                <asp:Parameter DbType="Date" Name="ReceiveDate" />
                <asp:Parameter Name="VendorInvoiceID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [PO] FROM [PO]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [VendorName] FROM [Vendor]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [CustomerName] FROM [Customer]"></asp:SqlDataSource>
    </p>
            <p>
                <asp:GridView  CssClass="GridViewitem" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" EmptyDataText="There are no data records to display." BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="VendorInvoiceID" HeaderText="VendorInvoiceID" SortExpression="VendorInvoiceID" />
                        <asp:BoundField DataField="VendorInvoiceLine" HeaderText="VendorInvoiceLine" SortExpression="VendorInvoiceLine" />
                        <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" />
                        <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                        <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" SortExpression="UnitCost" DataFormatString="{0:c}"/>
                        <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" DataFormatString="{0:c}"/>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT * FROM [VendorInvoiceLine] WHERE ([VendorInvoiceID] = @VendorInvoiceID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="VendorInvoiceID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT * FROM [VendorInvoiceLine] WHERE ([VendorInvoiceID] = @VendorInvoiceID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="VendorInvoiceID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
    </p>
            <p>
                &nbsp;</p>
    
</form>
</asp:Content>
