using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

public partial class book : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindDataList1(null,null,null,null,null);
    }

    /// <summary>
    /// 获取图书信息绑定datalist并分页
    /// </summary>
    /// <param name="type">获取图书的种类</param>
    /// <param name="orderby">按什么排序</param>
    /// <param name="order">正序倒叙</param>fsdfsdafsad
    /// <param name="num">获取的数量</param>
    /// <returns></returns>
    protected void BindDataList1(string name,string type, string orderby, string order, string num)
    {
        //调用业务逻辑层
        BookBLL bookBLL = new BookBLL();
        //新建一个分页
        PagedDataSource objPage = new PagedDataSource();
        //将数据绑定给分页
        objPage.DataSource = bookBLL.GetAllBookByDs(name,type,orderby,order,num).Tables[0].DefaultView;
        objPage.AllowPaging = true;
        //每页个数
        objPage.PageSize = 8;
        int CurPage;
        if (Request.QueryString["Page"] != null)
            CurPage = Convert.ToInt32(Request.QueryString["Page"]);
        else
            CurPage = 1;
        objPage.CurrentPageIndex = CurPage - 1;
        lblCurrentPage.Text = CurPage.ToString();
        lblSumPage.Text = objPage.PageCount.ToString();
        //是否为首页
        if (!objPage.IsFirstPage)
        {
            this.hyfirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + 1;
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1);
        }
        //是否为尾页
        if (!objPage.IsLastPage)
        {
            hylastpage.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + objPage.PageCount;

            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1);
        }
        //绑定数据源
        this.DataList1.DataSource = objPage;
        //数据绑定
        this.DataList1.DataBind();
    }

    #region 按图书分类划分图书

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        BindDataList1(null, "1", null, null, null);
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        BindDataList1(null, "2", null, null, null);
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        BindDataList1(null, "3", null, null, null);
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        BindDataList1(null, "4", null, null, null);
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        BindDataList1(null, "5", null, null, null);
    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        BindDataList1(null, "6", null, null, null);
    }
    #endregion

    #region 按规定排序 
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        BindDataList1(null,null, "time", "desc", null);
    }

    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        BindDataList1(null, null, "sales", "desc", null);
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        BindDataList1(null, null, "money", null, null);
    }
    #endregion

    //搜索指定图书
    protected void Button1_Click(object sender, EventArgs e)
    {
        BindDataList1(TextBox1.Text, null, null, null, null);
    }
}