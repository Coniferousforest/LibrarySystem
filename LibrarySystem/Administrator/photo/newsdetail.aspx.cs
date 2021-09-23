using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

public partial class Administrator_News_newsdetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGridView1();
    }
    public void BindGridView1()
    {
        PhotoBLL photo = new PhotoBLL();
        GridView1.DataSource = photo.GetAllPhotoByDs();
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

        if (e.CommandName == "del")

        {

            //注意此时的CommandArgument表示的是所在行的索引。

            int index = int.Parse(e.CommandArgument.ToString());

            string id = GridView1.Rows[index].Cells[0].Text;

            PhotoBLL photoBLL = new PhotoBLL();
            photoBLL.PhotoDelete(id);
            BindGridView1();
        }
    }
}