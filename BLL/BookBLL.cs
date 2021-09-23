using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;
namespace BLL
{
    public class BookBLL
    {
        //添加图书
        public bool BookAdd(Book book)
        {
            return BookDAL.BookAdd(book);
        }

        

        //更新图书信息
        public bool BookUpdate(Book book)
        {
            return BookDAL.BookUpdate(book);
        }
        //删除图书
        public bool BookDelete(string Id)
        {
            return BookDAL.BookDelete(Id);
        }
        //获取所有图书并返回dataset
        public DataSet GetAllBookByDs(string name,string type, string orderby, string order, string num)
        {
            return BookDAL.GetAllBookByDs(name,type,orderby,order,num);
        }
        //获取首页的借阅量图书最高的
        public DataSet Get4SalesBookByDs()
        {
            return BookDAL.Get4SalesBookByDs();
        }
        //获取首页的新书上架
        public DataSet Get4TimeBookByDs()
        {
            return BookDAL.Get4TimeBookByDs();
        }
        //通过ID获取图书详细信息
        public Book GetBookByID(string id)
        {
            return BookDAL.GetBookByID(id);
        }
        //通过种类获取所有图书
        public DataSet GetAllBookByType(string type,string order)
        {
            return BookDAL.GetAllBookByType(type,order);
        }
        public DataSet GetBookByName(string name)
        {
            return BookDAL.GetBookByName(name);
        }
        

    }
}
