using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_user_userdetail : System.Web.UI.Page
{
    User user = new User();
    string username;
    protected void Page_Load(object sender, EventArgs e)
    {
        username = Request.QueryString["Id"];
        if(!IsPostBack)
        {
            if (username != "")
            {
                GetUserInfo(username);
                BindUser2();
            }
        }
       
    }
    protected void BindUser2()
    {
       
        TextBox2.Text = user.Name;
        DropDownList2.SelectedValue = user.Sex;
        TextBox4.Text = user.Phone;
        TextBox5.Text = user.Userpwd;
        DropDownList1.SelectedValue = user.Leve.ToString();

    }
    protected void GetUserInfo(string Id)
    {
        UserBLL userBLL = new UserBLL();
        user = userBLL.getUser(Id);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        User user = BindUser();
        UserBLL userBLL = new UserBLL();
        if (userBLL.userUpdate(user))
        {
            Response.Write("<script>alert('修改成功')</script>");
        }
        else
        {
            Response.Write("<script>alert('修改失败')</script>");
        }
    }
    public User BindUser()
    {
        User user = new User
        {
            Username = username,
            Name = TextBox2.Text,
            Sex = DropDownList2.SelectedValue,
            Phone = TextBox4.Text,
            Userpwd = TextBox5.Text,
            Leve = Convert.ToInt16(DropDownList1.SelectedValue)
        };
        return user;
    }
}