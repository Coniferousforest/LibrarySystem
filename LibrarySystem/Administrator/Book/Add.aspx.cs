using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

public partial class Administrator_Book_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        BookAdd();
    }
    public void BookAdd()
    {
        Book book = BookBind();
        if (book.PictureUrl == "")
        {
            return;
        }
        BookBLL bookBLL = new BookBLL();
        if( bookBLL.BookAdd(book))
        {
            Response.Write("<script>alert('添加成功')</script>");
        }
        else
        {
            Response.Write("<script>alert('添加失败')</script>");
        }
    }
    public Book BookBind()
    {
        Book book = new Book
        {
            Name = TextBox1.Text,
            Writer = TextBox2.Text,
            Money = TextBox3.Text,
            Count = TextBox4.Text,
            Type = DropDownList1.SelectedValue,
            Introduce = TextBox6.Text,
            PictureUrl = PictureUpload(),
            Publisher = TextBox5.Text
        };
        return book;
    }
    public string PictureUpload()
    {
        if (FileUpload1.HasFile)
        {
            string filePath = Server.MapPath("../../img/bookImg/");
            string fileName = FileUpload1.PostedFile.FileName;
            FileUpload1.SaveAs(filePath + fileName);
            return fileName;
        }
        else
        {
            Response.Write("<p >请选择要上传的文件!</p>");
            return "";
        }
    }

}