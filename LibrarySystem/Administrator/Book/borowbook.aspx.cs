using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Book_borowbook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGridView1();
    }
    public void BindGridView1()
    {
        BookRecordBLL bookRecordBLL = new BookRecordBLL();
        DataSet ds = bookRecordBLL.GetAllBookRecordByDs();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // 得到该控件
        GridView theGrid = sender as GridView;
        int newPageIndex = 0;
        if (e.NewPageIndex == -3)
        {
            //点击了Go按钮
            TextBox txtNewPageIndex = null;

            //GridView较DataGrid提供了更多的API，获取分页块可以使用BottomPagerRow 或者TopPagerRow，当然还增加了HeaderRow和FooterRow
            GridViewRow pagerRow = theGrid.BottomPagerRow;

            if (pagerRow != null)
            {
                //得到text控件
                txtNewPageIndex = pagerRow.FindControl("txtNewPageIndex") as TextBox;
            }
            if (txtNewPageIndex != null)
            {
                //得到索引
                newPageIndex = int.Parse(txtNewPageIndex.Text) - 1;
            }
        }
        else
        {
            //点击了其他的按钮
            newPageIndex = e.NewPageIndex;
        }
        //防止新索引溢出
        newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
        newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;

        //得到新的值
        theGrid.PageIndex = newPageIndex;
        //重新绑定
        BindGridView1();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //"移除"按钮也会调用此函数

        if (e.CommandName == "huanshu")

        {

            //注意此时的CommandArgument表示的是所在行的索引。

            int index = int.Parse(e.CommandArgument.ToString());

            string id = GridView1.Rows[index].Cells[0].Text;
            string BookId = GridView1.Rows[index].Cells[6].Text;
            string bookstatus = GridView1.Rows[index].Cells[7].Text;
            string unre = "未归还";
            if (bookstatus.Equals(unre))
            {
                BookRecordBLL bookRecordBLL = new BookRecordBLL();
                bookRecordBLL.GuiHuan(id, BookId);

            }
            else
            {
                Response.Write(" < script > alert('该书已归还！请勿重复操作') </ script > ");
            }
            BindGridView1();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownList1.SelectedValue=="全部")
        {
            BindGridView1();
            return;
        }
        BookRecordBLL bookRecordBLL = new BookRecordBLL();
        DataSet ds = bookRecordBLL.GetAllBookRecordByDs(null, DropDownList1.SelectedValue, null);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            BindGridView1();
            return;
        }
        BookRecordBLL bookRecordBLL = new BookRecordBLL();
        DataSet ds = bookRecordBLL.GetAllBookRecordByDs(TextBox1.Text);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        if (TextBox2.Text == "")
        {
            BindGridView1();
            return;
        }
        BookRecordBLL bookRecordBLL = new BookRecordBLL();
        DataSet ds = bookRecordBLL.GetAllBookRecordByDs(null,null,TextBox2.Text);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}