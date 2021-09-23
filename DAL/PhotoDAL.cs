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
    public class PhotoDAL
    {
        #region 添加轮播图
        public static bool PhotoAdd(Photo photo)

        {
            string sql = "insert into Photo (path,name) values ('" + photo.Path + "','" + photo.Name+ "')";
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

        #region 修改轮播图
        public static bool PhotoUpdate(Photo photo)
        {
            string sql = "update  Photo set path = '"+photo.Path+"', name ='" + photo.Name + "' where Id = "+photo.ID ;
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
        #region 删除轮播图

        public static bool PhotoDelete(string Id)

        {
            string sql = "delete from Photo where ID =" + Id;
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

        #region 查询轮播图
        public static DataSet GetAllPhotoByDs()
        {
            string sql = "select * from Photo";
            DataSet ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
            return ds;
        }

        public static int GetAllPhotoNum()
        {
            string sql = "select count(*) from Photo";
            int result = 0;
            SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
            while (dr.Read())
            {
                result = Convert.ToInt16(dr[0]);
                
            }
            return result;
        }
        #endregion

        #region 查询轮播图
        public static Photo GetPhotoById(string Id)
        {
            Photo photo = new Photo();
            string sql = "select * from Photo where ID = '" + Id + "'";
            SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
            while (dr.Read())
            {
                photo.Name = dr[0].ToString();
                photo.Path = dr[1].ToString();
            }
            return photo;
        }
        #endregion

    }
}