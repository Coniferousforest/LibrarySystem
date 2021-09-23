using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

public partial class news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindDataList1(null, null, null, null, null);
    }
    protected void BindDataList1(string name, string type, string orderby, string order, string num)
    {

        NewsBLL newsBLL = new NewsBLL();

        PagedDataSource objPage = new PagedDataSource();

        objPage.DataSource = newsBLL.GetAllNewsByDs(name, type, orderby, order, num).Tables[0].DefaultView;
        objPage.AllowPaging = true;
        objPage.PageSize = 8;
        int CurPage;
        if (Request.QueryString["Page"] != null)
            CurPage = Convert.ToInt32(Request.QueryString["Page"]);
        else
            CurPage = 1;
        objPage.CurrentPageIndex = CurPage - 1;
        lblCurrentPage.Text = CurPage.ToString();
        lblSumPage.Text = objPage.PageCount.ToString();
        if (!objPage.IsFirstPage)
        {
            this.hyfirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + 1;
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1);
        }
        if (!objPage.IsLastPage)
        {
            hylastpage.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + objPage.PageCount;

            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1);
        }
        this.DataList1.DataSource = objPage;
        this.DataList1.DataBind();
    }
}