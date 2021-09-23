using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;

public partial class Administrator_user_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        User user = BindUser();
        UserBLL userBLL = new UserBLL();
        if(userBLL.getUser(TextBox1.Text).Username != null)
        {
            Label1.Text = "用户名重复！";
            return;
        }
        if( userBLL.UserAdd(user))
        {
            Response.Write("<script>alert('添加成功')</script>");
            Response.Write("<script>window.location.href='userdetail.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('添加失败')</script>");
        }
    }
    public User BindUser()
    {
        User user = new User
        {
            Username = TextBox1.Text,
            Name = TextBox2.Text,
            Sex = DropDownList2.SelectedValue,
            Phone = TextBox4.Text,
            Userpwd = TextBox5.Text,
            Leve = Convert.ToInt16( DropDownList1.SelectedValue)
         };
        return user;
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        User user = BindUser();
        UserBLL userBLL = new UserBLL();
        if (userBLL.getUser(TextBox1.Text).Username != null)
        {
            Label1.Text = "用户名重复！";
        }
        else
        {
            Label1.Text = "";
        }
    }
}