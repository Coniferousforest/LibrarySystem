using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
public partial class Administrator_Book_update : System.Web.UI.Page
{
    Book book = new Book();
    protected void Page_Load(object sender, EventArgs e)
    {

        string bookId = Request.QueryString["Id"];
        if (bookId != "")
        {
            GetBookInfo(bookId);

        }
        if (!IsPostBack)
        {
            BindBook();
        }





    }
    protected void BindBook()
    {
        TextBox1.Text = book.Name;
        TextBox2.Text = book.Writer;
        TextBox3.Text = book.Money;
        TextBox4.Text = book.Count;
        DropDownList1.SelectedValue = book.Type;
        TextBox6.Text = book.Introduce;
        TextBox7.Text = book.Publisher;
        TextBox8.Text = book.PictureUrl;

    }
    protected void GetBookInfo(string Id)
    {
        BookBLL bookBLL = new BookBLL();
        book = bookBLL.GetBookByID(Id);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        BookAdd();
    }
    public void BookAdd()
    {
        Book book = BookBind();
        book.ID = this.book.ID;
        if (book.PictureUrl == "")
        {
            return;
        }
        BookBLL bookBLL = new BookBLL();
        if (bookBLL.BookUpdate(book))
        {
            Response.Write("<script>alert('修改成功')</script>");
            Response.Write("<script>window.location.href='boodetail.aspx'; </script>");
        }
        else
        {
            Response.Write("<script>alert('修改失败')</script>");
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
            Introduce = TextBox5.Text,
            PictureUrl = PictureUpload(),
            Publisher = TextBox7.Text
        };
        //Response.Write("<script>alert('" + TextBox1.Text + "')</script>");
        //Response.Write("<script>alert('" + TextBox2.Text + "')</script>");
        //Response.Write("<script>alert('" + TextBox3.Text + "')</script>");
        //Response.Write("<script>alert('" + TextBox4.Text + "')</script>");
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

            return TextBox8.Text;
        }
    }
}