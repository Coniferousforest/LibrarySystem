using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

public partial class ChangePwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        User userB = new User();
        UserBLL userBLL = new UserBLL();
        User user = new User();
        if (Session["user"]!= null)
        {
            userB = Session["user"] as User;
            user = userBLL.login(userB.Username, TextBox1.Text);
        }
       
        

        if (user != null)
        {
            if(TextBox2.Text!=TextBox3.Text)
            {
                Label1.Text = "两次密码不一致";
                return;
            }
            user.Userpwd = TextBox2.Text;
            userBLL.userUpdate(user);
            Label1.Text = "修改成功";
            Response.Write("<script>window.location.href='myinfo.aspx';</script>");
        }
        else
        {
            Label1.Text = "原密码错误";
        }
    }
}