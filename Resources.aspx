<%@ Page Title="Resources" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Resources.aspx.vb" Inherits="Resources" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
   
<asp:Table ID="PageTable" runat="server" Width="500px" align = "center">
<asp:TableRow><asp:TableCell><h2><%: Title %></h2>
    <p>Welcome to the Resource Information for your BlueBin Operations Site.  </p>
    <p>In your Gemba Audit Forms the below Resources will be available as potential Auditers and Techs.  
        In your QCNs Forms, the below Resources will be available to either Assign or designate as the Reporter of the QCN. </p>
              </asp:TableCell></asp:TableRow>
<asp:TableRow>
    <asp:TableCell Width="500px"  >
        <p>
            <br />
            <asp:TextBox ID="SearchBox" runat="server" Width="150px"></asp:TextBox>
            &nbsp;<asp:Button ID="LinkButton1" runat="server" CausesValidation="False" Text="Search Name"></asp:Button>
</p>
        <p>
        <asp:GridView ID="GridViewBlueBinResource" OnRowCommand="BlueBinResource_RowCommand" CssClass="GridViewitem" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="BlueBinResourceSource1" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="BlueBinResourceID" PageSize="15" ShowFooter="True" EditRowStyle-Width="50px" EditRowStyle-CssClass="ResourceRowWidth">
            <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button runat="server" Text="Update" CommandName="Update" CausesValidation="True" ValidationGroup="Edit" ID="Button1"></asp:Button>&nbsp;<asp:Button runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="Button2"></asp:Button>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="Button1"></asp:Button>
                    </ItemTemplate>
                    <FooterTemplate><asp:LinkButton ID="ResourceInsert" runat="server" Text="Add" CommandName="ResourceInsert"></asp:LinkButton></FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="BlueBinResourceID">
                    <EditItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("BlueBinResourceID") %>' ID="Label1"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("BlueBinResourceID") %>' ID="Label1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("LastName") %>' ID="LastNameEdit" Columns="5"></asp:TextBox><asp:RequiredFieldValidator ValidationGroup="Edit" ID="RequiredFieldValidatorLastName" runat="server" ControlToValidate="LastNameEdit" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("LastName") %>' ID="Label2"></asp:Label>
                    </ItemTemplate>

                    <FooterTemplate><asp:TextBox runat="server" ID="LastName" Columns="5"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ControlToValidate="LastName" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("FirstName") %>' ID="FirstNameEdit" Columns="5"></asp:TextBox><asp:RequiredFieldValidator ValidationGroup="Edit" ID="RequiredFieldValidatorFirstName" runat="server" ControlToValidate="FirstNameEdit" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("FirstName") %>' ID="Label3"></asp:Label>
                    </ItemTemplate>

                    <FooterTemplate><asp:TextBox runat="server" ID="FirstName" Columns="5"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ControlToValidate="FirstName" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="MiddleName" SortExpression="MiddleName">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("MiddleName") %>' ID="TextBox3" Columns="5"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("MiddleName") %>' ID="Label4"></asp:Label>
                    </ItemTemplate>

                    <FooterTemplate><asp:TextBox runat="server" ID="MiddleName" Columns="5"></asp:TextBox></FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Login" SortExpression="Login">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Login") %>' ID="LoginEdit" Columns="5"></asp:TextBox><asp:RequiredFieldValidator ValidationGroup="Edit" ID="RequiredFieldValidatorLogin" runat="server" ControlToValidate="LoginEdit" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Login") %>' ID="Label5"></asp:Label>
                    </ItemTemplate>

                    <FooterTemplate><asp:TextBox runat="server" ID="Login" Columns="5"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorLogin" runat="server" ControlToValidate="Login" Display="Dynamic" ForeColor="Red" Font-Size="X-Small">REQUIRED</asp:RequiredFieldValidator></FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Email") %>' ID="TextBox5"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Email") %>' ID="Label6"></asp:Label>
                    </ItemTemplate>
                        <FooterTemplate><asp:TextBox runat="server" ID="Email"></asp:TextBox></FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Title") %>' ID="TextBox6" Columns="5"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Title") %>' ID="Label7"></asp:Label>
                    </ItemTemplate>

                    <FooterTemplate><asp:TextBox runat="server" ID="Title" Columns="5"></asp:TextBox></FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Phone") %>' ID="TextBox7" Columns="5"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Phone") %>' ID="Label8"></asp:Label>
                    </ItemTemplate>

                    <FooterTemplate><asp:TextBox runat="server" ID="Phone" Columns="5"></asp:TextBox></FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cell" SortExpression="Cell">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Cell") %>' ID="TextBox8"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Cell") %>' ID="Label9"></asp:Label>
                    </ItemTemplate>

                    <ControlStyle CssClass="resourcewide"></ControlStyle>
 
                    <FooterTemplate><asp:TextBox runat="server" ID="Cell" Columns="5"></asp:TextBox></FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Active" SortExpression="Active">
                <EditItemTemplate>
                    <asp:DropDownList runat="server"  AutoPostBack="False" ID="ResourceActiveDD" SelectedValue=<%#Bind("Active")%>>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ActiveName") %>' ID="LabelResource"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Updated" InsertVisible="False" SortExpression="LastUpdated">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("LastUpdated", "{0:d}") %>' ID="LabelEditResource"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("LastUpdated", "{0:d}") %>' ID="LabelItemResource"></asp:Label>
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
        <p>
 
        </p>
            <p>
        <asp:ImageButton ID="ExportResouces" runat="Server" ImageUrl="~/img/ExportExcel.gif" OnClick="ExportToExcelResouces" Height="25px" CausesValidation="False" />
    </p>

</asp:TableCell>
    </asp:TableRow>
    </asp:Table>
    

    <p>
        <asp:SqlDataSource ID="BlueBinResourceSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>"
            SelectCommand="exec sp_SelectBlueBinResource @Name"
            UpdateCommand="exec sp_EditBlueBinResource  @BlueBinResourceID,@FirstName,@LastName,@MiddleName,@Login,@Email,@Phone,@Cell,@Title,@Active">
            <UpdateParameters>
                <asp:Parameter Name="FirstName"></asp:Parameter>
                <asp:Parameter Name="LastName"></asp:Parameter>
                <asp:Parameter Name="MiddleName"></asp:Parameter>
                <asp:Parameter Name="Login"></asp:Parameter>
                 <asp:Parameter Name="Email"></asp:Parameter>
                <asp:Parameter Name="Title"></asp:Parameter>
                <asp:Parameter Name="Phone"></asp:Parameter>
                <asp:Parameter Name="Cell"></asp:Parameter>
                <asp:Parameter Name="Active"></asp:Parameter>
                <asp:Parameter Name="LastUpdated"></asp:Parameter>
                <asp:Parameter Name="BlueBinResourceID"></asp:Parameter>
            </UpdateParameters>
             <SelectParameters>
                <asp:ControlParameter ControlID="SearchBox" Name="Name" PropertyName="Text" DefaultValue="%"  />
            </SelectParameters>
        </asp:SqlDataSource>

        

</p>

</asp:Content>
