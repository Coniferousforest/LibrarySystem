using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        User user = BindUser();
        UserBLL userBLL = new UserBLL();
        if (userBLL.UserAdd(user))
        {
            Response.Write("<script>alert('添加成功')</script>");
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
            Sex = TextBox3.Text,
            Phone = TextBox4.Text,
            Userpwd = TextBox5.Text,
            Leve = Convert.ToInt16(DropDownList1.SelectedValue)
        };
        return user;
    }
}