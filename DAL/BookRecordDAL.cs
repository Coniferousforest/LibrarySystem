using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Model;
using System.Data;

namespace DAL
{
    public class BookRecordDAL
    {
        #region 添加图书借阅记录
        //添加图书借阅记录
        public static bool BookRecordAdd(BookRecord bookRecord)

        {
            string sql = "insert into bookRecord (Name,UserId,BookName,BookId,Date,ReturnTime,Status) values ('" + bookRecord.Name + "','" + bookRecord.UserId + "','" + bookRecord.BookName + "'," + bookRecord.BookId + ",'" + DateTime.Now.ToString() + "','"+DateTime.Now.AddDays(30)+"','未归还')";
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
        public static int JudgBookCount(string userID)
        {
            string sql = "select count(*) from bookRecord where Status='未归还' and UserId = '" + userID + "'";
            int result = 0 ; 
            SqlDataReader dr  = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
            while(dr.Read())
            {
                result = Convert.ToInt16(dr[0]);
            }
            return result;
        }
        public static bool GuiHuan(string ID)

        {
            string sql = "update  bookRecord set Status='已归还'  where Id = " + ID;
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

        /// <summary>
        /// 获取所有图书并返回dataset
        /// </summary>
        /// <returns></returns>
        public static DataSet GetAllBookRecordByDs(string userID=null,string type = null, string bookname = null)
        {
            BookRecord bookRecord = new BookRecord();
            DataSet ds = new DataSet();
            string sql = "select * from bookRecord where 1=1  ";
            if(userID!=null)
            {
                sql += "and UserId like '%"+userID+"%'";
            }
            if (type != null)
            {
                if(type =="1")
                {
                    sql += " and Status ='未归还'";
                }
                if (type == "0")
                {
                    sql += " and Status ='已归还'";
                }
            }
            if(bookname!=null)
            {
                sql += "and BookName like'%" + bookname + "%'";
            }
            ds = SqlHelper.ExecuteDataset(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
            return ds;
        }

    }
}