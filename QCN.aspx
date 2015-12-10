<%@ Page Title="QCN" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="QCN.aspx.vb" Inherits="QCN" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/jquery.simpletip/1.3.1/jquery.simpletip-1.3.1.min.js"></script>




<script type="text/javascript">
    $(function () {
        $('[id*=GridViewQCN] tr').each(function () {
            var toolTip = $(this).attr("DetailsText");
            $(this).find("td").each(function () {
                $(this).simpletip({
                    content: toolTip
                });
            });
            $(this).removeAttr("DetailsText");
        });
    });
</script>
    <style type="text/css">
    .tooltip td
    {
        position: absolute;
        top: 0;
        left: 0;
        z-index: 3;
        display: none;
        background-color: #FB66AA;
        color: White;
        padding: 5px;
        font-size: 10pt;
        font-family: Arial;
        cursor: pointer;
    }

</style>


    <asp:panel runat ="server">    

<asp:Table ID="PageTable" runat="server" Width="1000px" align = "center">
<asp:TableRow><asp:TableCell><h2>QCN Status</h2></asp:TableCell></asp:TableRow>
<asp:TableRow>
<asp:TableCell Width="1000px">    
<p>
    <asp:Button ID="Button1" class="btn btn-primary btn-lg" runat="server" Text="New QCN Form" />&nbsp;
    <asp:Button ID="QCNDashboardB" class="btn btn-primary btn-lg" runat="server" Text="QCN Dashboard" />
    </p>


<p>


               
     <asp:DropDownList ID="SearchList1" AppendDataBoundItems="true" runat="server" DataSourceID="QCNLocationDS" DataTextField="LocationName" DataValueField="LocationName">
            <asp:ListItem Selected = "True" Text = "All" Value = ""></asp:ListItem>
        </asp:DropDownList>
           
     <asp:SqlDataSource runat="server" ID="QCNLocationDS" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' SelectCommand="SELECT DISTINCT b.LocationName FROM qcn.QCN a inner join bluebin.[DimLocation] b on rtrim(a.LocationID) = rtrim(b.LocationID) WHERE b.BlueBinFlag= 1 group by b.LocationName order by 1"></asp:SqlDataSource>
&nbsp;<asp:Button ID="SearchButton"  runat="server" Text="Search" /> &nbsp;&nbsp; 
    </p>
    <p><asp:CheckBox ID="CompletedCB" runat="server" Text="Include Completed?" />
    </p>



    <p>
    <asp:GridView  CssClass="GridViewitem" ID="GridViewQCN"   OnPageIndexChanging="OnPageIndexChanging" OnRowDataBound="OnRowDataBound" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="QCNDatasource" GridLines="Vertical" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QCNID">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="QCNID" DataNavigateUrlFormatString="QCNFormEdit.aspx?QCNID={0}" Text="Edit"></asp:HyperLinkField>
            <asp:BoundField DataField="QCNID" HeaderText="QCNID" InsertVisible="False" ReadOnly="True" SortExpression="QCNID" Visible="False" />
            <asp:BoundField DataField="LocationID" HeaderText="LocationID" Visible="False" SortExpression="LocationID" />
            <asp:BoundField DataField="LocationName" HeaderText="Location" SortExpression="LocationName"  ItemStyle-Wrap="False"/>
            
            <asp:BoundField DataField="RequesterUserID" HeaderText="RequesterUserID" ReadOnly="True" SortExpression="RequesterUserID"  Visible="False"/>
            <asp:BoundField DataField="RequesterUserName" HeaderText="Requester" ReadOnly="True" SortExpression="RequesterUserName" />
            <asp:BoundField DataField="RequesterLogin" HeaderText="RequesterLogin" ReadOnly="True" SortExpression="RequesterLogin"  Visible="False" />
            <asp:BoundField DataField="RequesterTitleName" HeaderText="Requester Title" SortExpression="RequesterTitleName"  Visible="False" />
            
            <asp:BoundField DataField="AssignedUserID" HeaderText="AssignedUserID" ReadOnly="True" SortExpression="AssignedUserID"  Visible="False"/>
            <asp:BoundField DataField="AssignedUserName" HeaderText="Assigned" ReadOnly="True" SortExpression="AssignedUserName" />
            <asp:BoundField DataField="AssignedLogin" HeaderText="AssignedLogin" ReadOnly="True" SortExpression="AssignedLogin"  Visible="False" />
            <asp:BoundField DataField="AssignedTitleName" HeaderText="Assigned Title" SortExpression="AssignedTitleName"  Visible="False" />
            
            <asp:BoundField DataField="QCNType" HeaderText="QCN Type" SortExpression="QCNType" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID"  Visible="True"/>
            <asp:BoundField DataField="ItemClinicalDescription" HeaderText="Item" SortExpression="ItemClinicalDescription" />
            <asp:BoundField DataField="Par" HeaderText="Par" SortExpression="Par"  DataFormatString="{0:###}"/>
            <asp:BoundField DataField="UOM" HeaderText="UOM" SortExpression="UOM"  Visible="False"/>
            <asp:BoundField DataField="ItemManufacturer" HeaderText="Manuf" SortExpression="ItemManufacturer"  Visible="False"/>
            <asp:BoundField DataField="ItemManufacturerNumber" HeaderText="Manuf#"  Visible="False" SortExpression="ItemManufacturerNumber" />
            <asp:BoundField DataField="DetailsText" HeaderText="DetailsText" SortExpression="DetailsText"  Visible="False"/>
            <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
            <asp:BoundField DataField="UpdatesText" HeaderText="UpdatesText" SortExpression="UpdatesText"  Visible="False"/>
            <asp:BoundField DataField="Updates" HeaderText="Updates" SortExpression="Updates" />
            <asp:BoundField DataField="DateEntered" HeaderText="Date Entered" SortExpression="DateEntered" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="LastUpdated" HeaderText="Last Updated" SortExpression="LastUpdated" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="DaysOpen" HeaderText="Days Open" SortExpression="DaysOpen" />
            <asp:BoundField DataField="DateCompleted" HeaderText="Date Completed" SortExpression="DateCompleted" DataFormatString="{0:d}" />
            <asp:BoundField DataField="BinStatus" HeaderText="Bin Status" SortExpression="BinStatus" />
            <asp:BoundField DataField="Status" HeaderText="QCN Status" SortExpression="Status" />
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
        <asp:ImageButton ID="ImageButton1" runat="Server" ImageUrl="~/img/ExportExcel.gif" OnClick="ExportToExcel" Height="25px" />
    </p>
    <p>
        &nbsp;</p>
    <p>
  
        <asp:SqlDataSource ID="QCNDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" 
                SelectCommand="exec sp_SelectQCN @LocationName,@Completed" DeleteCommand="exec sp_DeleteQCN @QCNID">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchList1" PropertyName="Text" DefaultValue="%" Name="LocationName"></asp:ControlParameter>
                <asp:ControlParameter ControlID="CompletedCB" Name="Completed" PropertyName="Checked" /> 
            </SelectParameters>



        </asp:SqlDataSource>
</p>
</asp:TableCell>
    </asp:TableRow>
        </asp:Table> </asp:Panel>   
</asp:Content>


