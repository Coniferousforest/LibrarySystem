using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

public partial class Administrator_News_news : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        PhotoAdd();
    }
    public void PhotoAdd()
    {
        Photo photo = PhotoBind();

        PhotoBLL photoBLL = new PhotoBLL();
        if (photoBLL.PhotoAdd(photo))
        {
            Response.Write("<script>alert('添加成功')</script>");
        }
        else
        {
            Response.Write("<script>alert('添加失败,最多只能上传三张图片')</script>");
        }
    }
     /// <summary> 
    /// 获取时间戳 
    /// </summary> 
    /// <returns></returns> 
    public static string GetTimeStamp()
    {
        TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
        return Convert.ToInt64(ts.TotalSeconds).ToString();
    }
    public string PictureUpload()
    {
        
        if (FileUpload1.HasFile)
        {
            string fileback = FileUpload1.PostedFile.FileName;
            string filePath = Server.MapPath("../../img/");
            string fileName = GetTimeStamp()+ fileback.Substring(fileback.LastIndexOf("."), 4);
            FileUpload1.SaveAs(filePath + fileName);
            return "img/"+fileName;
        }
        else
        {
            Response.Write("<p >请选择要上传的文件!</p>");
            return "";
        }
    }
    public Photo PhotoBind()
    {
        Photo photo = new Photo
        {
            Name = TextBox1.Text,
            Path = PictureUpload(),

        };
        return photo;
    }
}