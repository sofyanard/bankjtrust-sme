<%@ Page language="c#" Codebehind="DetailRequestInfo.aspx.cs" AutoEventWireup="True" Inherits="SME.Legal.LegalAdviseAdministration.ReviewAnalysis.Main" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<TITLE>DetailRequestInfo</TITLE>
		<META name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<META name="CODE_LANGUAGE" Content="C#">
		<META name="vs_defaultClientScript" content="JavaScript">
		<META name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../../style.css" type="text/css" rel="stylesheet">
  </HEAD>
	<BODY MS_POSITIONING="GridLayout">
		<FORM id="Form1" method="post" runat="server">
			<CENTER>
				<TABLE width="100%" border="0">
					<TR>
						<TD align="left" width="50%">
							<TABLE id="Table1">
								<TR>
									<TD class="tdBGColor2" style="WIDTH: 400px" align="center"><B>ASSIGNMENT &amp; 
											VALIDATION</B></TD>
								</TR>
							</TABLE>
						</TD>
						<TD class="tdNoBorder" align="right"><A href="ListCustomer.aspx?si="></A><asp:imagebutton id="BTN_BACK" runat="server" ImageUrl="/SME/image/Back.jpg" onclick="BTN_BACK_Click"></asp:imagebutton><A href="../../../Body.aspx"><IMG height="25" src="../../../Image/MainMenu.jpg" width="106"></A>
							<A href="../../../Logout.aspx" target="_top"><IMG src="../../../Image/Logout.jpg"></A>
						</TD>
					</TR>
					<TR>
						<TD class="tdNoBorder" style="HEIGHT: 41px" align="center" colSpan="2"><asp:placeholder id="Menu" runat="server"></asp:placeholder></TD>
					</TR>
					<TR>
						<TD class="tdHeader1" colSpan="2">REQUEST DETAIL</TD>
					</TR>
					<TR>
						<TD class="td" style="HEIGHT: 7px" vAlign="top" width="50%">
							<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%">
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TXT_REF" runat="server">No.Referensi :</asp:label></TD>
									<TD class="TDBGColorValue"><asp:textbox id="TXT_REF" runat="server" Width="100%" Enabled="False"></asp:textbox></TD>
								</TR>
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TGL_REQUEST" runat="server">Tanggal Permintaan :</asp:label></TD>
									<TD class="TDBGColorValue" colSpan="2"><asp:textbox onkeypress="return numbersonly()" id="TXT_REQUEST_DAY" runat="server" Width="24px"
											MaxLength="2" Columns="4" Enabled="False"></asp:textbox><asp:dropdownlist id="DDL_REQUEST_MONTH" runat="server" Enabled="False"></asp:dropdownlist><asp:textbox onkeypress="return numbersonly()" id="TXT_REQUEST_YEAR" runat="server" Width="36px"
											MaxLength="4" Columns="4" Enabled="False"></asp:textbox></TD>
								</TR>
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TXT_GROUP" runat="server">Group :</asp:label></TD>
									<TD class="TDBGColorValue"><asp:dropdownlist id="DDL_GROUP" runat="server" Width="100%" Enabled="False"></asp:dropdownlist></TD>
								</TR>
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TXT_UNIT" runat="server">Unit :</asp:label></TD>
									<TD class="TDBGColorValue"><asp:dropdownlist id="DDL_UNIT" runat="server" Width="100%" Enabled="False"></asp:dropdownlist></TD>
								</TR>
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TXT_PIC_REQUEST" runat="server">PIC Requester :</asp:label></TD>
									<TD class="TDBGColorValue"><asp:textbox id="TXT_PIC_REQUEST" runat="server" Width="100%" Enabled="False"></asp:textbox></TD>
								</TR>
							</TABLE>
						</TD>
						<TD class="td" style="HEIGHT: 7px" vAlign="top" width="50%">
							<TABLE id="Table3" cellSpacing="0" cellPadding="0" width="100%">
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TXT_TGL_TARGET" runat="server">Target Selesai :</asp:label></TD>
									<TD class="TDBGColorValue" colSpan="2"><asp:textbox onkeypress="return numbersonly()" id="TXT_TGL_TARGET_DAY" runat="server" Width="24px"
											MaxLength="2" Columns="4" Enabled="False"></asp:textbox><asp:dropdownlist id="DDL_TGL_TARGET_MONTH" runat="server" Enabled="False"></asp:dropdownlist><asp:textbox onkeypress="return numbersonly()" id="TXT_TGL_TARGET_YEAR" runat="server" Width="36px"
											MaxLength="4" Columns="4" Enabled="False"></asp:textbox></TD>
								</TR>
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TXT_DOC_KELENGKAPAN" runat="server">Kelengkapan Dokumen :</asp:label></TD>
									<TD class="TDBGColorValue" colSpan="2"><asp:radiobuttonlist id="RDO_DOC_KELENGKAPAN" runat="server" Width="150px" RepeatDirection="Horizontal"
											Enabled="False">
											<asp:ListItem Value="1">Ya</asp:ListItem>
											<asp:ListItem Value="0">Tidak</asp:ListItem>
										</asp:radiobuttonlist></TD>
								</TR>
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TXT_STS_RAHASIA" runat="server">Status Kerahasiaan :</asp:label></TD>
									<TD class="TDBGColorValue" colSpan="2"><asp:dropdownlist id="DDL_STS_RAHASIA" runat="server" Width="100%" Enabled="False"></asp:dropdownlist></TD>
								</TR>
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TXT_REQUEST_DESC" runat="server">Request Description :</asp:label></TD>
									<TD class="TDBGColorValue" colSpan="2"><asp:textbox id="TXT_REQUEST_DESC" runat="server" Width="100%" TextMode="MultiLine" Height="40px"
											Enabled="False"></asp:textbox></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD class="TDBGColor2" vAlign="top" align="center" colSpan="3" height="10"></TD>
					</TR>
					<TR>
						<TD class="tdHeader1" colSpan="2">DOCUMENT</TD>
					</TR>
					<TR>
						<TD class="td" style="HEIGHT: 7px" vAlign="top" width="50%">
							<TABLE id="Table4" cellSpacing="0" cellPadding="0" width="100%">
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TXT_DOC_NM" runat="server">Nama Dokumen :</asp:label></TD>
									<TD class="TDBGColorValue" width="40%"><asp:textbox id="TXT_DOC_NM" runat="server" Width="100%" Enabled="False"></asp:textbox></TD>
									<TD align="right" width="10%"><asp:button id="BTN_INSERT_DOC" runat="server" Width="100%" Text="Insert" Font-Bold="True" Enabled="False"></asp:button></TD>
								</TR>
								<TR>
									<TD></TD>
								</TR>
								<TR>
									<TD class="td" vAlign="top" align="center" width="50%" colSpan="3"><asp:datagrid id="DATA_GRID" runat="server" Width="100%" CellPadding="1" PageSize="5" AutoGenerateColumns="False"
											AllowPaging="True">
											<AlternatingItemStyle CssClass="TblAlternating"></AlternatingItemStyle>
											<Columns>
												<asp:BoundColumn DataField="SEQ" HeaderText="No.">
													<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="DOC_NM" HeaderText="Nama Dokumen">
													<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="Function">
													<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid></TD>
								</TR>
							</TABLE>
						</TD>
						<TD class="td" style="HEIGHT: 7px" vAlign="top" width="50%">
							<TABLE id="Table5" cellSpacing="0" cellPadding="0" width="100%">
								<TR>
									<TD><ASP:DATAGRID id="DATA_EXPORT" runat="server" Width="100%" CellPadding="1" PageSize="5" AutoGenerateColumns="False"
											AllowPaging="True">
											<AlternatingItemStyle CssClass="TblAlternating"></AlternatingItemStyle>
											<Columns>
												<asp:BoundColumn DataField="ID_UPLOAD_EXP" HeaderText="No">
													<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
													<ItemStyle Width="10px" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="FILE_UPLOAD_EXP_NAME" HeaderText="FILE DESTINATION">
													<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="45px" CssClass="tdSmallHeader"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" Width="60px"></ItemStyle>
													<ItemTemplate>
														<asp:HyperLink id="SCORING_DOWNLOAD" runat="server" Target="_blank">Download</asp:HyperLink>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</ASP:DATAGRID></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD class="tdHeader1" colSpan="2">ASSIGNMENT</TD>
					</TR>
					<TR>
						<TD class="td" style="HEIGHT: 7px" vAlign="top" width="50%">
							<TABLE id="Table6" cellSpacing="0" cellPadding="0" width="100%">
								<TR>
									<TD class="TDBGColor1" width="50%"><asp:label id="LBL_TXT_LEGAL_OFFICER" runat="server">Select Legal Officer :</asp:label></TD>
									<TD class="TDBGColorValue" width="50%"><asp:dropdownlist id="DDL_LEGAL_OFFICER" runat="server" Width="100%" Enabled="False"></asp:dropdownlist></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</CENTER>
		</FORM>
	</BODY>
</HTML>
