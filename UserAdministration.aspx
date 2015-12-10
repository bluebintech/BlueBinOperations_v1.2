<%@ Page Title="User Administration" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="UserAdministration.aspx.vb" Inherits="UserAdministration" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<asp:Table ID="PageTable" runat="server" Width="500px" HorizontalAlign="Center">
<asp:TableRow><asp:TableCell><h2><%: Title %></h2>
    <p>Welcome to Administration for your BlueBin Operations Site.  You can update the below User Information to Create, Update, Deactivate, or Change Information (including Passwords) on your BlueBin Application Users.</p>
    <p>
            <asp:LinkButton ID="UsersB" runat="server" class="btn btn-default">Users</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="RolesB" runat="server" class="btn btn-default">Roles</asp:LinkButton>&nbsp;
            
        </p>
</asp:TableCell></asp:TableRow>
<asp:TableRow Height="10"></asp:TableRow>
    <asp:TableRow><asp:TableCell>
        <asp:Table runat="server" ID="SearchTable">
                <asp:TableRow>
                <asp:TableCell><asp:TextBox ID="SearchBox" runat="server" Width="150px"></asp:TextBox></asp:TableCell>
                <asp:TableCell>&nbsp;<asp:Button ID="LinkButton1" runat="server" CausesValidation="False" Text="Search Name"></asp:Button></asp:TableCell>
                </asp:TableRow>
            <asp:TableRow Height="10px"></asp:TableRow>
            </asp:Table>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow>
    <asp:TableCell Width="500px"  >
        <asp:Label runat="server" id="hiddenUsers" Visible="False"><h3>Users</h3></asp:Label>
            <p> 
                
            

        <asp:GridView ID="GridViewUsers"  OnRowCommand="GridViewUsers_RowCommand" CssClass="GridViewitem" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" DataSourceID="UsersDataSource" AutoGenerateColumns="False" DataKeyNames="BlueBinUserID" AllowSorting="True" AllowPaging="True" ShowFooter="True">
        <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>

        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button runat="server" Text="Update" CommandName="Update" CausesValidation="True" ValidationGroup="EditUsers" ID="Button1"></asp:Button>&nbsp;<asp:Button runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="Button2"></asp:Button>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="Button1"></asp:Button>
                </ItemTemplate>
                <FooterTemplate><asp:LinkButton ID="UsersInsert" runat="server" Text="Add" CausesValidation="True" ValidationGroup="AddUsers"  CommandName="UsersInsert"></asp:LinkButton></FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="BlueBinUserID">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("BlueBinUserID") %>' ID="ETIDL"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("BlueBinUserID") %>' ID="ITIDL"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Login" InsertVisible="False" SortExpression="UserLogin">
                <EditItemTemplate>
                    <asp:Label runat="server" Width="80px" Text='<%# Eval("UserLogin") %>' ID="ETUserLoginL"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("UserLogin") %>' ID="ITUserLoginL"></asp:Label>
                </ItemTemplate>
                <FooterTemplate><asp:TextBox runat="server" Width="120px" ID="UserLogin"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorUserLogin" ValidationGroup="AddUsers" runat="server" ControlToValidate="UserLogin" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>
                             
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Width="80px" Text='<%# Bind("FirstName") %>' ID="FNTB"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("FirstName") %>' ID="ITFNL"></asp:Label>
                </ItemTemplate>
                <FooterTemplate><asp:TextBox runat="server" Width="100px" ID="FirstName"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" ValidationGroup="AddUsers" runat="server" ControlToValidate="FirstName" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Width="80px" Text='<%# Bind("LastName") %>' ID="LNTB"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("LastName") %>' ID="ITLNL"></asp:Label>
                </ItemTemplate>
                <FooterTemplate><asp:TextBox runat="server" Width="100px" ID="LastName"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" ValidationGroup="AddUsers" runat="server" ControlToValidate="LastName" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>
                <ItemStyle Wrap="False" Width="50px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Middle Name" SortExpression="MiddleName">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Width="80px" Text='<%# Bind("MiddleName") %>' ID="MNTB"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("MiddleName") %>' ID="ITMNL"></asp:Label>
                </ItemTemplate>
                <FooterTemplate><asp:TextBox runat="server" Width="80px" ID="MiddleName"></asp:TextBox></FooterTemplate>
                <ItemStyle Wrap="False" Width="50px"></ItemStyle>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Active" SortExpression="Active">
                <EditItemTemplate>
                    <asp:DropDownList runat="server"  AutoPostBack="False" ID="ResourceActiveDD" SelectedValue=<%#Bind("Active")%>>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ActiveName") %>' ID="ITActiveL"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Updated" InsertVisible="False" SortExpression="LastUpdated">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("LastUpdated", "{0:d}") %>' ID="ETLastUpdateL"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("LastUpdated", "{0:d}") %>' ID="ITLastUpdatedL"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role" SortExpression="RoleID">
                <EditItemTemplate>
                    <asp:DropDownList runat="server" ID="RoleDD" SelectedValue='<%# Bind("RoleName") %>' DataSourceID="RolesDataSource" DataTextField="RoleName" DataValueField="RoleName">
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="RolesDataSource" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' SelectCommand="SELECT DISTINCT [RoleID],[RoleName] FROM bluebin.[BlueBinRoles]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("RoleName") %>' ID="ITRoleNameL"></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList runat="server" ID="RoleDDF" DataSourceID="RolesDataSourceF" DataTextField="RoleName" DataValueField="RoleName" AppendDataBoundItems="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="RolesDataSourceF" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' SelectCommand="SELECT DISTINCT [RoleName] FROM bluebin.[BlueBinRoles]"></asp:SqlDataSource>
                </FooterTemplate>
                <ItemStyle Wrap="False" Width="60px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Login" InsertVisible="False" SortExpression="LastLoginDate">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("LastLoginDate", "{0:d}") %>' ID="ETLastLoginL"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("LastLoginDate", "{0:d}") %>' ID="ITLastLoginL"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password" SortExpression="Password">
                <EditItemTemplate>
                    <asp:TextBox runat="server"  TextMode="Password" Text='<%# Bind("Password") %>' Width="50px" ID="Password"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Password") %>' TextMode="Password" ID="ITPasswordL"></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Change PWD?" SortExpression="MustChangePassword">
                <EditItemTemplate>
                    <asp:DropDownList runat="server"  AutoPostBack="False" ID="MustChangePasswordDD" SelectedValue=<%#Bind("MustChangePassword")%>>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("MustChangePasswordName") %>' ID="ITMCPL"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle Wrap="False" Width="20px"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Expires" SortExpression="PasswordExpires">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("PasswordExpires") %>'  Width="30px" ID="PasswordExpiresTB"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("PasswordExpires") %>' ID="ITExpiresL"></asp:Label>
                </ItemTemplate>
                <ItemStyle Wrap="True" Width="20px"></ItemStyle>
            </asp:TemplateField>
            
            
            
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Width="80px" Text='<%# Bind("Email") %>' ID="EmailTB"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Email") %>' ID="ITEmailL"></asp:Label>
                </ItemTemplate>
                <FooterTemplate><asp:TextBox runat="server" Width="80px" ID="Email"></asp:TextBox></FooterTemplate>
                <ItemStyle Wrap="False" Width="50px"></ItemStyle>
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
    <asp:TableRow Height="10px"></asp:TableRow>
    <asp:TableRow><asp:TableCell><asp:Label runat="server" id="AddUserErrorLabel"></asp:Label></asp:TableCell></asp:TableRow>
