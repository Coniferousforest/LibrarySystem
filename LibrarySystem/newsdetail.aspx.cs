using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
public partial class newsdetail : System.Web.UI.Page
{
    News news = new News();
   

    protected void Page_Load(object sender, EventArgs e)
    {
        string newsId = Request.QueryString["Id"];

        if (newsId != "")
        {
            GetNewsInfo(newsId);
        }
    }
    protected string BindNews(string type)
    {
        switch (type)
        {
            case "ID": { return news.ID; }
            case "Title": { return news.Title; }
            case "Writer": { return news.Writer; }
            case "Article": { return news.Article; }
            case "Time": { return news.Time; }
            case "Loves": { return news.Loves; }
            default: return "-";
        }

    }
    protected void GetNewsInfo(string Id)
    {
        NewsBLL newsBLL = new NewsBLL();
        news = newsBLL.GetNewsByID(Id);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string newsId = Request.QueryString["Id"];
        NewsBLL newsBLL = new NewsBLL();
         newsBLL.NewsLoves(newsId);
        Response.Write("<script>window.location.href='newsdetail.aspx';</script>");
    }
}