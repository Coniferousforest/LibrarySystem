using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_News_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        NewsAdd();
    }
    public void NewsAdd()
    {
        News news = NewsBind();
        NewsBLL newsBLL = new NewsBLL();
        if (newsBLL.NewsAdd(news))
        {
            Response.Write("<script>alert('添加成功')</script>");
          
        }
        else
        {
            Response.Write("<script>alert('添加失败')</script>");
        }
    }
    public News NewsBind()
    {
        News news = new News
        {
            Title = TextBox1.Text,
            Writer = TextBox2.Text,
            Article = TextBox5.Text
        };


        return news;
    }
}