<asp:TableRow>
<asp:TableCell Width="500px"  >
<asp:Label runat="server" id="hiddenRoles" Visible="False"><h3>Roles</h3><p></asp:Label>
        <asp:GridView ID="GridViewRoles" OnRowCommand="GridViewRoles_RowCommand" CssClass="GridViewitem" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" DataSourceID="RolesDatasource" AutoGenerateColumns="False" DataKeyNames="RoleID" AllowSorting="True" AllowPaging="True" ShowFooter="True">
        <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>

        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button runat="server" Text="Update" CommandName="Update" CausesValidation="True" ValidationGroup="EditRoles" ID="Button1"></asp:Button>&nbsp;<asp:Button runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="Button2"></asp:Button>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="ITRolesB"></asp:Button>
                </ItemTemplate>
                <FooterTemplate><asp:LinkButton ID="RolesInsert" runat="server" Text="Add" CausesValidation="True" ValidationGroup="AddRoles"  CommandName="RolesInsert"></asp:LinkButton></FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="RoleID">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("RoleID") %>' ID="LabelRoleIDIT"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("RoleID") %>' ID="LabelRoleIDET"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role Name" SortExpression="RoleName">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("RoleName") %>' ID="LabelRoleNameET"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorName" ValidationGroup="AddRoles" runat="server" ControlToValidate="LabelRoleNameET" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("RoleName") %>' ID="LabelRoleNameIT"></asp:Label>
                </ItemTemplate>
                <FooterTemplate><asp:TextBox runat="server" ID="RoleName"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorRoleName" ValidationGroup="AddRoles" runat="server" ControlToValidate="RoleName" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>
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
        <asp:SqlDataSource runat="server" ID="UsersDataSource" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' 
            DeleteCommand="Delete from bluebin.BlueBinUser where BlueBinUserID = @BlueBinUserID and UserLogin = @UserLogin" 
            SelectCommand="exec sp_SelectUsers @Name" 
            UpdateCommand="exec sp_EditUser @BlueBinUserID,@UserLogin,
            @FirstName,@LastName,@MiddleName,@Active,@Email,
            @MustChangePassword,@PasswordExpires,@Password,@RoleName">
        <DeleteParameters>
            <asp:Parameter Name="BlueBinUserID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UserLogin" Type="String"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="MiddleName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Active"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="MustChangePassword" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="PasswordExpires" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Password"></asp:Parameter>
            <asp:Parameter Name="RoleName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastUpdated" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="BlueBinUserID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UserLogin" Type="String"></asp:Parameter>
        </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchBox" Name="Name" PropertyName="Text" DefaultValue="%"  />
            </SelectParameters>
    </asp:SqlDataSource>

</p>

    <p>
        <asp:SqlDataSource runat="server" ID="RolesDataSource" ConnectionString='<%$ ConnectionStrings:Site_ConnectionString %>' 
            DeleteCommand="Delete from bluebin.BlueBinRoles where RoleID = @RoleID"  
            SelectCommand="exec sp_SelectRoles" 
            UpdateCommand="exec sp_EditRoles @RoleID,@RoleName">
        <DeleteParameters>
            <asp:Parameter Name="RoleID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="RoleName" Type="String"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="RoleID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="RoleName" Type="String"></asp:Parameter>  
        </UpdateParameters>
    </asp:SqlDataSource>

</p>

    
     
</asp:Content>