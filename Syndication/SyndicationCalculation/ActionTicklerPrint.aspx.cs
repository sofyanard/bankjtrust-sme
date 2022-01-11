using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using DMS.CuBESCore;
using DMS.DBConnection;
using Microsoft.VisualBasic;

namespace SME.Syndication.SyndicationCalculation
{
	/// <summary>
	/// Summary description for ActionTicklerPrint.
	/// </summary>
	public partial class ActionTicklerPrint : System.Web.UI.Page
	{
		protected Tools tools = new Tools();
		protected Connection conn = new Connection(ConfigurationSettings.AppSettings["conn"]);
		protected Connection conn2 = new Connection(ConfigurationSettings.AppSettings["conn"]);
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			ViewData();
		}

		private void ViewData()
		{
			conn.QueryString	= "SELECT TOP 1 * FROM VW_SDC_DOC_GENERAL_INFO WHERE CU_REF = '" + Request.QueryString["curef"] + "'";
			conn.ExecuteQuery();
			
			LBL_TITLE_CUST.Text		= conn.GetFieldValue("CUST_NAME").ToString();

			conn2.QueryString	= "SELECT DISTINCT * FROM VW_SDC_ACTION_TICKLER WHERE CU_REF = '" + Request.QueryString["curef"] + "'";
			conn2.ExecuteQuery();

			//for(int i = 0; i < conn2.GetRowCount(); i++)
			//{
				CreateContent(conn2.GetFieldValue("CU_REF"));
			//}
		}

		private void CreateContent(string CU_REF)
		{
			System.Web.UI.WebControls.DataGrid DATA_GRID;
			System.Web.UI.HtmlControls.HtmlTableRow TR;
			System.Web.UI.HtmlControls.HtmlTableCell TD;

			/***************************** Membuat Data Grid *******************************/

			TR = new HtmlTableRow();
			TD = new HtmlTableCell();
			TD.Attributes["colspan"] = "2";

			DATA_GRID = new DataGrid();
			DATA_GRID.ID = "GRID_" + CU_REF;
			DATA_GRID.AllowPaging = false;
			DATA_GRID.CellPadding = 1;
			DATA_GRID.AutoGenerateColumns = false;
			DATA_GRID.Width = Unit.Percentage(100.0);
			DATA_GRID.AlternatingItemStyle.CssClass = "TblAlternating";

			/**************** Membuat Field pada Data Grid *****************/
			conn.QueryString = "SELECT * FROM VW_SDC_ACTION_TICKLER_FIELD_DATA_GRID ORDER BY CONVERT(INT,FIELDID) ASC";
			conn.ExecuteQuery();
	
			BoundColumn columns = new BoundColumn();

			for(int i = 0; i < conn.GetRowCount()-3; i++)
			{
				columns = new BoundColumn();
				columns.HeaderText = conn.GetFieldValue(i,1).ToString();
				columns.DataField = conn.GetFieldValue(i,2).ToString();
				columns.HeaderStyle.CssClass = "tdSmallHeader";
				columns.Visible = true;
				columns.ItemStyle.HorizontalAlign = HorizontalAlign.Left;
				DATA_GRID.Columns.Add(columns);
			}

			for(int i = 3; i < conn.GetRowCount(); i++)
			{
				columns = new BoundColumn();
				columns.HeaderText = conn.GetFieldValue(i,1).ToString();
				columns.DataField = conn.GetFieldValue(i,2).ToString();
				columns.HeaderStyle.CssClass = "tdSmallHeader";
				columns.Visible = true;
				columns.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
				DATA_GRID.Columns.Add(columns);
			}

			/*********************** BIND DATA ****************************/
			conn.QueryString = "SELECT DISTINCT * FROM VW_SDC_ACTION_TICKLER WHERE CU_REF = '" + CU_REF + "'";
			BindData(DATA_GRID, conn.QueryString);

			TD.Controls.Add(DATA_GRID);
			TR.Controls.Add(TD);

			TBL_ACTION.Controls.Add(TR);
		}

		private void BindData(DataGrid theGrid, string strconn)
		{
			if(strconn != "")
			{
				conn.QueryString = strconn;
				conn.ExecuteQuery();
			}

			System.Data.DataTable dt = new System.Data.DataTable();
			dt = conn.GetDataTable().Copy();

			System.Web.UI.WebControls.DataGrid dg = theGrid;

			dg.DataSource = dt;				

			try
			{
				dg.DataBind();
			}
			catch 
			{
				dg.CurrentPageIndex = dg.PageCount - 1;
				dg.DataBind();
			}

			for (int i = 0; i < dg.Items.Count; i++)
			{
				dg.Items[i].Cells[3].Text = tools.FormatDate(dg.Items[i].Cells[3].Text, true);
			}

			conn.ClearData();
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion
	}
}
