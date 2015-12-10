<%@ Page Title="Hardware POs" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Hardware_POs.aspx.vb" Inherits="Hardware_POs" %>

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
        <asp:GridView ID="GridView1"  CssClass="GridViewitem" DataKeyNames="POID" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="PO" HeaderText="PO" SortExpression="PO" />
                <asp:TemplateField HeaderText="CustomerName" SortExpression="CustomerName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CustomerName" DataValueField="CustomerName" SelectedValue='<%# Bind("CustomerName") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VendorName" SortExpression="VendorName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="VendorName" DataValueField="VendorName" SelectedValue='<%# Bind("VendorName") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("VendorName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:c}" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" DataFormatString="{0:d}" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" DeleteCommand="DELETE FROM [PO] WHERE [POID] = @POID" InsertCommand="INSERT INTO [PO] ([PO], (Select CustomerID from Customer where CustomerName = @CustomerName), (select VendorID from Vendor where VendorName = @VendorName), [Total], [OrderDate]) VALUES (@PO, @CustomerID, @VendorID, @Total, @OrderDate)" SelectCommand="SELECT 
a.POID,
a.PO,
c.CustomerName,
v.VendorName,
a.Total,
a.OrderDate
 FROM [PO] a
inner join Customer c on a.CustomerID = c.CustomerID
inner join Vendor v on a.VendorID = a.VendorID" UpdateCommand="UPDATE [PO] SET [PO] = @PO, [CustomerID] = (Select CustomerID from Customer where CustomerName = @CustomerName), [VendorID] = (select VendorID from Vendor where VendorName = @VendorName), [Total] = @Total, [OrderDate] = @OrderDate WHERE [POID] = @POID">
            <DeleteParameters>
                <asp:Parameter Name="POID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerName" />
                <asp:Parameter Name="VendorName" />
                <asp:Parameter Name="PO" Type="String" />
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="VendorID" Type="Int32" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="OrderDate" DbType="Date" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PO" Type="String" />
                <asp:Parameter Name="CustomerName" />
                <asp:Parameter Name="VendorName" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="OrderDate" DbType="Date" />
                <asp:Parameter Name="POID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [CustomerName] FROM [Customer]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [VendorName] FROM [Vendor]"></asp:SqlDataSource>
    </p>
            <p>
                &nbsp;</p>
            <p>
                <asp:GridView  CssClass="GridViewitem" ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource4" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="POID" HeaderText="POID" SortExpression="POID" />
                        <asp:BoundField DataField="POLine" HeaderText="POLine" SortExpression="POLine" />
                        <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" />
                        <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                        <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" DataFormatString="{0:c}" />
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT * FROM [POLine] WHERE ([POID] = @POID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="POID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
    </p>
    
</form>
</asp:Content>
