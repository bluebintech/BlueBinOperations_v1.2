<%@ Page Title="Site Configuration" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="SiteConfiguration.aspx.vb" Inherits="SiteConfiguration" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<asp:Table ID="PageTable" runat="server" Width="500px" HorizontalAlign="Center">
<asp:TableRow><asp:TableCell><h2><%: Title %></h2>
    <p>Welcome to Site Configuration for your BlueBin Operations Site.  You can update the below configurations to change the contect of your site.</p>
    <p>
            <asp:LinkButton ID="AdvancedConfigB" runat="server" class="btn btn-default">Advanced Config</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="QCNTypeConfigB" runat="server" class="btn btn-default">QCN Type</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="QCNStatusConfigB" runat="server" class="btn btn-default">QCN Status</asp:LinkButton>&nbsp;
        <asp:LinkButton ID="AllConfigB" runat="server" class="btn btn-default">All Configs</asp:LinkButton>
        </p>
              </asp:TableCell></asp:TableRow>
<asp:TableRow Height="10"></asp:TableRow>
    <asp:TableRow>
    <asp:TableCell Width="500px"  >
        <asp:Label runat="server" id="hiddenConfig" Visible="False"><h3>Advanced Config</h3></asp:Label>
            <p> 
        <asp:GridView ID="GridViewConfig"  OnRowCommand="GridViewConfig_RowCommand" CssClass="GridViewitem" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" DataSourceID="ConfigDataSource" AutoGenerateColumns="False" DataKeyNames="ConfigID" AllowSorting="True" AllowPaging="True" ShowFooter="True" PageSize="20">
        <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>

        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button runat="server" Text="Update" CommandName="Update" CausesValidation="True" ValidationGroup="EditConfig" ID="Button1"></asp:Button>&nbsp;<asp:Button runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="Button2"></asp:Button>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="Button1"></asp:Button>
                </ItemTemplate>
                <FooterTemplate><asp:LinkButton ID="ConfigInsert" runat="server" Text="Add" CausesValidation="True" ValidationGroup="AddConfig"  CommandName="ConfigInsert"></asp:LinkButton></FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ConfigID">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ConfigID") %>' ID="Label1"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ConfigID") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Config Type" SortExpression="ConfigType">
                <EditItemTemplate>
                        <asp:DropDownList runat="server"  ID="ConfigTypeInsertDD" DataSourceID="ConfigTypeDataSource"  DataTextField="ConfigType" DataValueField="ConfigType" SelectedValue=<%#Bind("ConfigType")%>>
                        </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ConfigTypeDataSource" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' SelectCommand="SELECT DISTINCT [ConfigType] FROM bluebin.[Config]"></asp:SqlDataSource>
                     
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ConfigType") %>' ID="ConfigTypeLabel2"></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList runat="server"  AutoPostBack="False" ID="ConfigTypeInsertDDF" DataSourceID="ConfigTypeDataSourceF"  DataTextField="ConfigType" DataValueField="ConfigType" SelectedValue=<%#Bind("ConfigType")%>>
                        </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ConfigTypeDataSourceF" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' SelectCommand="SELECT DISTINCT [ConfigType] FROM bluebin.[Config]"></asp:SqlDataSource>
                        
                   </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Config Name" SortExpression="ConfigName">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ConfigName") %>' ID="Label2"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ConfigName") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
                <FooterTemplate><asp:TextBox runat="server" ID="ConfigName"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorConfigName" ValidationGroup="AddConfig" runat="server" ControlToValidate="ConfigName" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Config Value" SortExpression="ConfigValue" >
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("ConfigValue") %>' ID="TextBox1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ConfigValue") %>' ID="Label3"></asp:Label>     
                </ItemTemplate>
                <FooterTemplate><asp:TextBox runat="server" ID="ConfigValue"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorConfigValue" ValidationGroup="AddConfig" runat="server" ControlToValidate="ConfigValue" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>

                <ItemStyle Wrap="False" Width="100px"></ItemStyle>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Active" SortExpression="Active">
                <EditItemTemplate>
                    <asp:DropDownList runat="server"  AutoPostBack="False" ID="ConfigActiveDD" SelectedValue=<%#Bind("Active")%>>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ActiveName") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Updated" InsertVisible="False" SortExpression="LastUpdated">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("LastUpdated", "{0:d}") %>' ID="Label3"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("LastUpdated", "{0:d}") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>

        <FooterStyle BackColor="#CCCCCC" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

        <RowStyle BackColor="#EEEEEE" ForeColor="Black"></RowStyle>

        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#0000A9"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#000065"></SortedDescendingHeaderStyle>
    </asp:GridView>
 
        </p>
        </asp:TableCell> </asp:TableRow>
