using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Model
{
    public class Book
    {
        //图书编号
        public int ID { get; set; }
        //图书名称
        public string Name { get; set; }
        //图书作者
        public string Writer { get; set; }
        //图书简介
        public string Introduce { get; set; }
        //图书类别
        public string Type { get; set; }
        //图书价格
        public string Money { get; set; }
        //图书数量
        public string Count { get; set; }
        //图书销量
        public string Sales { get; set; }
        //图书时间
        public string Time { get; set; }
        //图书图片
        public string PictureUrl { get; set; }
        //出版社
        public string Publisher { get; set; }
    }

}