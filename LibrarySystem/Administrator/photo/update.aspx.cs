using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;

public partial class Administrator_News_update : System.Web.UI.Page
{
    static Photo photo = new Photo();
    static string newsId;
    protected void Page_Load(object sender, EventArgs e)
    {

        if(!IsPostBack)
        {
            newsId = Request.QueryString["Id"];
            if (newsId != "")
            {
                GetNewsInfo(newsId);
                BindPhoto();
            }
        }
        
    }
    protected void BindPhoto()
    {
        TextBox1.Text = photo.Name;
        TextBox2.Text = photo.Path;

    }

    protected void GetNewsInfo(string Id)
    {
        PhotoBLL photoBLL = new PhotoBLL();
        photo = photoBLL.GetPhotoById(Id);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        NewsAdd();
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
            string fileName = GetTimeStamp() + fileback.Substring(fileback.LastIndexOf("."), 4);
            FileUpload1.SaveAs(filePath + fileName);
            return "img/" + fileName;
        }
        else
        {
            return TextBox2.Text;
        }
    }
    public Photo PhotoBind()
    {
        Photo photo = new Photo
        {
            Name = TextBox1.Text,
            Path = PictureUpload(),
            ID = newsId

        };
        return photo;
    }
    public void NewsAdd()
    {
        
        PhotoBLL photoBLL = new PhotoBLL();
        if (photoBLL.PhotoUpdate(PhotoBind()))
        {
            Response.Write("<script>alert('添加成功')</script>");
            Response.Write("<script>window.location.href='update.aspx?Id="+newsId+"'; </script>");
        }
        else
        {
            Response.Write("<script>alert('添加失败')</script>");
        }
    }
  

}