using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


/// <summary>
/// UserDAL 的摘要说明
/// </summary>
public class UserDAL
{
    public UserDAL()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    #region 添加用户
    public static bool NewsAdd(User user)

    {
        string sql = "insert into [user] (username,name,sex,leve,userpwd,phone) values ('" + user.Username + "','" + user.Name + "','" + user.Sex + "'," + user.Leve + ",'"+user.Userpwd+"','"+user.Phone+"')";
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
    /// 获取指定用户
    /// </summary>
    /// <param name="username"></param>
    /// <returns></returns>
    public static User getUser(string username)
    {
        User user = new User();
        string sql = "select * from [user] where username='" + username + "'";
        SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        while (dr.Read())
        {
            user.Username = Convert.ToString(dr[0]);
            user.Name = Convert.ToString(dr[1]);
            user.Sex = Convert.ToString(dr[2]);
            user.Leve = Convert.ToInt16(dr[3]);
            user.Userpwd = Convert.ToString(dr[4]);
            user.Phone = Convert.ToString(dr[5]);
            user.Lastlogintime = Convert.ToString(dr[7]);
        }
        if (user == null)
        {
            return null;
        }
        else
        {
            return user;
        }
        

    }
    /// <summary>
    /// 登陆验证
    /// </summary>
    /// <param name="username"></param>
    /// <param name="pwd"></param>
    /// <returns></returns>
    public static User getUser(string username, string pwd)
    {
        User user = new User();
        string sql = "select * from [user] where username='" + username + "' and userpwd ='"+pwd+"'";
        SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        while (dr.Read())
        {
            user.Username = Convert.ToString(dr[0]);
            user.Name = Convert.ToString(dr[1]);
            user.Sex = Convert.ToString(dr[2]);
            user.Leve = Convert.ToInt16(dr[3]);
            user.Userpwd = Convert.ToString(dr[4]);
            user.Phone = Convert.ToString(dr[5]);
            user.Lastlogintime = Convert.ToString(dr[7]);
        }
        if (user.Username == null)
        {
            return null;
        }
        else
        {
            return user;
        }
    }

    public static DataSet getUserByDataset()
    {
        DataSet ds = new DataSet();
        string sql = "select * from [user]";
        ds = SqlHelper.ExecuteDataset(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
        return ds;
    }
    public static void shanchu(string Id)
    {
        DataSet ds = new DataSet();
        string sql = "delete from [user] where username='" + Id+"'";
        int result = SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(), CommandType.Text, sql, null);
      
    }

    public static bool userUpdate(User user)
    {
        string sql = "update [user] set  name='" + user.Name + "', sex ='" + user.Sex + "', leve =" + user.Leve + ", userpwd ='" + user.Userpwd + "', phone ='" + user.Phone + "' where username ='" + user.Username + "'";
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




}