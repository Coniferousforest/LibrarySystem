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
    static News news = new News();
    static string newsId;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            newsId = Request.QueryString["Id"];
            if (newsId != "")
            {

                GetNewsInfo(newsId);


                BindNews();
            }
        }


    }
    protected void BindNews()
    {
        TextBox1.Text = news.Title;
        TextBox2.Text = news.Writer;
        TextBox6.Text = news.Article;

    }

    protected void GetNewsInfo(string Id)
    {
        NewsBLL newsBLL = new NewsBLL();
        news = newsBLL.GetNewsByID(Id);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        NewsAdd();
    }

    public News NewsBind()
    {
        //news.ID = newsId;
        news.Title = TextBox1.Text;
        news.Writer = TextBox2.Text;
        news.Article = TextBox5.Text;
        return news;
    }
    public void NewsAdd()
    {
        News news = NewsBind();
        NewsBLL newsBLL = new NewsBLL();
        if (newsBLL.NewsUpdate(news))
        {
            Response.Write("<script>alert('添加成功')</script>");
            Response.Write("<script>window.location.href='newsdetail.aspx?Id=" + newsId + "'; </script>");
        }
        else
        {
            Response.Write("<script>alert('添加失败')</script>");
        }
    }


}