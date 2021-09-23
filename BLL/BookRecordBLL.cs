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
    public class BookRecordBLL
    {
        //添加图书借阅记录
        public bool BookRecord(BookRecord bookRecord)
        {
            return BookRecordDAL.BookRecordAdd(bookRecord);
        }
        //
        public  int JudgBookCount(string userID)
        {
            return BookRecordDAL.JudgBookCount(userID);
        }
        //查询所有图书
        public DataSet GetAllBookRecordByDs(string userID = null, string type = null, string bookname = null)
        {
            return BookRecordDAL.GetAllBookRecordByDs(userID, type, bookname);
        }
        public  bool GuiHuan(string ID,string BookId)
        {
            Book book = BookDAL.GetBookByID(BookId);
            if(BookRecordDAL.GuiHuan(ID))
            {
                book.Count = (Convert.ToInt16(book.Count)+1).ToString();
                BookDAL.BookUpdate(book);
            }

            return true;
        }

    }
}
