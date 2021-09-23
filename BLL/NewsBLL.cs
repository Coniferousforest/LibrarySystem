using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;
using DAL;

namespace BLL
{
    public class NewsBLL
    {
        //添加新闻
        public  bool NewsAdd(News news)
        {
           return  NewsDAL.NewsAdd(news);
        }
        //更新新闻
        public  bool NewsUpdate(News news)
        {
            return NewsDAL.NewsUpdate(news);
        }
        //点赞
        public void NewsLoves(string Id)
        {
             NewsDAL.NewsLovesAdd(Id);
        }
        //删除新闻
        public  bool NewsDelete(string Id)
        {
            return NewsDAL.NewsDelete(Id);
        }
        //获取图书
        public News GetNewsByID(string ID)
        {
            return NewsDAL.GetNewsByID(ID);
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
        public DataSet GetAllNewsByDs(string title, string type, string orderby, string order, string num)
        {
            return NewsDAL.GetAllNewsByDs(title, type,orderby, order, num);
        }
    }
}
