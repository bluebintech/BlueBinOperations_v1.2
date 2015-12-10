<%@ Page Title="Hardware Items" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Hardware_Items.aspx.vb" Inherits="Hardware_Items" %>

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

        <asp:DetailsView  CssClass="DetailViewitem" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource3" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="ItemNumber" HeaderText="ItemNumber" SortExpression="ItemNumber" />
                <asp:BoundField DataField="ItemDescription" HeaderText="ItemDescription" SortExpression="ItemDescription" />
                <asp:TemplateField HeaderText="VendorName" SortExpression="VendorName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="VendorName" runat="server" DataSourceID="SqlDataSource1" DataTextField="VendorName" DataValueField="VendorName" SelectedValue='<%# Bind("VendorName") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [VendorName] FROM [Vendor]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VendorName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("VendorName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="VendorItemNumber" HeaderText="VendorItemNumber" SortExpression="VendorItemNumber" />
                <asp:BoundField DataField="UOM" HeaderText="UOM" SortExpression="UOM" />
                <asp:BoundField DataField="OrderUOM" HeaderText="OrderUOM" SortExpression="OrderUOM" />
                <asp:BoundField DataField="OrderUOMQty" HeaderText="OrderUOMQty" SortExpression="OrderUOMQty" />
                <asp:BoundField DataField="BBUnitCost" HeaderText="BBUnitCost" SortExpression="BBUnitCost"  DataFormatString="{0:c}" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" DeleteCommand="DELETE FROM [Item] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [Item] ([ItemNumber], [ItemDescription], [VendorID], [VendorItemNumber], [UOM], [OrderUOM], [OrderUOMqty], [BBunitCost]) VALUES (@ItemNumber, @ItemDescription,  (select VendorID from Vendor where VendorName = @VendorName), @VendorItemNumber, @UOM, @OrderUOM, @OrderUOMqty, @BBunitCost)" SelectCommand="SELECT 
i.ItemNumber,
i.ItemDescription,
v.VendorName,
i.VendorItemNumber,
i.UOM,
i.OrderUOM,
i.OrderUOMQty,
i.BBUnitCost
 FROM [Item] i
inner join Vendor v on I.VendorID = v.VendorID
WHERE (i.[ItemID] = @ItemID)" UpdateCommand="UPDATE [Item] SET [ItemNumber] = @ItemNumber, [ItemDescription] = @ItemDescription, [VendorID] = (select VendorID from Vendor where VendorName = @VendorName), [VendorItemNumber] = @VendorItemNumber, [UOM] = @UOM, [OrderUOM] = @OrderUOM, [OrderUOMqty] = @OrderUOMqty, [BBunitCost] = @BBunitCost WHERE [ItemID] = @ItemID">
            <DeleteParameters>
                <asp:Parameter Name="ItemID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ItemNumber" Type="String" />
                <asp:Parameter Name="ItemDescription" Type="String" />
                <asp:Parameter Name="VendorName" />
                <asp:Parameter Name="VendorItemNumber" Type="String" />
                <asp:Parameter Name="UOM" Type="String" />
                <asp:Parameter Name="OrderUOM" Type="String" />
                <asp:Parameter Name="OrderUOMqty" Type="Int32" />
                <asp:Parameter Name="BBunitCost" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="ItemID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemNumber" Type="String" />
                <asp:Parameter Name="ItemDescription" Type="String" />
                <asp:Parameter Name="VendorName" />
                <asp:Parameter Name="VendorItemNumber" Type="String" />
                <asp:Parameter Name="UOM" Type="String" />
                <asp:Parameter Name="OrderUOM" Type="String" />
                <asp:Parameter Name="OrderUOMqty" Type="Int32" />
                <asp:Parameter Name="BBunitCost" Type="Decimal" />
                <asp:Parameter Name="ItemID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </p>
            <p>

    </p><asp:GridView ID="GridView1"  CssClass="GridViewitem" runat="server" DataKeyNames="ItemID" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical">
        <AlternatingRowStyle BackColor="Gainsboro" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" InsertVisible="False" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="ItemNumber" HeaderText="ItemNumber" SortExpression="ItemNumber" />
            <asp:BoundField DataField="ItemDescription" HeaderText="ItemDescription" SortExpression="ItemDescription" />
            <asp:BoundField DataField="VendorName" HeaderText="VendorName" SortExpression="VendorName" />
            <asp:BoundField DataField="VendorItemNumber" HeaderText="VendorItemNumber" SortExpression="VendorItemNumber" />
            <asp:BoundField DataField="UOM" HeaderText="UOM" SortExpression="UOM" />
            <asp:BoundField DataField="OrderUOM" HeaderText="OrderUOM" SortExpression="OrderUOM" />
            <asp:BoundField DataField="OrderUOMqty" HeaderText="OrderUOMqty" SortExpression="OrderUOMqty" />
            <asp:BoundField DataField="BBunitCost" HeaderText="BBunitCost" SortExpression="BBunitCost"  DataFormatString="{0:c}"/>
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT DISTINCT [VendorName] FROM [Vendor]"></asp:SqlDataSource>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" DeleteCommand="DELETE FROM [Item] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [Item] ([ItemNumber], [ItemDescription], [VendorID], [VendorItemNumber], [UOM], [OrderUOM], [OrderUOMqty], [BBunitCost]) VALUES (@ItemNumber, @ItemDescription, (select VendorID from Vendor where VendorID = @VendorID), @VendorItemNumber, @UOM, @OrderUOM, @OrderUOMqty, @BBunitCost)" SelectCommand="select  a.ItemID,a.ItemNumber,a.ItemDescription,v.VendorName,a.VendorItemNumber,a.UOM,a.OrderUOM,a.OrderUOMqty,a.BBunitCost
from [BlueBinHardware].[dbo].[Item] a
inner join [BlueBinHardware].[dbo].[Vendor] v on a.VendorID = v.VendorID" UpdateCommand="UPDATE [Item] SET [ItemNumber] = @ItemNumber, [ItemDescription] = @ItemDescription, [VendorID] = (select VendorID from Vendor where VendorID = @VendorID), [VendorItemNumber] = @VendorItemNumber, [UOM] = @UOM, [OrderUOM] = @OrderUOM, [OrderUOMqty] = @OrderUOMqty, [BBunitCost] = @BBunitCost WHERE [ItemID] = @ItemID">
            <DeleteParameters>
                <asp:Parameter Name="ItemID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ItemNumber" Type="String" />
                <asp:Parameter Name="ItemDescription" Type="String" />
                <asp:Parameter Name="VendorID" Type="Int32" />
                <asp:Parameter Name="VendorItemNumber" Type="String" />
                <asp:Parameter Name="UOM" Type="String" />
                <asp:Parameter Name="OrderUOM" Type="String" />
                <asp:Parameter Name="OrderUOMqty" Type="Int32" />
                <asp:Parameter Name="BBunitCost" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemNumber" Type="String" />
                <asp:Parameter Name="ItemDescription" Type="String" />
                <asp:Parameter Name="VendorID" Type="Int32" />
                <asp:Parameter Name="VendorItemNumber" Type="String" />
                <asp:Parameter Name="UOM" Type="String" />
                <asp:Parameter Name="OrderUOM" Type="String" />
                <asp:Parameter Name="OrderUOMqty" Type="Int32" />
                <asp:Parameter Name="BBunitCost" Type="Decimal" />
                <asp:Parameter Name="ItemID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    

    </form>
</asp:Content>
