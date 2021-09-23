using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

public partial class index : System.Web.UI.Page
{
    //页面加载时执行
    protected void Page_Load(object sender, EventArgs e)
    {
        //绑定最热图书
        BindDataList1();
        //绑定最新上架
        BindDataList2();
        //绑定轮播图
        BindPhoto();
    }
    protected void BindPhoto()
    {
        //调用业务逻辑层方法
        PhotoBLL photoBLL = new PhotoBLL();
        //绑定数据源
        Repeater1.DataSource =  photoBLL.GetAllPhotoByDs();
        //数据绑定
        Repeater1.DataBind();
    }
    protected void BindDataList1()
    {
        BookBLL bookBLL = new BookBLL();
        //绑定数据源
        DataList1.DataSource = bookBLL.Get4SalesBookByDs();
        //数据绑定
        DataList1.DataBind();
    }

    protected void BindDataList2()
    {
        BookBLL bookBLL = new BookBLL();

        DataList2.DataSource = bookBLL.Get4TimeBookByDs();
        DataList2.DataBind();
    }
}