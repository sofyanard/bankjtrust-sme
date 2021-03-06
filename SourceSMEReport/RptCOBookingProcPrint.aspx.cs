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
using DMS.DBConnection;
using DMS.CuBESCore;

namespace SME.SourceSMEReport
{
	/// <summary>
	/// Summary description for RptCOBookingProcPrint.
	/// </summary>
	public partial class RptCOBookingProcPrint : System.Web.UI.Page
	{
		protected Connection conn = new Connection();
	    protected Tools tools = new Tools();

		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			conn = (Connection) Session["Connection"];
			
			//if (!Logic.AllowAccess(Session["GroupID"].ToString(), Request.QueryString["mc"], conn))
				//Response.Redirect("/SME/Restricted.aspx");

			string tanggal1 = Request.QueryString["tanggal1"];
			string tanggal2 = Request.QueryString["tanggal2"];
			string region = Request.QueryString["region"];
			string cbc = Request.QueryString["cbc"];
			string branch = Request.QueryString["branch"];
			string teamleader = Request.QueryString["teamleader"];
			string rm = Request.QueryString["rm"];

			if(!IsPostBack)
			{
				loadData(tanggal1, tanggal2,region, cbc, branch, teamleader, rm);
			}
		}

		private void loadData(string tanggal1, string tanggal2,string region, string cbc, string branch, string teamleader, string rm)
		{
			string regionname="", cbcname="", branchname="", haridisp=""; 
			LBL_PERIODE.Text = tools.FormatDate(tanggal1, false).ToUpper() + " To " + tools.FormatDate(tanggal2,false).ToUpper();
			if(!region.Equals(""))
			{
				conn.QueryString = "select areaid, areaname  from rfarea where areaid='" + region + "'";
				conn.ExecuteQuery();
				if (conn.GetRowCount()>0)
				{
					regionname = conn.GetFieldValue(0,"areaname");
				}
			}
			else
			{
				regionname = "ALL";
			}
            
			if (!regionname.Equals(""))
			{
				this.LBL_REGION.Text = regionname.ToUpper();;
			}
			else
			{
				this.LBL_REGION.Text = "ALL";
			}


			if(!cbc.Equals(""))
			{
				conn.QueryString = "select distinct  branch_name  from rfbranch where branch_code ='" + cbc + "'";
				conn.ExecuteQuery();
				if (conn.GetRowCount()>0)
				{
					cbcname = conn.GetFieldValue(0,"branch_name");
				}
			}
			else
			{
				cbcname = "ALL";
			}
			if(!cbc.Equals(""))
			{
				this.LBL_CBC.Text = cbcname;
			}
			else
			{
				this.LBL_CBC.Text = "ALL";
			}
			
			if(!branch.Equals(""))
			{
				conn.QueryString = "select distinct  branch_name  from rfbranch where branch_code ='" + branch + "'";
				conn.ExecuteQuery();
				if (conn.GetRowCount()>0)
				{
					branchname = conn.GetFieldValue(0,"branch_name");
					this.LBL_BRANCH.Text = branchname.ToUpper();
				}
			}
			else
			{
				branchname = "ALL";
				this.LBL_BRANCH.Text = branchname.ToUpper();
			}

			if(!teamleader.Equals(""))
			{
				conn.QueryString= "Select su_fullname from scuser where userid='" + teamleader + "' ";
				conn.ExecuteQuery();
				if (conn.GetRowCount()>0)
				{
                    lbl_team.Text = conn.GetFieldValue(0,0).ToString();
				}
				else
				{
					lbl_team.Text = "ALL";
				}
			}
			else
			{
				lbl_team.Text = "ALL";
			}
			
			conn.QueryString = "SELECT * FROM TMP_REPORT_COBOOKINGPROC WHERE userid = '" + Session["UserID"].ToString() + "' order by HARI asc";
			conn.ExecuteQuery();
			for (int i = 0; i < conn.GetRowCount(); i++)
			{
				switch(conn.GetFieldValue(i, "hari"))
				{
					case "1" : 
						haridisp = "=1";
						break;
					case "2" :
						haridisp = "=2";
						break;
					case "3" :
						haridisp = "=3";
						break;
					case "5" :
						haridisp = "<=5";
						break;
					case "10" :
						haridisp = "<=10";
						break;
					case "20" :
						haridisp = "<=20";
						break;
					case "40" :
						haridisp = "<=40";
						break;
					case "60" :
						haridisp = "<=60";
						break;
					default :
						haridisp = ">61";
						break;
				}
				TBL_CONTENT.Rows.Add(new TableRow());
				TBL_CONTENT.Rows[i + 1].Cells.Add(new TableCell());
				TBL_CONTENT.Rows[i + 1].Cells[0].Text = "&nbsp;" + haridisp; 
				TBL_CONTENT.Rows[i + 1].Cells[0].HorizontalAlign = HorizontalAlign.Center;
				TBL_CONTENT.Rows[i + 1].Cells[0].CssClass= "ItemPrint";
				
				TBL_CONTENT.Rows[i + 1].Cells.Add(new TableCell());
				TBL_CONTENT.Rows[i + 1].Cells[1].Text = "&nbsp;" + conn.GetFieldValue(i, "#application").Trim();
				TBL_CONTENT.Rows[i + 1].Cells[1].CssClass= "ItemPrint";
				
				TBL_CONTENT.Rows[i + 1].Cells.Add(new TableCell());
				TBL_CONTENT.Rows[i + 1].Cells[2].Text = "&nbsp;" + tools.ConvertCurr(conn.GetFieldValue(i, "total amount"));
				TBL_CONTENT.Rows[i + 1].Cells[2].CssClass= "ItemPrint";
			}
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
