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
using Microsoft.VisualBasic;
using Excel;

namespace SME.CBI
{
	/// <summary>
	/// Summary description for arMiddleCommercial.
	/// </summary>
	public partial class arMiddleCommercialCBI : System.Web.UI.Page
	{

		protected Tools tool = new Tools();
		protected Connection conn;
		string REGNO, CUREF, TC, MC, DE, PAR, KETKREDIT;

	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			conn = (Connection) Session["Connection"];

			REGNO = Request.QueryString["regno"];
			CUREF = Request.QueryString["curef"];
			KETKREDIT = Request.QueryString["ketkredit"];
			MC	= Request.QueryString["MC"];
			TC	= Request.QueryString["TC"];
			DE	= Request.QueryString["DE"];
			PAR	= Request.QueryString["PAR"];

			lbl_PAR.Text = PAR; //ahmad


			if(!IsPostBack)
			{
				GlobalTools.fillRefList(this.ddl_AM_KETKREDIT,"select * from KETENTUAN_KREDIT where AP_REGNO = '" + REGNO + "';",false,conn);
				ViewData();
			}
			SecureData();
		}


		private void SecureData() 
		{
			// Jika yang memanggil bukan dalam scope DataEntry, maka disable semua control input
			// Flag :
			//		Nama  = de
			//		Value ==  1 --> Parent DataEntry
			//			  !=  1 --> Parent non-DataEntry
			string de = Request.QueryString["de"];
			if (de != "1") 
			{
				System.Web.UI.ControlCollection coll = this.Page.Controls;
				int k = 0;
				for(k = 0; k < coll.Count; k++) 
				{
					if (coll[k] is System.Web.UI.HtmlControls.HtmlForm) 
					{
						break;
					}
				}
				if (k == coll.Count) return;

				for (int i = 0; i < coll[k].Controls.Count; i++) 
				{
					if (coll[k].Controls[i] is System.Web.UI.WebControls.TextBox) 
					{
						System.Web.UI.WebControls.TextBox txt = (System.Web.UI.WebControls.TextBox) coll[k].Controls[i];
						txt.ReadOnly = true;
						//txt.Enabled = false;
					}
					else if (coll[k].Controls[i] is DropDownList) 
					{
						DropDownList ddl = (DropDownList) coll[k].Controls[i];
						ddl.Enabled = false;
					}
					else if (coll[k].Controls[i] is System.Web.UI.WebControls.Button)
					{
						System.Web.UI.WebControls.Button btn = (System.Web.UI.WebControls.Button) coll[k].Controls[i];
						//btn.Enabled = false;
						btn.Visible = false;
					}
					else if (coll[k].Controls[i] is RadioButtonList) 
					{
						RadioButtonList rbl = (RadioButtonList) coll[k].Controls[i];
						rbl.Enabled = false;
					}
					else if (coll[k].Controls[i] is RadioButton) 
					{
						RadioButton rb = (RadioButton) coll[k].Controls[i];
						rb.Enabled = false;
					}
					else if (coll[k].Controls[i] is System.Web.UI.WebControls.CheckBox)
					{
						System.Web.UI.WebControls.CheckBox cb = (System.Web.UI.WebControls.CheckBox) coll[k].Controls[i];
						cb.Enabled = false;
					}					
					else if (coll[k].Controls[i] is DataGrid) 
					{						
						DataGrid dg = (DataGrid) coll[k].Controls[i];						
						dg.Columns[10].Visible = false;
						for (int j = 0; j < dg.Items.Count; j++) 
						{
							//dg.Items[j].Cells[10].Enabled = false;
							dg.Items[j].Cells[10].Visible = false;
						}
					}
					else if (coll[k].Controls[i] is HtmlTableRow) 
					{
						HtmlTableRow htr = (HtmlTableRow) coll[k].Controls[i];
						//htr.Disabled = true;	

						for (int j=0; j < htr.Controls.Count; j++) 
						{							
							for (int jj = 0; jj < htr.Controls[j].Controls.Count; jj++) 
							{
								if (htr.Controls[j].Controls[jj] is System.Web.UI.WebControls.TextBox) 
								{
									System.Web.UI.WebControls.TextBox txt = (System.Web.UI.WebControls.TextBox) htr.Controls[j].Controls[jj];
									txt.ReadOnly = true;
									//txt.Enabled = false;
								}
								else if (htr.Controls[j].Controls[jj] is DropDownList) 
								{
									DropDownList ddl = (DropDownList) htr.Controls[j].Controls[jj];
									ddl.Enabled = false;
								}
								else if (htr.Controls[j].Controls[jj] is System.Web.UI.WebControls.Button)
								{
									System.Web.UI.WebControls.Button btn = (System.Web.UI.WebControls.Button) htr.Controls[j].Controls[jj];
									//btn.Enabled = false;
									btn.Visible = false;
								}
								else if (htr.Controls[j].Controls[jj] is RadioButtonList) 
								{
									RadioButtonList rbl = (RadioButtonList) htr.Controls[j].Controls[jj];
									rbl.Enabled = false;
								}
								else if (htr.Controls[j].Controls[jj] is RadioButton) 
								{
									RadioButton rb = (RadioButton) htr.Controls[j].Controls[jj];
									rb.Enabled = false;
								}
								else if (htr.Controls[j].Controls[jj] is System.Web.UI.WebControls.CheckBox)
								{
									System.Web.UI.WebControls.CheckBox cb = (System.Web.UI.WebControls.CheckBox) htr.Controls[j].Controls[jj];
									cb.Enabled = false;
								}					
							}
						}
					}
				}
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


		private void ViewData()
		{
			conn.QueryString = "select * from VW_ASPEK_MIDDLE where AP_REGNO = '"+ REGNO + "' and AM_KETKREDIT = '" + KETKREDIT + "'"; 
			conn.ExecuteQuery();


			try
			{
				this.ddl_AM_KETKREDIT.SelectedValue = KETKREDIT;
				this.txt_AM_NOTE.Text = conn.GetFieldValue("AM_NOTE");
			}
			catch {}
		}

		protected void btn_Save_Click(object sender, System.EventArgs e)
		{
			conn.QueryString = "EXEC SP_ASPEK_MIDDLE 'Save','" + REGNO + "','" +
				KETKREDIT + "','" +
				this.txt_AM_NOTE.Text + "'";
			conn.ExecuteNonQuery();

			//--------------------------------------------------------------------simpan aspek list
			conn.QueryString = "SP_ASPEK_LIST 'Save','" + REGNO + "','" +
				KETKREDIT + "','D','NOTE'";			
			conn.ExecuteNonQuery();

			//-----------------------------------------------------------------refresh parent
			Response.Write("<script language='javascript'> " +
				"parent.document.Form1.action = 'arParentCBI.aspx?de=" + DE + "&regno=" + REGNO + "&curef=" + CUREF + "&mc=" + MC + "&tc=" + TC + "&par=" + PAR + "';" +
				"parent.document.Form1.submit();</script>");

		}

		protected void btn_Delete_Click(object sender, System.EventArgs e)
		{
			conn.QueryString = "EXEC SP_ASPEK_MIDDLE 'Delete','" + REGNO + "','" +
				KETKREDIT + "',''";
			conn.ExecuteNonQuery();

			//--------------------------------------------------------------------simpan aspek list
			conn.QueryString = "SP_ASPEK_LIST 'Delete','" + REGNO + "','" +
				KETKREDIT + "','D',''";			
			conn.ExecuteNonQuery();

			//-----------------------------------------------------------------refresh parent
			Response.Write("<script language='javascript'> " +
				"parent.document.Form1.action = 'arParentCBI.aspx?de=" + DE + "&regno=" + REGNO + "&curef=" + CUREF + "&mc=" + MC + "&tc=" + TC + "&par=" + PAR + "';" +
				"parent.document.Form1.submit();</script>");

		}

	}
}
