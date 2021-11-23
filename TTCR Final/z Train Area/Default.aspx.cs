using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class _Default : System.Web.UI.Page
{

    string connectionString = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
    }

    //protected void btnSubmit_Click1(object sender, EventArgs e)
    //{

    //    string connectionString = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
    //    try
    //    {
    //        Byte[] bytes = null;
    //        if (FileUpload1.HasFile)
    //        {
    //            string filename = FileUpload1.PostedFile.FileName;
    //            string filePath = Path.GetFileName(filename);

    //            Stream fs = FileUpload1.PostedFile.InputStream;
    //            BinaryReader br = new BinaryReader(fs);
    //            bytes = br.ReadBytes((Int32)fs.Length);
    //        }
    //        using (SqlConnection connection = new SqlConnection(connectionString))
    //        {

    //            SqlCommand command = new SqlCommand(
    //             "INSERT INTO tblImage (ImageName, Image) " +
    //             "Values(@ImageName, @Image)", connection);

    //            command.Parameters.Add("@ImageName", 
    //            SqlDbType.NVarChar, 20).Value = txtImageName.Text;
    //            command.Parameters.Add("@Image",
    //            SqlDbType.Binary).Value = bytes;

    //            connection.Open();
    //            command.ExecuteNonQuery();
    //            connection.Close();
    //        }
    //    }
    //    catch (Exception)
    //    {
    //        txtImageName.Text = "Not Uploaded!";
    //    }
    //}

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Byte[] bytes = null;
            if (FileUpload1.HasFile)
            {
                string filename = FileUpload1.PostedFile.FileName;
                string filePath = Path.GetFileName(filename);
                Stream fs = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(
                 "INSERT INTO tblImage (ImageName, Image, ReferenceID) " +
                 "Values(@ImageName, @Image, @ReferenceID)", connection);
                command.Parameters.Add("@ImageName",
                SqlDbType.NVarChar, 20).Value = txtImageName.Text;
                command.Parameters.Add("@Image",
                SqlDbType.Binary).Value = bytes;
                command.Parameters.Add("@ReferenceID",
                SqlDbType.NVarChar, 20).Value = txtImageName.Text;
                //command.Parameters.Add("@FileType",
                //SqlDbType.NVarChar, 20).Value = "Photo";
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
        catch (Exception)
        {    
            //error        

        }

        }

    protected void Upload(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        string contentType = FileUpload1.PostedFile.ContentType;
        using (Stream fs = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string constr = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "insert into tblFiles values (@Name, @ContentType, @Data)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@Name", filename);
                        cmd.Parameters.AddWithValue("@ContentType", contentType);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Id, Name from tblFiles";
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }
    }

    protected void DownloadFile(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        byte[] bytes;
        string fileName, contentType;
        string constr = ConfigurationManager.ConnectionStrings["TTCRConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Name, Data, ContentType from tblFiles where Id=@Id";
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["Data"];
                    contentType = sdr["ContentType"].ToString();
                    fileName = sdr["Name"].ToString();
                }
                con.Close();
            }
        }
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }
}