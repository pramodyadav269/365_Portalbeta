using _365_Portal.Code.BL;
using _365_Portal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _365_Portal.t
{
    public partial class DownloadExcel1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["val"] != null && Request.QueryString["val"].ToString().Trim() != "")
                {
                    //string val = Request.QueryString["val"].ToString().Trim();
                    //string DecryptQueryString = CommonHelper.Decrypt(val);

                    string DecryptQueryString = Request.QueryString["val"].ToString().Trim();
                    string[] queryStringData = DecryptQueryString.Split('|');
                    string type = queryStringData[0];
                    string fileName = string.Empty;

                    DataSet ds = new DataSet();
                    switch (type)
                    {
                        case "users": // 
                            UserBO objUserBO = new UserBO();
                            objUserBO.UserID = queryStringData[1];
                            objUserBO.CompId = Convert.ToInt32(queryStringData[2]);
                            objUserBO.Role = queryStringData[3];
                            ds = CommonBL.GetUsers(objUserBO);

                            string[] selectedColumns = new[] { "FirstName", "EmailID", "Gender", "DeptName", "TeamName", "Manager", "StartDate" };

                            DataSet newDS = new DataSet();
                            newDS.Tables.Add(new DataView(ds.Tables[0]).ToTable(false, selectedColumns));

                            fileName = "UserList";
                            ExportToExcel(newDS, fileName);
                            break;
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Oops... Something went wrong.');window.close();", true);
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }

        public void ExportToExcel(DataSet DataSet, string fileName)
        {
            bool endRequest = false;
            DataTable dataTable = DataSet.Tables[0];
            try
            {
                if (dataTable.Rows.Count > 0)
                {
                    string attachment = "attachment; filename=" + fileName + "_" + DateTime.Now.ToString() + ".xls";
                    Response.Clear();
                    Response.AddHeader("content-disposition", attachment);
                    Response.ContentType = "application/vnd.ms-excel";
                    string tab = "";

                    foreach (DataColumn dc in dataTable.Columns)
                    {
                        Response.Write(tab + dc.ColumnName);
                        tab = "\t";
                    }
                    Response.Write("\n");
                    int i;
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        tab = "";
                        for (i = 0; i < dataTable.Columns.Count; i++)
                        {
                            Response.Write(tab + dr[i].ToString());
                            tab = "\t";
                        }
                        Response.Write("\n");
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('No records found');window.close();", true);
                }
                endRequest = true;
            }
            catch (Exception ex)
            {

            }
            if (endRequest == true)
            {
                Response.End();
            }
        }
    }
}