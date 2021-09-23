using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Model;
using System.Data;

public class BookDAL
{
    #region 添加图书
    //添加图书
    public static bool BookAdd(Book book)

    {
        string sql = "insert into book (name,type,writer,introduce,money,count,sales,time,pictureUrl,publisher) values ('" + book.Name + "',"+book.Type+",'"+book.Writer+"','" + book.Introduce + "','" + book.Money + "'," + book.Count + "," + "0" + ",'" + DateTime.Now + "','"+book.PictureUrl+"','"+book.Publisher+"')";
        int result = SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        if (result == 0)
        {
            return false;
        }
        else
        {
            return true;
        }
        

    }
    #endregion

    #region 修改图书信息
    public static bool BookUpdate(Book book)
    {
        string sql = "update  book set name='" + book.Name + "',writer='"+book.Writer+ "',introduce='" + book.Introduce  + "',type=" + book.Type + ",money='" + book.Money + "',count=" + book.Count +",pictureUrl='"+book.PictureUrl+"',publisher='"+book.Publisher+"', sales = '"+book.Sales+"'  where ID="+book.ID;
        int result = SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        if (result == 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    #endregion

    #region 下架图书
    public static bool BookDelete(string Id)

    {
        string sql = "delete from book where ID="+Id;
        int result = SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        if (result == 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    #endregion

    #region 查询图书

    /// 通过编号查询图书
  
    public static Book GetBookByID(string ID)
    {
        Book book = new Book();
        string sql = "select * from [book] where ID='" + ID + "'";
        SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        while (dr.Read())
        {
            book.ID = Convert.ToInt16(dr[0]);
            book.Name = Convert.ToString(dr[1]);
            book.Writer = Convert.ToString(dr[2]);
            book.Introduce = Convert.ToString(dr[3]);
            book.Type = Convert.ToString(dr[4]);
            book.Money = Convert.ToString(dr[5]);
            book.Count = Convert.ToString(dr[6]);
            book.Sales = Convert.ToString(dr[7]);
            book.Time = Convert.ToString(dr[8]);
            book.PictureUrl = Convert.ToString(dr[9]);
            book.Publisher = Convert.ToString(dr[10]);
        }
        if (book == null)
        {
            return null;
        }
        else
        {
            return book;
        }
    }
    //通过图书名称查询图书
    public static DataSet GetBookByName(string name)
    {
        Book book = new Book();
        DataSet ds = new DataSet();
        string sql = "select  from [book] where name like'%" + name + "%'";
        ds = SqlHelper.ExecuteDataset(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        return ds;
    }
    /// <summary>
    /// 获取所有图书并返回dataset
    /// </summary>
    /// <param name="type">获取图书的种类</param>
    /// <param name="orderby">按什么排序</param>
    /// <param name="order">正序倒叙</param>
    /// <param name="num">获取的数量</param>
    /// <returns></returns>
    public static DataSet GetAllBookByDs(string name,string type,string orderby,string order,string num)
    {
        Book book = new Book();
        DataSet ds = new DataSet();
        string sql;
        if (num == null)
        {
            sql = "select * from [book] where 1=1 ";
        }
        else
        {
            sql = "select top "+num+" * from [book] where 1=1 ";
        }
        if (type != null)
        {
            sql += "and type="+type;
        }
        if (name != null)
        {
            sql += " and name like '%" + name + "%'";
        }
        if (orderby != null)
        {
            sql += " order by " + orderby;
        }
        if (order != null)
        {
            sql += " " + order;
        }
        ds = SqlHelper.ExecuteDataset(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        return ds;
    }
    //获取所有特殊分类的图书并返回dataset
    public static DataSet GetAllBookByType(string type,string order)
    {
        Book book = new Book();
        DataSet ds = new DataSet();
        string sql = "select * from [book] where type ="+type;
        ds = SqlHelper.ExecuteDataset(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        return ds;
    }
    //获取首页的畅销图书
    public static DataSet Get4SalesBookByDs()
    {
        Book book = new Book();
        DataSet ds = new DataSet();
        string sql = "select top 4 * from [book] order by sales desc";
        ds = SqlHelper.ExecuteDataset(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        return ds;
    }
    //获取首页的新书
    public static DataSet Get4TimeBookByDs()
    {
        Book book = new Book();
        DataSet ds = new DataSet();
        string sql = "select top 4 * from [book] order by time desc";
        ds = SqlHelper.ExecuteDataset(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        return ds;
    }
   
    #endregion

}
