using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BLL
{
    public class UserBLL
    {
        //验证登陆
        public User login(string username,string pwd)
        {

            return UserDAL.getUser(username, pwd);
        }
        //添加用户
        public bool UserAdd(User user)
        {
            return UserDAL.NewsAdd(user);
        }
        public DataSet getUserByDataset()
        {
            return UserDAL.getUserByDataset();
        }
        //查找用户
        public User getUser(string username)
        {
            return UserDAL.getUser(username);
        }//
        public  bool userUpdate(User user)
        {
            return UserDAL.userUpdate(user);
        }
        /// <summary>
        /// 删除用户
        /// </summary>
        /// <param name="Id"></param>
        public  void shanchu(string Id)
        {
            UserDAL.shanchu(Id);
        }
    }
    
}
