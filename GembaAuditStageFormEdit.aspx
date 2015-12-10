<%@ Page Title="Gemba Audit Stage Form Edit" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="GembaAuditStageFormEdit.aspx.vb" Inherits="GembaAuditStageFormEdit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:panel runat ="server">
<asp:Table ID="PageTable" runat="server" Width="900px" align = "center">
<asp:TableRow><asp:TableCell><h2>Gemba Audit Stage</h2></asp:TableCell></asp:TableRow>

<asp:TableRow>
    <asp:TableCell Width="900px"  BorderColor="#032169" BorderStyle="Solid" BorderWidth="1">


        <asp:Table ID="Table3" runat="server" CellPadding="10" Width="900px" BorderWidth="10" BorderColor="#CCEEFF" BackColor="#CCEEFF">
            <asp:TableRow Height="10">
                <asp:TableCell Width="350px"><img src="img/Bluebin_logo-inline.png" width="150" /></asp:TableCell>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        
        <asp:Table ID="Table1" runat="server" CellPadding="10" Width="900px" BorderWidth="10" BorderColor="#CCEEFF" BackColor="#CCEEFF">
 
            <%-- Audit Information --%>  
            <asp:TableRow Width="900px" BackColor="#333333">
                <asp:TableCell Width="350px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True">&nbsp;Audit Information</asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="50px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True"></asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="100px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True"></asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True"></asp:Label> 
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
  
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelGembaAuditStageID" runat="server" Text="Audit Stage#" Width="100px" BackColor="#CCEEFF"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px">
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:TextBox ID="GembaAuditStageIDTB" runat="server"  ReadOnly="True" BackColor="#CCEEFF"  Width="100px"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelCurrentTime" runat="server" Text="Date Entered" Width="100px" BackColor="#CCEEFF"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px">
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:TextBox ID="CurrentTimeTB" runat="server"  ReadOnly="True" BackColor="#CCEEFF" DataFormatString="{0:d}" Width="100px"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            
            
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelLastUpdated" runat="server" Text="Last Updated" Width="100px" BackColor="#CCEEFF"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px">
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:TextBox ID="LastUpdatedTB" runat="server"  ReadOnly="True" BackColor="#CCEEFF" DataFormatString="{0:d}" Width="100px"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>



            
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelAuditer" runat="server" Text="Auditer" TextMode="MultiLine" Width="100px"></asp:Label>               
                </asp:TableCell>
                <asp:TableCell Width="50px">
                    </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:TextBox ID="AuditerTB" runat="server"  ReadOnly="True" BackColor="#CCEEFF"  Width="200px" ></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            
            <%-- ROUND 1 --%>  
            <asp:TableRow Width="900px" BackColor="#333333">
                <asp:TableCell Width="350px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True">&nbsp;Item to Check</asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="50px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True"></asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="100px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True">Value</asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True">Why (If No)</asp:Label> 
                </asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow Height="10"></asp:TableRow>
        
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelKanbansFilled" runat="server" Text="Kanbans Filled and Out by 10am"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px"><asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorKanbansFilled" ControlToValidate="KanbansFilledDD" runat="server" ForeColor="Red" ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="KanbansFilledDD"  runat="server" AutoPostBack="False">
                        <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:TextBox ID="KanbansFilledTB" runat="server" Width="350px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelLeftBehind" runat="server" Text="Count of LUM/Dist Bins Left Behind"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px"><asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorLeftBehind" ControlToValidate="LeftBehindDD" runat="server" ForeColor="Red" ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="LeftBehindDD"  runat="server" AutoPostBack="False">
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
                <asp:TableCell Width="350px">
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelFollowUpDistrib" runat="server" Text="Followed Up w/Distributor"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px"><asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorFollowUpDistrib" ControlToValidate="FollowUpDistribDD" runat="server" ForeColor="Red" ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="FollowUpDistribDD"  runat="server" AutoPostBack="False">
                        <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:TextBox ID="FollowUpDistribTB" runat="server" Width="350px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelDirectOrderBins" runat="server" Text="Count of Direct Order Bins"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px"><asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorDirectOrderBins" ControlToValidate="DirectOrderBinsDD" runat="server" ForeColor="Red" ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="DirectOrderBinsDD"  runat="server" AutoPostBack="False">
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
                <asp:TableCell Width="350px">
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">
                <asp:TableCell Width="350px">
                    <asp:Label ID="OldestBin" runat="server" Text="Date of Oldest Bin"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px">               </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:TextBox ID="OldestBinTB" runat="server" Width="130px" ></asp:TextBox> 
                </asp:TableCell>
                <asp:TableCell Width="350px">
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelCheckedOpenOrders" runat="server" Text="Checked Open Orders for all Bins"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px"><asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorCheckedOpenOrders" ControlToValidate="CheckedOpenOrdersDD" runat="server" ForeColor="Red" ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="CheckedOpenOrdersDD"  runat="server" AutoPostBack="False">
                        <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:TextBox ID="CheckedOpenOrdersTB" runat="server" Width="350px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelHowManyLate" runat="server" Text="How Many Are Late"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px"><asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorHowManyLate" ControlToValidate="HowManyLateDD" runat="server" ForeColor="Red" ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="HowManyLateDD"  runat="server" AutoPostBack="False">
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
                <asp:TableCell Width="350px">
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelFollowUpBuyers" runat="server" Text="Followed Up w/Buyer(s)"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px"><asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorFollowUpBuyers" ControlToValidate="FollowUpBuyersDD" runat="server" ForeColor="Red" ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="FollowUpBuyersDD"  runat="server" AutoPostBack="False">
                        <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:TextBox ID="FollowUpBuyersTB" runat="server" Width="350px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelUpdatedStatusTag" runat="server" Text="Hung/Updated Status Tags (all bins in Stage)"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px"><asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorUpdatedStatusTag" ControlToValidate="UpdatedStatusTagDD" runat="server" ForeColor="Red" ErrorMessage=" Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="UpdatedStatusTagDD"  runat="server" AutoPostBack="False">
                        <asp:ListItem Selected = "True" Text = "--Select--" Value = ""></asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:TextBox ID="UpdatedStatusTagTB" runat="server" Width="350px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow Height="10"></asp:TableRow>
            <%-- ROUND 2 --%> 
            <asp:TableRow Width="900px" BackColor="#333333">
                <asp:TableCell Width="350px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True">&nbsp;Item to Check</asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="50px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True"></asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="100px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True">Value</asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True">Why (If No)</asp:Label> 
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelReqsSubmitted" runat="server" Text="Requisitions were submitted correctly"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px">                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="ReqsSubmittedDD"  runat="server" AutoPostBack="False">
                        <asp:ListItem Selected = "True" Text = "--Select--" Value = "3"></asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:TextBox ID="ReqsSubmittedTB" runat="server" Width="350px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelBinsInOrder" runat="server" Text="All Bins are in Order"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px"> </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="BinsInOrderDD"  runat="server" AutoPostBack="False">
                        <asp:ListItem Selected = "True" Text = "--Select--" Value = "3"></asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:TextBox ID="BinsInOrderTB" runat="server" Width="350px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelAreaNeatTidy" runat="server" Text="Area is Neat and Tidy"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px"> </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="AreaNeatTidyDD"  runat="server" AutoPostBack="False">
                        <asp:ListItem Selected = "True" Text = "--Select--" Value = "3"></asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:TextBox ID="AreaNeatTidyTB" runat="server" Width="350px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
             <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                    <asp:Label ID="LabelCartsClean" runat="server" Text="Carts are Clean and Ready for Next Day"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="50px">               </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList ID="CartsCleanDD"  runat="server" AutoPostBack="False">
                        <asp:ListItem Selected = "True" Text = "--Select--" Value = "3"></asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:TextBox ID="CartsCleanTB" runat="server" Width="350px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="10"></asp:TableRow>
           
            <%-- OTHER COMMENTS CONERNS --%> 
            <asp:TableRow Width="900px" BackColor="#333333">
                <asp:TableCell Width="350px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True">&nbsp;Other Comments</asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="50px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True"></asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="100px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True"></asp:Label> 
                </asp:TableCell>
                <asp:TableCell Width="350px">
                <asp:Label runat ="server" ForeColor="White" Font-Bold="True">Concerns</asp:Label> 
                </asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow Height="10"></asp:TableRow>
                <asp:TableRow Width="900px">    
                <asp:TableCell Width="350px">
                <asp:TextBox ID="AdditionalCommentsTB" runat="server" Width="350px" Height="150px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell Width="50px"></asp:TableCell>
                    <asp:TableCell Width="100px"></asp:TableCell>
                    <asp:TableCell Width="350px">
                        <asp:TextBox ID="ConcernsTB" runat="server" Width="350px" Height="150px" TextMode="MultiLine" Text=""></asp:TextBox>
                    </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="10"></asp:TableRow>

          
        </asp:Table>
 
    </asp:TableCell> 

</asp:TableRow> 
    
    <asp:TableRow Height="10"></asp:TableRow>
    <asp:TableRow><asp:TableCell><asp:Button ID="GembaAuditStageFormSubmit" runat="server" Text="Submit" />&nbsp;<asp:Button ID="GembaAuditStageFormCancel" runat="server" Text="Cancel" CausesValidation="false"/><br /></asp:TableCell></asp:TableRow>       
      
</asp:Table>

    
    <br />&nbsp;&nbsp; <br /><br /><br /><br /><br />
        <asp:SqlDataSource ID="GembaAuditStageFormLocationSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" SelectCommand="exec sp_SelectLocation"></asp:SqlDataSource>      
        
  
</asp:panel>
</asp:Content>
