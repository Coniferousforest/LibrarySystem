using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
       
        //从session中取出验证码
        string chekcode = Session["CheckCode"] as string;
        string input = TextBox3.Text;
        UserBLL userBLL = new UserBLL();
        User user = new User();
        string username = TextBox1.Text;
        string pwd = TextBox2.Text;

        if (chekcode.Equals(input, StringComparison.OrdinalIgnoreCase) && TextBox3.Text != null)
        {
            user = userBLL.login(username, pwd);

            if(user!=null)
            { 
           
                Session["user"] = user;
                if(user.Leve==1)
                {
                    Response.Write("<script language=javascript>location.replace('./Administrator/index/index.aspx');</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>location.replace('index.aspx');</script>");
                }
               
            }
            else
            {
                Response.Write("<script language=javascript>alert('用户名或密码错误！');</script>");
            }

        }
        else if (TextBox3.Text == "")
        {
            Response.Write("<script>alert('请输入验证码！')</script>");
        }
        else
        {
            Response.Write("<script>alert('验证码输入错误！')</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Write("<script language=javascript>location.replace('register.aspx');</script>");
       
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Write("<script language=javascript>location.replace('index.aspx');</script>");
    }
}