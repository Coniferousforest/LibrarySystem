using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
using System.Data;

public partial class MyInfo : System.Web.UI.Page
{
    User user = new User();

   
    protected void Page_Load(object sender, EventArgs e)
    {
        GetUser();
        BookRecordBLL bookRecordBLL = new BookRecordBLL();
        DataSet ds = bookRecordBLL.GetAllBookRecordByDs(user.Username);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        
    }
    public void GetUser()
    {
       if(Session["user"]!=null)
        {
            user = Session["user"] as User;
        }
       else
        {
            Response.Redirect("login.aspx");
        }
    }
    public string GetUserInfo(string Get)
    {
        switch (Get)
        {
            case "Username":return user.Username;
            case "Name":return user.Name;
            case "Sex":return user.Sex;
            case "Phone":return user.Phone;
            case "pwd": return user.Userpwd;

        }
        return "-";
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePwd.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        User userB = new User();
        UserBLL userBLL = new UserBLL();
        User user = new User();
        if (Session["user"] != null)
        {
            userB = Session["user"] as User;
            user = userBLL.login(userB.Username, TextBox1.Text);
        }



        if (user != null)
        {
            if (TextBox2.Text != TextBox3.Text)
            {
                Label1.Text = "两次密码不一致";
                return;
            }
            user.Userpwd = TextBox2.Text;
            userBLL.userUpdate(user);
            Label1.Text = "修改成功";
        }
        else
        {
            Label1.Text = "原密码错误";
        }
    }

}