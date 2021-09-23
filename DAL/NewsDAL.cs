using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Model;
using System.Data;
namespace DAL
{
    public class NewsDAL
    {

        #region 添加新闻
        public static bool NewsAdd(News news)

        {
            string sql = "insert into news (title,article,writer,time,loves) values ('" + news.Title + "','" + news.Article + "','" + news.Writer + "','" + DateTime.Now + "'," + "0 )";
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
        #region 修改新闻信息
        public static bool NewsUpdate(News news)
        {
            string sql = "update  news set title='" + news.Title + "',article='" + news.Article  + "',writer='" + news.Writer  + "',time='" + news.Time + "',Loves=" + news.Loves + " where ID=" + news.ID ;
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
        //给文章点赞
        public static bool NewsLovesAdd(string ID)
        {
            string sql = "update  news set loves=loves+1 where ID="+ID;
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
        #region 下架新闻
        public static bool NewsDelete(string Id)
        {
            string sql = "delete from news where ID=" + Id;
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
        //通过编号查询图书
        public static News GetNewsByID(string ID)
        {
            News news = new News();
            string sql = "select * from [news] where ID='" + ID + "'";
            SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
            while (dr.Read())
            {
                news.ID = Convert.ToString(dr[0]);
                news.Title = Convert.ToString(dr[1]);
                news.Article = Convert.ToString(dr[2]);
                news.Writer = Convert.ToString(dr[3]);
                news.Time = Convert.ToString(dr[4]);
                news.Loves = Convert.ToString(dr[5]);
            }
            if (news == null)
            {
                return null;
            }
            else
            {
                return news;
            }
        }
        /// <summary>
        /// 获取所有新闻并返回dataset
        /// </summary>
        /// <param name="title">获取新闻的标题</param>
        /// <param name="type">获取新闻的种类</param>
        /// <param name="orderby">按什么排序</param>
        /// <param name="order">正序倒叙</param>
        /// <param name="num">获取的数量</param>
        /// <returns></returns>
        public static DataSet GetAllNewsByDs(string title, string type, string orderby, string order, string num)
        {
            Book book = new Book();
            DataSet ds = new DataSet();
            string sql;
            if (num == null)
            {
                sql = "select * from [news] where 1=1 ";
            }
            else
            {
                sql = "select top " + num + " * from [news] where 1=1 ";
            }
            if (type != null)
            {
                sql += "and type=" + type;
            }
            if (title != null)
            {
                sql += " and name like '%" + title + "%'";
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
        #endregion
    }
}
