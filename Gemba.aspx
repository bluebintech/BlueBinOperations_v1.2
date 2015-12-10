<%@ Page Title="Gemba" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Gemba.aspx.vb" Inherits="Gemba" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <asp:Table ID="PageTable" runat="server" Width="900px" align = "center">



<asp:TableRow><asp:TableCell><h2>Node Audits</h2></asp:TableCell></asp:TableRow>
<asp:TableRow>
<asp:TableCell Width="900px">  
    
    <p>
        <asp:Button ID="GembaAuditNodeFormButton" runat="server"  class="btn btn-primary btn-lg" Text="New Gemba Audit" /> &nbsp; 
    </p>
    <p>
 
        <asp:DropDownList ID="SearchList1" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="LocationName" DataValueField="LocationName">
            <asp:ListItem Selected = "True" Text = "All" Value = ""></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' SelectCommand="SELECT DISTINCT a.LocationName FROM bluebin.[DimLocation] a inner join gemba.GembaAuditNode b on rtrim(a.LocationID) = rtrim(b.LocationID) where b.Active = 1 and a.BlueBinFlag = 1"></asp:SqlDataSource>
        <asp:Button ID="SearchButton" runat="server" Text="Search" />

</p>, 
        <p>
   <asp:GridView  CssClass="GridViewitem" ID="GembaAuditNodeGridView"  OnRowDataBound="OnRowDataBoundNode" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="GembaAuditNodeSource" GridLines="Vertical" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="GembaAuditNodeID" RowStyle-HorizontalAlign="Center" RowStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="GembaAuditNodeID" DataNavigateUrlFormatString="GembaAuditNodeFormEdit.aspx?GembaAuditNodeID={0}" Text="Edit"></asp:HyperLinkField>
            <asp:BoundField DataField="GembaAuditNodeID" HeaderText="GembaAuditNodeID" InsertVisible="False" ReadOnly="True" SortExpression="GembaAuditNodeID" Visible="False" />
            <asp:BoundField DataField="Date" HeaderText="Audit Date" SortExpression="Date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="LastUpdated" HeaderText="Last Updated" SortExpression="LastUpdated"  Visible="False" DataFormatString="{0:d}" />
            <asp:BoundField DataField="LocationName" HeaderText="Node" SortExpression="LocationName" />
            <asp:BoundField DataField="Auditer" HeaderText="Auditer" ReadOnly="True" SortExpression="Auditer" />
            <asp:BoundField DataField="AuditerLogin" HeaderText="AuditerLogin" ReadOnly="True" SortExpression="AuditerLogin"  Visible="False" />
            <asp:BoundField DataField="Pull Score" HeaderText="Pull Score" SortExpression="Pull Score" />
            <asp:BoundField DataField="Replenishment Score" HeaderText="Replenish Score" SortExpression="Replenishment Score" />
            <asp:BoundField DataField="Stage Score" HeaderText="Stage Score" SortExpression="Stage Score" />
            <asp:BoundField DataField="Node Integrity Score" HeaderText="Node Integrity Score" SortExpression="Node Integrity Score" />
            <asp:TemplateField HeaderText="Total Score" SortExpression="Total Score">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("[Total Score]") %>' ID="TextBox1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Font-Size="Larger"  Text='<%# Bind("[Total Score]") %>' ID="Label1" Font-Bold="True" ForeColor="#000066"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="AdditionalCommentsText" HeaderText="AdditionalCommentsText" SortExpression="AdditionalCommentsText" Visible="False" />
            <asp:BoundField DataField="Addtl Comments" HeaderText="Addtl Comments" SortExpression="Addtl Comments" />
            <asp:TemplateField ShowHeader="False">
             <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this entry?');">Delete</asp:LinkButton>             
            </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <FooterStyle BackColor="#000084" ForeColor="Black" />
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
        <asp:ImageButton ID="GembaAuditNodeExportToExcelButton" runat="Server" ImageUrl="~/img/ExportExcel.gif" OnClick="GembaAuditNodeExportToExcel" Height="25px" />
    </p>




    
</asp:TableCell>
    </asp:TableRow>




 </asp:Table>

<asp:SqlDataSource ID="GembaAuditNodeSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" 
    SelectCommand="exec sp_SelectGembaAuditNode @LocationName" DeleteCommand="exec sp_DeleteGembaAuditNode @GembaAuditNodeID  " >
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchList1" PropertyName="Text" DefaultValue="%" Name="LocationName"></asp:ControlParameter>
            </SelectParameters>



</asp:SqlDataSource>


            


</asp:Content>
