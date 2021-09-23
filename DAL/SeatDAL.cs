using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;
using System.Data.SqlClient;


namespace DAL
{
    public class SeatDAL
    {
        #region 座位查询
        public static DataSet GetSeat()
        {
            Seat seat = new Seat();
            string sql = "select * from seats order by ID";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
            return ds;
        }
        #endregion
        #region 选座
        public static bool seatsUpdate(Seat seat)
        {
            string sql = "update  seats set isSitting='" + seat.IsSitting + "',sitingTime='" + seat.SitingTime + "',sittingPeple='" + seat.SittingPeple + "' where ID=" + seat.ID;
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
        #region 判断是否选过座位
        public static bool seatsJudge(string sittingPeple)
        {
             string count="";
            string sql = "select count(*) from seats where sittingPeple = '" + sittingPeple+"'";
            SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
            while (dr.Read())
            {
                count = dr[0].ToString();
            }
            return count=="1"?true:false;
        }
        #endregion
        #region 释放座位
        public static void releaseSeat()
        {
            string sql = "update seats set sittingPeple ='', isSitting='可选择' where DATEDIFF(hour, sitingTime,GETDATE())>3;";
            int result = SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(), CommandType.Text, sql, null);

        }
        #endregion

        #region 手动释放座位
        public static void manureleaseSeat(string Id)
        {
            string sql = "update seats set sittingPeple ='', isSitting='可选择' where ID =" + Id;
            int result = SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(), CommandType.Text, sql, null);

        }
        #endregion
    }
}