<asp:TableRow>
<asp:TableCell Width="500px"  >
<asp:Label runat="server" id="hiddenQCNType" Visible="False"><h3>QCN Types</h3><p></asp:Label>
        <asp:GridView ID="GridViewQCNType" OnRowCommand="GridViewQCNType_RowCommand" CssClass="GridViewitem" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" DataSourceID="QCNTypeDataSource" AutoGenerateColumns="False" DataKeyNames="QCNTypeID" AllowSorting="True" AllowPaging="True" ShowFooter="True">
        <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>

        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button runat="server" Text="Update" CommandName="Update" CausesValidation="True" ValidationGroup="EditQCNType" ID="Button1"></asp:Button>&nbsp;<asp:Button runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="Button2"></asp:Button>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="Button1"></asp:Button>
                </ItemTemplate>
                <FooterTemplate><asp:LinkButton ID="QCNTypeInsert" runat="server" Text="Add" CausesValidation="True" ValidationGroup="AddQCNType"  CommandName="QCNTypeInsert"></asp:LinkButton></FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="QCNTypeID">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("QCNTypeID") %>' ID="Label1"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("QCNTypeID") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QCN Type Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Name") %>' ID="EditQCNName"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorName" ValidationGroup="EditQCNType" runat="server" ControlToValidate="EditQCNName" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
                <FooterTemplate><asp:TextBox runat="server" ID="Name"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorName" ValidationGroup="AddQCNType" runat="server" ControlToValidate="Name" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Active" SortExpression="Active">
                <EditItemTemplate>
                    <asp:DropDownList runat="server"  AutoPostBack="False" ID="QCNTypeActiveDD" SelectedValue=<%#Bind("Active")%>>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ActiveName") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Updated" InsertVisible="False" SortExpression="LastUpdated">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("LastUpdated", "{0:d}") %>' ID="Label3"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("LastUpdated", "{0:d}") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black"></FooterStyle>
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White"></HeaderStyle>
        <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>
        <RowStyle BackColor="#EEEEEE" ForeColor="Black"></RowStyle>
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#0000A9"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#000065"></SortedDescendingHeaderStyle>
    </asp:GridView>
 
        </p>
</asp:TableCell> </asp:TableRow>
<asp:TableRow>
<asp:TableCell Width="500px"  >
<asp:Label runat="server" id="hiddenQCNStatus" Visible="False"><h3>QCN Status</h3><p></asp:Label>
        
            <asp:GridView ID="GridViewQCNStatus" OnRowCommand="GridViewQCNStatus_RowCommand" CssClass="GridViewitem" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" DataSourceID="QCNStatusDataSource" AutoGenerateColumns="False" DataKeyNames="QCNStatusID" AllowSorting="True" AllowPaging="True" ShowFooter="True">
        <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>

        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button runat="server" Text="Update" CommandName="Update" CausesValidation="True" ValidationGroup="EditStatus" ID="Button1"></asp:Button>&nbsp;<asp:Button runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="Button2"></asp:Button>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="Button1"></asp:Button>
                </ItemTemplate>
                <FooterTemplate><asp:LinkButton ID="QCNStatusInsert" runat="server" Text="Add" CausesValidation="True" ValidationGroup="AddStatus" CommandName="QCNStatusInsert"></asp:LinkButton></FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="QCNStatusID">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("QCNStatusID") %>' ID="Label1"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("QCNStatusID") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QCN Status Name" SortExpression="Status">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Status") %>' ID="EditQCNStatus"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorStatus" ValidationGroup="EditStatus" runat="server" ControlToValidate="EditQCNStatus" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Status") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
                <FooterTemplate><asp:TextBox runat="server" ID="Status"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorStatus" ValidationGroup="AddStatus" runat="server" ControlToValidate="Status" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Active" SortExpression="Active">
                <EditItemTemplate>
                    <asp:DropDownList runat="server"  AutoPostBack="False" ID="QCNTypeActiveDD" SelectedValue=<%#Bind("Active")%>>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ActiveName") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Updated" InsertVisible="False" SortExpression="LastUpdated">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("LastUpdated", "{0:d}") %>' ID="Label3"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("LastUpdated", "{0:d}") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black"></FooterStyle>
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White"></HeaderStyle>
        <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>
        <RowStyle BackColor="#EEEEEE" ForeColor="Black"></RowStyle>
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#0000A9"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#000065"></SortedDescendingHeaderStyle>
    </asp:GridView>

        </p>
</asp:TableCell> </asp:TableRow>

    </asp:Table>
    

<p>
        <asp:SqlDataSource runat="server" ID="ConfigDataSource" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' 
            DeleteCommand="exec sp_DeleteConfig @original_ConfigID,@original_ConfigName,@original_ConfigValue" 
            OldValuesParameterFormatString="original_{0}" SelectCommand="exec sp_SelectConfig" 
            UpdateCommand="exec sp_EditConfig @original_ConfigID,@ConfigValue,@ConfigType,@Active">
        <DeleteParameters>
            <asp:Parameter Name="original_ConfigID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_ConfigType" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ConfigName" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ConfigValue" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Active" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_LastUpdated" Type="DateTime"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ConfigValue" Type="String"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="LastUpdated" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="original_ConfigID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_ConfigName" Type="String"></asp:Parameter>
            <asp:Parameter Name="ConfigType" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

</p>

    <p>
        <asp:SqlDataSource runat="server" ID="QCNTypeDataSource" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' 
            DeleteCommand="exec sp_DeleteQCNType @original_QCNTypeID,@original_Name" 
            OldValuesParameterFormatString="original_{0}" SelectCommand="exec sp_SelectQCNType" 
            UpdateCommand="exec sp_EditQCNType @original_QCNTypeID,@Name,@Active">
        <DeleteParameters>
            <asp:Parameter Name="original_QCNTypeID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="LastUpdated" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="original_QCNTypeID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

</p>

    <p>
        <asp:SqlDataSource runat="server" ID="QCNStatusDataSource" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' 
            DeleteCommand="exec sp_DeleteQCNStatus @original_QCNStatusID,@original_Status" 
            OldValuesParameterFormatString="original_{0}" SelectCommand="exec sp_SelectQCNStatus" 
            UpdateCommand="exec sp_EditQCNStatus @original_QCNStatusID,@Status,@Active">
        <DeleteParameters>
            <asp:Parameter Name="original_QCNStatusID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Status" Type="String"></asp:Parameter>
        </DeleteParameters>

        <UpdateParameters>
            <asp:Parameter Name="Status" Type="String"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="LastUpdated" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="original_QCNStatusID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Status" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

</p>
     
</asp:Content>