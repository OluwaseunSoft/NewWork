using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;

public partial class code_batch_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Batch_Update(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload4.HasFile)
            {
                //Upload and save the file
                string excelPath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload4.PostedFile.FileName);
                FileUpload4.SaveAs(excelPath);

                string conString = string.Empty;
                string extension = Path.GetExtension(FileUpload4.PostedFile.FileName);
                switch (extension)
                {
                    case ".xls": //Excel 97-03
                        conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                        break;
                    case ".xlsx": //Excel 07 or higher
                        conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                        break;

                }

                conString = string.Format(conString, excelPath);
                using (OleDbConnection excel_con = new OleDbConnection(conString))
                {
                    excel_con.Open();
                    string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                    DataTable dtExcelData = new DataTable();

                    //[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
                    dtExcelData.Columns.AddRange(new DataColumn[8] { new DataColumn("CUSTOMER NAME", typeof(string)),
                new DataColumn("FirstCentralReferenceNo", typeof(int)),
                new DataColumn("AccountNo", typeof(string)),
                new DataColumn("CurrentBalanceAmt", typeof(int)),
                new DataColumn("AmountOverdue", typeof(int)),
                new DataColumn("MonthsInArrears", typeof(int)),
                new DataColumn("LoanClassification", typeof(string)),
                new DataColumn("AccountStatusCode", typeof(string)), });

                    using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
                    {
                        oda.Fill(dtExcelData);
                    }
                    excel_con.Close();

                    foreach (DataColumn dc in ds.Tables[0].Columns)
                    {
                        ListBox1.Items.Add(dc.ColumnName);
                    }

                    string consString = ConfigurationManager.ConnectionStrings["iremedybatchupdate"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(consString))
                    {
                        using (SqlCommand cmd = new SqlCommand("Batch_Update_SP"))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@tblBatchUpdate", dtExcelData);
                            con.Open();
                            Label4.Text = "Data retrieved successfully! ";
                            Label4.ForeColor = System.Drawing.Color.Green;
                            Label4.Visible = true;
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }
            else
            {
                Label4.Text = "Please select an excel file first";
                Label4.ForeColor = System.Drawing.Color.Red;
                Label4.Visible = true;
            }
        }
        catch(Exception ex)
        {
            Console.WriteLine("{0}", ex);
        }
    }



}
