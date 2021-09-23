using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class BookRecord
    {
        public int Id { get; set; }
        //借书人姓名
        public string Name { get; set; }
        //借阅人Id
        public string UserId { get; set; }
        //图书名
        public string BookName { get; set; }
        //图书Id
        public int BookId { get; set; }
        //借阅日期
        public DateTime Date { get; set; }
    }
}
