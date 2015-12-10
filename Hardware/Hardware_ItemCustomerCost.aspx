<%@ Page Title="Hardware Item Customer Cost" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Hardware_ItemCustomerCost.aspx.vb" Inherits="Hardware_ItemCustomerCost" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;<%: Title %></h2>
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
        <asp:GridView ID="GridView1"  CssClass="GridViewitem" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="Gainsboro" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="ItemDescription" SortExpression="ItemDescription">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ItemDescriptionList" runat="server" DataSourceID="ItemDescriptionSource" DataTextField="ItemDescription" DataValueField="ItemDescription" SelectedValue='<%# Bind("ItemDescription") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemDescription") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CustomerName" SortExpression="CustomerName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="CustomerNameList" runat="server" DataSourceID="CustomerNameSource" DataTextField="CustomerName" DataValueField="CustomerName" SelectedValue='<%# Bind("CustomerName") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CustomerName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CustomUnitCost" HeaderText="CustomUnitCost" SortExpression="CustomUnitCost"  DataFormatString="{0:c}"/>
                <asp:BoundField DataField="IsDefault" HeaderText="IsDefault" SortExpression="IsDefault" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" DeleteCommand="DELETE FROM [ItemCustomerCost] WHERE [ItemCustomerCostID] = @ItemCustomerCostID" InsertCommand="INSERT INTO [ItemCustomerCost] ([ItemID],[CustomerID], [CustomUnitCost], [IsDefault]) VALUES ((select ItemID from Item where ItemDescription = @ItemDescription), (select CustomerID from Customer where CustomerName = @CustomerName), @CustomUnitCost, @IsDefault)" SelectCommand="SELECT i.ItemDescription,c.CustomerName,a.CustomUnitCost,IsDefault
 FROM [BlueBinHardware].[dbo].[ItemCustomerCost] a
inner join [BlueBinHardware].[dbo].[Item] i on a.ItemID = i.ItemID
inner join [BlueBinHardware].[dbo].[Customer] c on a.CustomerID = c.CustomerID
" UpdateCommand="UPDATE [ItemCustomerCost] SET [ItemID] = (select ItemID from Item where ItemDescription = @ItemDescription), [CustomerID] = (select CustomerID from Customer where CustomerName = @CustomerName), [CustomUnitCost] = @CustomUnitCost, [IsDefault] = @IsDefault WHERE [ItemCustomerCostID] = @ItemCustomerCostID">
            <DeleteParameters>
                <asp:Parameter Name="ItemCustomerCostID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ItemDescription" />
                <asp:Parameter Name="CustomerName" />
                <asp:Parameter Name="CustomUnitCost" Type="Decimal" />
                <asp:Parameter Name="IsDefault" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemDescription" />
                <asp:Parameter Name="CustomerName" />
                <asp:Parameter Name="CustomUnitCost" Type="Decimal" />
                <asp:Parameter Name="IsDefault" Type="Int32" />
                <asp:Parameter Name="ItemCustomerCostID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ItemDescriptionSource" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [ItemDescription] FROM [Item]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="CustomerNameSource" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [CustomerName] FROM [Customer]"></asp:SqlDataSource>
    </p>
    
    </form>
</asp:Content>
