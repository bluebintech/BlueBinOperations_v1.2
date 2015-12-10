<%@ Page Title="EditQCN Form" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="QCNFormEdit.aspx.vb" Inherits="QCNFormEdit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:panel runat ="server">
<asp:Table ID="PageTable" runat="server" Width="500px" align = "center">
<asp:TableRow><asp:TableCell><h2>Edit QCN Form</h2></asp:TableCell></asp:TableRow>
<asp:TableRow>
    <asp:TableCell Width="500px"  BorderColor="#032169" BorderStyle="Solid" BorderWidth="1">


        <asp:Table ID="Table3" runat="server" CellPadding="10" Width="500px" BorderWidth="10" BorderColor="#eeeeee" BackColor="#eeeeee">
            <asp:TableRow Height="10"><asp:TableCell Width="150px"><img src="img/Bluebin_logo-inline.png" width="150" /></asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
            </asp:Table>
        <asp:Table ID="Table1" runat="server" CellPadding="10" Width="500px" BorderWidth="10" BorderColor="#eeeeee" BackColor="#eeeeee">

            
            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="QCNID" runat="server" Text="Audit Stage#" BackColor="#eeeeee"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="QCNIDTB" runat="server"  ReadOnly="True" BackColor="#eeeeee"  Width="40px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            
            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="LabelDateEntered" runat="server" Text="Date Created" BackColor="#eeeeee"></asp:Label>
                </asp:TableCell>
                <asp:TableCell >
                    <asp:TextBox ID="DateEnteredTB" runat="server"  ReadOnly="True" BackColor="#eeeeee" DataFormatString="{0:d}" Width="100px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            
            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="LabelLastUpdated" runat="server" Text="Date Updated" BackColor="#eeeeee"></asp:Label>
                </asp:TableCell>
                <asp:TableCell >
                    <asp:TextBox ID="LastUpdatedTB" runat="server"  ReadOnly="True" BackColor="#eeeeee" DataFormatString="{0:d}" Width="100px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            
            <asp:TableRow >    
                <asp:TableCell>
                    <asp:Label ID="LabelDateCompleted" runat="server" Text="Date Completed" BackColor="#eeeeee"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="DateCompletedTB" runat="server"  ReadOnly="True" BackColor="#eeeeee" DataFormatString="{0:d}" Width="100px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            
            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="Location" runat="server" Text="Location"></asp:Label>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorLocation" ControlToValidate="LocationDD" runat="server" ForeColor="Red"  ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="LocationDD"  AppendDataBoundItems="true" runat="server" DataSourceID="LocationSource" DataTextField="LocationName" DataValueField="LocationID"  AutoPostBack="True">
                <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
            </asp:DropDownList>
                </asp:TableCell>
                 </asp:TableRow>
            <asp:TableRow Height="10"></asp:TableRow>
            
            
            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="ClinicalDescription"  runat="server" Text="Item Description"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:DropDownList ID="ClinicalDescriptionDD"   AutoPostBack="True" AppendDataBoundItems="true" runat="server" DataTextField="ExtendedDescription" DataValueField="ItemID" DataSourceID="ClinicalDSource">
                                        <asp:ListItem Text = "--Select--" Value = "" Selected="True"></asp:ListItem>

                    </asp:DropDownList>
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="Requester" runat="server" Text="Requester"></asp:Label>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorRequester" ControlToValidate="RequesterDD" runat="server" ForeColor="Red" ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
                </asp:TableCell><asp:TableCell>
                    <asp:DropDownList ID="RequesterDD"  AppendDataBoundItems="true" runat="server" DataSourceID="RequesterUserSource" DataTextField="RequesterFullName" DataValueField="RequesterFullName">
                    <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>

                    </asp:DropDownList>
                </asp:TableCell></asp:TableRow>
            <asp:TableRow Height="10"></asp:TableRow>

            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="Assigned" runat="server" Text="Assigned"></asp:Label>
                          </asp:TableCell><asp:TableCell>
                    <asp:DropDownList ID="AssignedDD"  AppendDataBoundItems="true" runat="server" DataSourceID="AssignedUserSource" DataTextField="AssignedFullName" DataValueField="AssignedFullName">
                    <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>

                    </asp:DropDownList>
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>


            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="QCNType" runat="server" Text="QCN Type"></asp:Label>
        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorQCNType" ControlToValidate="QCNTypeDD" runat="server" ForeColor="Red"  ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>

                </asp:TableCell><asp:TableCell>
                    <asp:DropDownList ID="QCNTypeDD"   AppendDataBoundItems="true" runat="server" DataSourceID="QCNTypeSource" DataTextField="Name" DataValueField="Name">
                    <asp:ListItem Selected = "True" Text = "--Select--" Value=""></asp:ListItem>

                    </asp:DropDownList>
                </asp:TableCell></asp:TableRow>
             <asp:TableRow Height="10"></asp:TableRow>


                 
                 
                       <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="QCNStatus" runat="server" Text="Status"></asp:Label>

                </asp:TableCell><asp:TableCell>
                    <asp:DropDownList ID="QCNStatusDD" AppendDataBoundItems="true" runat="server" DataSourceID="QCNStatusSource" DataTextField="Status" DataValueField="Status">
                   <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem> </asp:DropDownList>
                    
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10">

                                               </asp:TableRow>
                       <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="Details" runat="server" Text="Details" ></asp:Label>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorDetails" ControlToValidate="DetailsTB" runat="server" ForeColor="Red"  ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>

                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="DetailsTB" runat="server" Height="150px" Width="575px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
                       <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="Updates" runat="server" Text="Updates"></asp:Label>
        
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="UpdatesTB" runat="server" Height="150px" Width="575px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Height="10"></asp:TableRow>
        </asp:Table>
 
 </asp:TableCell> 

    </asp:TableRow> 
    
    <asp:TableRow Height="10"></asp:TableRow>
 <asp:TableRow><asp:TableCell><asp:Button ID="QCNSubmit" runat="server" Text="Submit" />&nbsp;<asp:Button ID="QCNCancel" runat="server" Text="Cancel" CausesValidation="false"/><br /></asp:TableCell></asp:TableRow>       
      
        </asp:Table>

    
    <br />&nbsp;&nbsp; <br /><br /><br /><br /><br /><asp:SqlDataSource ID="LocationSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" SelectCommand="SELECT LocationID,LocationName FROM [bluebin].[DimLocation] where BlueBinFlag = 1"></asp:SqlDataSource>      
        <asp:SqlDataSource ID="QCNTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" SelectCommand="SELECT DISTINCT [Name] FROM [qcn].[QCNType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="AssignedUserSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" SelectCommand="SELECT LastName + ', ' + FirstName + ' (' + Login + ')' as AssignedFullName FROM [bluebin].[BlueBinResource]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="RequesterUserSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" SelectCommand="SELECT LastName + ', ' + FirstName + ' (' + Login + ')' as RequesterFullName FROM [bluebin].[BlueBinResource]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="QCNStatusSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" SelectCommand="SELECT DISTINCT [Status] FROM [qcn].[QCNStatus]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ClinicalDSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" SelectCommand="
            Select distinct a.LocationID,rTrim(a.ItemID) as ItemID,b.ItemClinicalDescription,rTrim(a.ItemID)+ ' - ' + b.ItemClinicalDescription as ExtendedDescription 
from [bluebin].[DimBin] a 
                                inner join [bluebin].[DimItem] b on rtrim(a.ItemID) = rtrim(b.ItemID)  where b.ItemClinicalDescription is not null "  
            FilterExpression="LocationID = '{0}'" >
        <FilterParameters>
        <asp:ControlParameter Name="LocationID" ControlID="LocationDD" PropertyName="SelectedValue" />
        </FilterParameters>
        </asp:SqlDataSource>
       
    
    
  
</asp:panel>
</asp:Content>
