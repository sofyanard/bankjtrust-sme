<%@ Page language="c#" Codebehind="ScoringMain.aspx.cs" AutoEventWireup="True" Inherits="SME.Scoring.ScoringMain" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Verification Assignment</title>
		<META http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body leftMargin="0" topMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<center>
				<TABLE id="Table1" cellSpacing="2" cellPadding="2" width="100%">
					<TBODY>
						<TR>
							<TD class="tdNoBorder"><!--<img src="../Image/HeaderDetailDataEntry.jpg">-->
								<TABLE id="Table2">
									<TR>
										<TD class="tdBGColor2" style="WIDTH: 400px" align="center"><B> Final&nbsp;Scoring&nbsp;: 
												Main</B></TD>
									</TR>
								</TABLE>
							</TD>
							<TD class="tdNoBorder" align="right"><A href="ListCustomer.aspx?si="></A>
								<asp:ImageButton id="BTN_BACK" runat="server" ImageUrl="/SME/Image/back.jpg" onclick="BTN_BACK_Click"></asp:ImageButton><A href="../Body.aspx"><IMG src="../Image/MainMenu.jpg"></A><A href="../Logout.aspx" target="_top"><IMG src="../Image/Logout.jpg"></A></TD>
						</TR>
						<TR>
							<TD class="tdNoBorder" style="HEIGHT: 41px" align="center" colSpan="2"><asp:placeholder id="Menu" runat="server"></asp:placeholder></TD>
						</TR>
						<TR>
							<TD class="tdNoBorder" style="HEIGHT: 41px" align="center" colSpan="2"><asp:placeholder id="SubMenu" runat="server"></asp:placeholder>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
						</TR>
						<TR>
							<TD class="tdHeader1" colSpan="2">Final&nbsp;Scoring Data</TD>
						</TR>
						<TR>
							<TD class="td" vAlign="top" width="50%">
								<TABLE id="Table6" cellSpacing="0" cellPadding="0" width="100%">
									<TR>
										<TD class="TDBGColor1" style="WIDTH: 129px">Application No.</TD>
										<TD style="WIDTH: 15px">:</TD>
										<TD class="TDBGColorValue"><asp:textbox id="TXT_AP_REGNO" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">Reference&nbsp;No.</TD>
										<TD style="WIDTH: 15px">:</TD>
										<TD class="TDBGColorValue"><asp:textbox id="TXT_CU_REF" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">Tanggal Aplikasi</TD>
										<TD style="WIDTH: 15px">:</TD>
										<TD class="TDBGColorValue"><asp:textbox id="TXT_AP_SIGNDATE" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">Sub-Segment/Program</TD>
										<TD style="WIDTH: 15px">:</TD>
										<TD class="TDBGColorValue"><asp:textbox id="TXT_PROGRAMDESC" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">Unit</TD>
										<TD style="WIDTH: 15px">:</TD>
										<TD class="TDBGColorValue"><asp:textbox id="TXT_BRANCH_NAME" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">Team Leader</TD>
										<TD>:</TD>
										<TD class="TDBGColorValue" style="HEIGHT: 17px"><asp:textbox id="TXT_AP_TEAMLEADER" runat="server" ReadOnly="True" Width="300px" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">Relationship Manager</TD>
										<TD>:</TD>
										<TD class="TDBGColorValue" style="HEIGHT: 17px"><asp:textbox id="TXT_AP_RELMNGR" runat="server" ReadOnly="True" Width="300px" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">Business Unit</TD>
										<TD>:</TD>
										<TD class="TDBGColorValue" style="HEIGHT: 17px"><asp:textbox id="TXT_AP_BUSINESSUNIT" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
								</TABLE>
								<asp:label id="LBL_CU_CUSTTYPEID" runat="server" Visible="False"></asp:label>
								<asp:label id="LBL_CU_JNSNASABAH" runat="server" Visible="False"></asp:label>
								<asp:label id="LBL_PROGRAMID" runat="server" Visible="False"></asp:label></TD>
							<TD class="td" vAlign="top" width="50%">
								<TABLE id="Table3" cellSpacing="0" cellPadding="0" width="100%">
									<TR>
										<TD class="TDBGColor1" width="150">Name</TD>
										<TD style="WIDTH: 15px">:</TD>
										<TD class="TDBGColorValue"><asp:textbox id="TXT_NAME" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">Address</TD>
										<TD style="WIDTH: 15px">:</TD>
										<TD class="TDBGColorValue"><asp:textbox id="TXT_ADDRESS1" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1" style="HEIGHT: 11px">&nbsp;</TD>
										<TD style="HEIGHT: 11px"></TD>
										<TD class="TDBGColorValue" style="HEIGHT: 11px"><asp:textbox id="TXT_ADDRESS2" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">&nbsp;</TD>
										<TD></TD>
										<TD class="TDBGColorValue" style="HEIGHT: 17px"><asp:textbox id="TXT_ADDRESS3" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">City</TD>
										<TD>:</TD>
										<TD class="TDBGColorValue" style="HEIGHT: 17px"><asp:textbox id="TXT_CITY" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">Phone No.</TD>
										<TD>:</TD>
										<TD class="TDBGColorValue"><asp:textbox id="TXT_PHONENUM" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<TR>
										<TD class="TDBGColor1">Business Type</TD>
										<TD>:</TD>
										<TD class="TDBGColorValue"><asp:textbox id="TXT_BUSINESSTYPE" runat="server" Width="300px" ReadOnly="True" BorderStyle="None"></asp:textbox></TD>
									</TR>
									<!--<TR>
										<TD class="TDBGColor1">Nama Analis</TD>
										<TD>:</TD>
										<TD class="TDBGColorValue"><asp:textbox id="Textbox2" runat="server" Width="175px" ReadOnly="True"></asp:textbox></TD>
									</TR>-->
								</TABLE>
								<asp:button id="Button1" runat="server" Width="142px" Visible="False" CssClass="Button1" Text="View Entry To Send"></asp:button>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				<table id="Table3" cellSpacing="0" cellPadding="0" width="100%">
					<tr>
						<td align="center"><asp:placeholder id="PlaceHolder1" runat="server"></asp:placeholder>
							<asp:label id="lbl_regno" runat="server" Visible="False"></asp:label>
							<asp:label id="lbl_curef" runat="server" Visible="False"></asp:label>
							<asp:Label id="lbl_tc" runat="server" Visible="False">lbl_tc</asp:Label><BR>
							<BR>
							<asp:button id="BTN_VIEW_LIST" runat="server" Width="142px" Text="View Entry To Send" CssClass="Button1"
								Visible="False" onclick="BTN_VIEW_LIST_Click"></asp:button>
							<asp:button id="BTN_SND_FAIRISAAC" runat="server" Width="167px" CssClass="Button1" Text="Send To StrategyWare"
								Visible="False" onclick="BTN_SND_FAIRISAAC_Click"></asp:button>
                                <% if (ConfigurationManager.AppSettings["IsCAS-BPMCR"] != "YES")
                                   {%>
							<asp:button id="BTN_SCORING_RESULT" runat="server" Width="125px" CssClass="Button1" Text="Scoring Result" onclick="BTN_SCORING_RESULT_Click"></asp:button>
							<%}
                                   else
                                   {
                             %>
                             <asp:button id="BTN_UPDATE_STATUS" runat="server" Width="125px" 
                                CssClass="Button1" Text="UPDATE STATUS" onclick="BTN_UPDATE_STATUS_Click"></asp:button>
                             <% 
                                   }   
                              %>
                            
                            <FONT color="cornflowerblue">
								<BR>
                                <% if (ConfigurationManager.AppSettings["IsCAS-BPMCR"] != "YES")
                                   {%>
								<TABLE id="Table5" cellSpacing="0" cellPadding="0" width="100%" border="0">
									<TR>
										<TD align="center" bgColor="red"><STRONG><FONT color="#ffffff"> Note : Setiap ada perubahan 
													data,&nbsp;HARUS diperbarui untuk menghasilkan hasil scoring yang akurat.</FONT></STRONG></TD>
									</TR>
								</TABLE>
                                <% 
                                   }   
                              %>
							</FONT>
						</td>
					</tr>
				</table>
				<table id="Table4" cellSpacing="0" cellPadding="0" width="100%">
					<tr>
						<!--../dataentry/custproduct.aspx?regno=<%=Request.QueryString["regno"]%>&curef=<%=Request.QueryString["curef"]%>&sta=view-->
						<td align="center">
							<IFRAME id="if2" name="if2" src="" width="100%" height="2100"></IFRAME>
						</td>
					</tr>
					<TR>
						<TD align="center" style="HEIGHT: 5px"></TD>
					</TR>
					<TR>
						<TD align="center" style="HEIGHT: 33px"></TD>
					</TR>
				</table>
			</center>
		</form>
	</body>
</HTML>
