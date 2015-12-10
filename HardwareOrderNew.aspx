<%@ Page Title="HardwareOrderNew" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="HardwareOrderNew.aspx.vb" Inherits="HardwareOrderNew" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:panel runat ="server">
<asp:Table ID="PageTable" runat="server" Width="500px" align = "center">
<asp:TableRow><asp:TableCell><h2>New Hardware Order Form</h2></asp:TableCell></asp:TableRow>
<asp:TableRow>
    <asp:TableCell Width="500px"  BorderColor="#032169" BorderStyle="Solid" BorderWidth="1">


        <asp:Table ID="Table3" runat="server" CellPadding="10" Width="500px" BorderWidth="10" BorderColor="#eeeeee" BackColor="#eeeeee">
            <asp:TableRow Height="10"><asp:TableCell Width="150px"><img src="img/Bluebin_logo-inline.png" width="150" /></asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
            </asp:Table>
        <asp:Table ID="Table1" runat="server" CellPadding="10" Width="500px" BorderWidth="10" BorderColor="#eeeeee" BackColor="#eeeeee">
        
            
            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="DateL" runat="server" Text="Date"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="CurrentTimeTB" runat="server"  ReadOnly="True" BackColor="#eeeeee" DataFormatString="{0:d}" Width="100px"></asp:TextBox>
                 </asp:TableCell>
            </asp:TableRow> <asp:TableRow Height="10"></asp:TableRow>

            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="NameL" runat="server" Text="Customer"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="CustomerTB" runat="server"  ReadOnly="True" BackColor="#eeeeee" Width="100px"></asp:TextBox>
                 </asp:TableCell>
            </asp:TableRow> <asp:TableRow Height="10"></asp:TableRow>
            
            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="Label7" runat="server" Text="Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="NameTB" runat="server"  Width="150px"></asp:TextBox>
                 </asp:TableCell>
            </asp:TableRow> <asp:TableRow Height="10"></asp:TableRow>

            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="Label9" runat="server" Text="Phone"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="PhoneTB" runat="server"  Width="150px"></asp:TextBox>
                 </asp:TableCell>
            </asp:TableRow> <asp:TableRow Height="10"></asp:TableRow>

            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="Label12" runat="server" Text="Email"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="EmailTB" runat="server"  Width="150px"></asp:TextBox>
                 </asp:TableCell>
            </asp:TableRow> <asp:TableRow Height="10"></asp:TableRow>

            <asp:TableRow>    
                <asp:TableCell>
                <asp:Label ID="Item1" runat="server" Text="Item1"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table runat ="server">
                                 <asp:TableRow>
                                <asp:TableCell><asp:DropDownList ID="Item1DD"  AppendDataBoundItems="true" runat="server" DataSourceID="ItemSource" DataTextField="ItemDescription" DataValueField="ItemDescription"  AutoPostBack="True">
                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                Qty<asp:DropDownList ID="Item1DDL"  AppendDataBoundItems="true" runat="server" AutoPostBack="False">
                                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                </asp:TableCell>
                                     
                                </asp:TableRow>

                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
    <asp:TableRow>    
                <asp:TableCell>
                <asp:Label ID="Item2" runat="server" Text="Item2"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table runat ="server">
                                 <asp:TableRow>
                                <asp:TableCell><asp:DropDownList ID="Item2DD"  AppendDataBoundItems="true" runat="server" DataSourceID="ItemSource" DataTextField="ItemDescription" DataValueField="ItemDescription"  AutoPostBack="False">
                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                Qty<asp:DropDownList ID="Item2DDL"  AppendDataBoundItems="true" runat="server" AutoPostBack="False">
                                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>

                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>

            <asp:TableRow>    
                <asp:TableCell>
                <asp:Label ID="Label2" runat="server" Text="Item3"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table  runat ="server">
                                 <asp:TableRow>
                                <asp:TableCell><asp:DropDownList ID="Item3DD"  AppendDataBoundItems="true" runat="server" DataSourceID="ItemSource" DataTextField="ItemDescription" DataValueField="ItemDescription"  AutoPostBack="False">
                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                Qty<asp:DropDownList ID="Item3DDL"  AppendDataBoundItems="true" runat="server" AutoPostBack="False">
                                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>

                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>

            <asp:TableRow>    
                <asp:TableCell>
                <asp:Label ID="Label3" runat="server" Text="Item4"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table  runat ="server">
                                 <asp:TableRow>
                                <asp:TableCell><asp:DropDownList ID="Item4DD"  AppendDataBoundItems="true" runat="server" DataSourceID="ItemSource" DataTextField="ItemDescription" DataValueField="ItemDescription"  AutoPostBack="False">
                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                Qty<asp:DropDownList ID="Item4DDL"  AppendDataBoundItems="true" runat="server" AutoPostBack="False">
                                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>

                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>

            <asp:TableRow>    
                <asp:TableCell>
                <asp:Label ID="Label4" runat="server" Text="Item5"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table  runat ="server">
                                 <asp:TableRow>
                                <asp:TableCell><asp:DropDownList ID="Item5DD"  AppendDataBoundItems="true" runat="server" DataSourceID="ItemSource" DataTextField="ItemDescription" DataValueField="ItemDescription"  AutoPostBack="False">
                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                Qty<asp:DropDownList ID="Item5DDL"  AppendDataBoundItems="true" runat="server" AutoPostBack="False">
                                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>

                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>

            <asp:TableRow>    
                <asp:TableCell>
                <asp:Label ID="Label5" runat="server" Text="Item6"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table  runat ="server">
                                 <asp:TableRow>
                                <asp:TableCell><asp:DropDownList ID="Item6DD"  AppendDataBoundItems="true" runat="server" DataSourceID="ItemSource" DataTextField="ItemDescription" DataValueField="ItemDescription"  AutoPostBack="False">
                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                Qty<asp:DropDownList ID="Item6DDL"  AppendDataBoundItems="true" runat="server" AutoPostBack="False">
                                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>

                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>

            <asp:TableRow>    
                <asp:TableCell>
                <asp:Label ID="Label6" runat="server" Text="Item7"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table  runat ="server">
                                 <asp:TableRow>
                                <asp:TableCell><asp:DropDownList ID="Item7DD"  AppendDataBoundItems="true" runat="server" DataSourceID="ItemSource" DataTextField="ItemDescription" DataValueField="ItemDescription"  AutoPostBack="False">
                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                Qty<asp:DropDownList ID="Item7DDL"  AppendDataBoundItems="true" runat="server" AutoPostBack="False">
                                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>

                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
        
                         

            <asp:TableRow>    
                <asp:TableCell>
                <asp:Label ID="Label1" runat="server" Text="Item8"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table  runat ="server">
                                 <asp:TableRow>
                                <asp:TableCell><asp:DropDownList ID="Item8DD"  AppendDataBoundItems="true" runat="server" DataSourceID="ItemSource" DataTextField="ItemDescription" DataValueField="ItemDescription"  AutoPostBack="False">
                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                Qty<asp:DropDownList ID="Item8DDL"  AppendDataBoundItems="true" runat="server" AutoPostBack="False">
                                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>

                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
       
                         

            <asp:TableRow>    
                <asp:TableCell>
                <asp:Label ID="Label8" runat="server" Text="Item9"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table  runat ="server">
                                 <asp:TableRow>
                                <asp:TableCell><asp:DropDownList ID="Item9DD"  AppendDataBoundItems="true" runat="server" DataSourceID="ItemSource" DataTextField="ItemDescription" DataValueField="ItemDescription"  AutoPostBack="False">
                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                Qty<asp:DropDownList ID="Item9DDL"  AppendDataBoundItems="true" runat="server" AutoPostBack="False">
                                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>

                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
     
                         
 
            <asp:TableRow>    
                <asp:TableCell>
                <asp:Label ID="Label10" runat="server" Text="Item10"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table  runat ="server">
                                 <asp:TableRow>
                                <asp:TableCell><asp:DropDownList ID="Item10DD"  AppendDataBoundItems="true" runat="server" DataSourceID="ItemSource" DataTextField="ItemDescription" DataValueField="ItemDescription"  AutoPostBack="False">
                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                Qty<asp:DropDownList ID="Item10DDL"  AppendDataBoundItems="true" runat="server" AutoPostBack="False">
                                            <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                        <asp:ListItem Value="8">8</asp:ListItem>
                                        <asp:ListItem Value="9">9</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>

                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
          <asp:TableRow Height="10"></asp:TableRow>
                         
            <asp:TableRow>    
                <asp:TableCell>
                    <asp:Label ID="Label11" runat="server" Text="Details" ></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="DetailsTB" runat="server" Height="150px" Width="575px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>

            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            
            
        </asp:Table>
 
 </asp:TableCell> 

    </asp:TableRow> 
    
    <asp:TableRow Height="10"></asp:TableRow>
 <asp:TableRow><asp:TableCell><asp:Button ID="HardwareOrderSubmitEmail" runat="server" Text="Submit Order" />&nbsp;
     <asp:Button ID="HardwareOrderCancel" runat="server" Text="Cancel" /><br /></asp:TableCell>
 </asp:TableRow>       
      
        </asp:Table>

    
   
    
    
  
</asp:panel>
    
</asp:Content>
