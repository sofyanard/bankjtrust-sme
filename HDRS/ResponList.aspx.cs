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
using DMS.DBConnection;
using DMS.CuBESCore;
using DMS.BlackList;
using Microsoft.VisualBasic;
using System.IO;
using System.Diagnostics;
namespace SME.HDRS
{
	/// <summary>
	/// Summary description for ResponList.
	/// </summary>
	public partial class ResponList : System.Web.UI.Page
	{
		protected Connection conn;
		protected Tools tool = new Tools();
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			conn = (Connection) Session["Connection"];			

			if (!Logic.AllowAccess(Session["GroupID"].ToString(), Request.QueryString["mc"], conn))
				Response.Redirect("/SME/Restricted.aspx");
			conn.QueryString = "select * from VW_HELPDESK_LIST where active='0' and H_SEND_BY='" + Session["UserID"].ToString() + "' and HTH_TRACKCODE='B3' ";
			conn.ExecuteQuery();
			FillGrid();
		}

		private void FillGrid()
		{
			DataTable dt = new DataTable();
			dt = conn.GetDataTable().Copy();
			DGR_RESPON.DataSource = dt;
			try 
			{
				DGR_RESPON.DataBind();
			} 
			catch 
			{
				DGR_RESPON.CurrentPageIndex = 0;
				DGR_RESPON.DataBind();
			}
			for (int i = 0; i < DGR_RESPON.Items.Count; i++)
			{
				DGR_RESPON.Items[i].Cells[1].Text = tool.FormatDate(DGR_RESPON.Items[i].Cells[1].Text, true);
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
			this.DGR_RESPON.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DGR_RESPON_ItemCommand);
			this.DGR_RESPON.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DGR_RESPON_PageIndexChanged);

		}
		#endregion

		private void DGR_RESPON_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DGR_RESPON.CurrentPageIndex = e.NewPageIndex;
		}

		private void DGR_RESPON_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			switch (((LinkButton)e.CommandSource).CommandName)
			{
				case "Continue":					
					Response.Redirect("EndUserResult.aspx?sta=exist&regnum=" + e.Item.Cells[0].Text + "&tc=" + Request.QueryString["tc"] + "&mc=" + Request.QueryString["mc"]);
									
					break;
			}
		}

		

		
	}
}
