using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
public partial class bookdetail : System.Web.UI.Page
{
    Book book = new Book();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string bookId = Request.QueryString["bookId"];
        
        if(bookId!="")
        {
            GetBookInfo(bookId);
        }
       
    }
    protected string BindBook(string type)
    {
        switch(type)
        {
            case "Name": { return book.Name;  }
            case "Money": { return book.Money; }
            case "Writer": { return book.Writer; }
            case "PictureUrl": { return book.PictureUrl; }
            case "Time": { return book.Time; }
            case "ID": { return book.ID.ToString(); }
            case "Sales": { return book.Sales; }
            case "Introduce": { return book.Introduce; }
            case "Count": { return book.Count; }
            case "pictureUrl": { return book.PictureUrl; }
            default: return "-";
        }

    }
    protected void GetBookInfo(string Id)
    {
        BookBLL bookBLL = new BookBLL();
        book = bookBLL.GetBookByID(Id);
    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        if(book.Count=="0")
        {
            Response.Write("<script>alert('库存不足')</script>");
            return;
        }
        else      
        {
            book.Count = (Convert.ToInt16(book.Count) - 1).ToString();
            book.Sales = (Convert.ToInt16(book.Sales) + 1).ToString();
        }
        BookRecordBLL RecordBLL = new BookRecordBLL();
        BookRecord bookRecord = new BookRecord();
        bookRecord.BookId = book.ID;
        bookRecord.BookName = book.Name;
        if (Session["user"] != null)
        {
            User user = Session["user"] as User;
            if (RecordBLL.JudgBookCount(user.Username)>1)
            {
                Response.Write("<script>alert('借阅书籍不能超过1本')</script>");
                return;
            }
            bookRecord.UserId = user.Username;
            bookRecord.Name = user.Name;
        }
        else
        {
            Response.Redirect("login.aspx");
        }
        
        //添加借阅记录
        RecordBLL.BookRecord(bookRecord);
        BookBLL bookBLL = new BookBLL();
        var result = bookBLL.BookUpdate(book);
        if(result)
        {
            Response.Write("<script>alert('借阅成功')</script>");
        }
        else
        {
            Response.Write("<script>alert('服务器错误')</script>");
        }
    }
}