<%@ Page Title="Hardware Order" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="HardwareOrder.aspx.vb" Inherits="HardwareOrder" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <asp:Table ID="PageTable" runat="server" Width="900px" align = "center">
<asp:TableRow><asp:TableCell><h2><%: Page.Title %></h2></asp:TableCell></asp:TableRow>
<asp:TableRow>
<asp:TableCell Width="900px">  
    
    <p>
        <asp:Button ID="NewHardware" runat="server" Text="New Hardware Order" /> 
    </p>
    <p>
    <p>
        <asp:GridView  CssClass="GridViewitem" ID="GridViewHardware" DataKeyNames="POID"  runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AllowPaging="True" RowStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" CellSpacing="3">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
            <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="PO" HeaderText="PO" SortExpression="PO" />
                <asp:TemplateField HeaderText="Customer" SortExpression="CustomerName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CustomerName" DataValueField="CustomerName" SelectedValue='<%# Bind("CustomerName") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Vendor" SortExpression="VendorName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="VendorName" DataValueField="VendorName" SelectedValue='<%# Bind("VendorName") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("VendorName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:c}" />
                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" DataFormatString="{0:d}"  />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" DeleteCommand="DELETE FROM [PO] WHERE [POID] = @POID" 
            InsertCommand="INSERT INTO [PO] ([PO], (Select CustomerID from Customer where CustomerName = @CustomerName), (select VendorID from Vendor where VendorName = @VendorName), [Total], [OrderDate]) VALUES (@PO, @CustomerID, @VendorID, @Total, @OrderDate)" 
            UpdateCommand="UPDATE [PO] SET [PO] = @PO, [CustomerID] = (Select CustomerID from Customer where CustomerName = @CustomerName), [VendorID] = (select VendorID from Vendor where VendorName = @VendorName), [Total] = @Total, [OrderDate] = @OrderDate WHERE [POID] = @POID">
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
                <asp:GridView  CssClass="GridViewitem" RowStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="5" DataSourceID="SqlDataSource4" GridLines="Vertical" HorizontalAlign="NotSet">
                    <AlternatingRowStyle BackColor="#DCDCDC" />

                    <Columns>
                        <asp:BoundField DataField="POID" HeaderText="POID" SortExpression="POID" Visible="False" />
                        <asp:BoundField DataField="PO" HeaderText="PO" SortExpression="PO" />
                        <asp:BoundField DataField="POLine" HeaderText="PO Line" SortExpression="POLine" />
                        <asp:BoundField DataField="ItemDescription" HeaderText="Item Description" SortExpression="ItemDescription" />
                        <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                        <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" />
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" 
                    SelectCommand="exec sp_SelectPO @POID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewHardware" Name="POID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
    </p>
    
    
</asp:TableCell>
    </asp:TableRow>
        </asp:Table>

</asp:Content>
