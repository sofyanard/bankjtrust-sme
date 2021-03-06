<%@ Page language="c#" Codebehind="AssignBulkCust.aspx.cs" AutoEventWireup="True" Inherits="SME.Facilities.AssignBulkCust" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AssignBulkCust</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../style.css" type="text/css" rel="stylesheet">
		<script language="javascript">
			function assign()
			{
				conf = confirm("Are you sure you want to assign selected customer???");
				if (conf)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			
			function assignall()
			{
				conf = confirm("Are you sure you want to assign all customer???");
				if (conf)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		</script>
	</HEAD>
	<body leftMargin="0" topMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<center>
				<TABLE cellSpacing="2" cellPadding="2" width="100%">
					<TR>
						<TD class="tdHeader1" colSpan="2">Current Customer</TD>
					</TR>
					<TR>
						<TD colSpan="2"><ASP:DATAGRID id="DatGrd" runat="server" CellPadding="1" Width="100%" AllowPaging="True" AutoGenerateColumns="False"
								PageSize="25" ShowFooter="True" AllowSorting="True">
								<AlternatingItemStyle CssClass="TblAlternating"></AlternatingItemStyle>
								<Columns>
									<asp:BoundColumn DataField="CU_REF" HeaderText="Cust Ref No.">
										<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="CU_CIF" HeaderText="CIF No." SortExpression="CU_CIF">
										<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="CU_NAME" HeaderText="Customer Name" SortExpression="CU_NAME">
										<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="CU_ADDR" HeaderText="Address">
										<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="CU_IDNO" HeaderText="ID No.">
										<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
									</asp:BoundColumn>
									<asp:TemplateColumn HeaderText="Select">
										<HeaderStyle CssClass="tdSmallHeader"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
										<ItemTemplate>
											<asp:checkbox id="CHK_ASSIGN" runat="server"></asp:checkbox>
										</ItemTemplate>
										<FooterStyle HorizontalAlign="Center"></FooterStyle>
										<FooterTemplate>
											<asp:LinkButton id="lnk_selectall" runat="server" CommandName="selectall">Select All</asp:LinkButton>
										</FooterTemplate>
									</asp:TemplateColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</ASP:DATAGRID>
							<br>
							<asp:label id="LBL_SORT" runat="server" Visible="False">ORDER BY CU_CIF ASC</asp:label>
						</TD>
					</TR>
					<tr>
						<td width="50%">
							<table width="100%">
								<tr>
									<td class="tdHeader1" colSpan="3">Assign to:</td>
								</tr>
								<tr>
									<td class="TDBGColor1">Branch</td>
									<td width="15"></td>
									<td class="TDBGColorValue"><asp:dropdownlist id="DDL_BRANCHTO" runat="server" AutoPostBack="True" onselectedindexchanged="DDL_BRANCHTO_SelectedIndexChanged"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td class="TDBGColor1">User</td>
									<td width="15"></td>
									<td class="TDBGColorValue"><asp:dropdownlist id="DDL_USERTO" runat="server"></asp:dropdownlist></td>
								</tr>
							</table>
						</td>
						<td width="50%">
							<table width="100%">
								<tr>
									<td class="TDBGColor2" align="center"><asp:button id="BTN_ASSIGN" CssClass="button1" Width="200px" Text="Assign Selection" Runat="server" onclick="BTN_ASSIGN_Click"></asp:button></td>
								</tr>
								<tr>
									<td class="TDBGColor2" align="center"><asp:button id="BTN_ASSIGNALL" CssClass="button1" Width="200px" Text="Assign All" Runat="server" onclick="BTN_ASSIGNALL_Click"></asp:button></td>
								</tr>
							</table>
						</td>
					</tr>
				</TABLE>
			</center>
		</form>
	</body>
</HTML>
