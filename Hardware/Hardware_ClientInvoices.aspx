<%@ Page Title="Hardware Client Invoices" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Hardware_ClientInvoices.aspx.vb" Inherits="Hardware_ClientInvoices" %>

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
<p>
        <asp:GridView ID="GridView1"  CssClass="GridViewitem" DataKeyNames="ClientInvoiceID" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="ClientInvoice" HeaderText="ClientInvoice" SortExpression="ClientInvoice" />
                <asp:TemplateField HeaderText="PO" SortExpression="PO">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="PO" DataValueField="PO" SelectedValue='<%# Bind("PO") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("PO") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CustomerName" SortExpression="CustomerName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="CustomerName" DataValueField="CustomerName" SelectedValue='<%# Bind("CustomerName") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CustomerName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" DataFormatString="{0:c}"/>
                <asp:BoundField DataField="Tax" HeaderText="Tax" SortExpression="Tax" DataFormatString="{0:c}"/>
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:c}"/>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" DeleteCommand="DELETE FROM [ClientInvoice] WHERE [ClientInvoiceID] = @ClientInvoiceID" InsertCommand="INSERT INTO [ClientInvoice] ([ClientInvoice], [POID], [CustomerID], [Subtotal], [Tax], [Shipping], [Total]) VALUES (@ClientInvoice, (select POID from PO where PO = @PO), (Select CustomerID from Customer where CustomerName = @CustomerName), @Subtotal, @Tax, @Shipping, @Total)" SelectCommand="SELECT
a.ClientInvoiceID,
a.ClientInvoice,
p.PO,
c.CustomerName,
a.Subtotal,
a.Tax,
A.Total
FROM [ClientInvoice] a
inner join PO p on a.POID = p.POID
inner join Customer c on a.CustomerID = c.CustomerID" UpdateCommand="UPDATE [ClientInvoice] SET [ClientInvoice] = @ClientInvoice, [POID] = (select POID from PO where PO = @PO), [CustomerID] = (Select CustomerID from Customer where CustomerName = @CustomerName), [Subtotal] = @Subtotal, [Tax] = @Tax, [Shipping] = @Shipping, [Total] = @Total WHERE [ClientInvoiceID] = @ClientInvoiceID">
            <DeleteParameters>
                <asp:Parameter Name="ClientInvoiceID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ClientInvoice" Type="String" />
                <asp:Parameter Name="PO" />
                <asp:Parameter Name="CustomerName" />
                <asp:Parameter Name="Subtotal" Type="Decimal" />
                <asp:Parameter Name="Tax" Type="Decimal" />
                <asp:Parameter Name="Shipping" Type="Decimal" />
                <asp:Parameter Name="Total" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ClientInvoice" Type="String" />
                <asp:Parameter Name="PO" />
                <asp:Parameter Name="CustomerName" />
                <asp:Parameter Name="Subtotal" Type="Decimal" />
                <asp:Parameter Name="Tax" Type="Decimal" />
                <asp:Parameter Name="Shipping" Type="Decimal" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="ClientInvoiceID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [PO] FROM [PO]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [CustomerName] FROM [Customer]"></asp:SqlDataSource>
    </p>
            <p>
                <asp:GridView ID="GridView2"  CssClass="GridViewitem" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource4" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="ClientInvoiceID" HeaderText="ClientInvoiceID" SortExpression="ClientInvoiceID" />
                        <asp:BoundField DataField="ClientInvoiceLine" HeaderText="ClientInvoiceLine" SortExpression="ClientInvoiceLine" />
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
    </p>
            <p>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT * FROM [ClientInvoiceLine] WHERE ([ClientInvoiceID] = @ClientInvoiceID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="ClientInvoiceID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
    </p>
    
</form>
</asp:Content>
