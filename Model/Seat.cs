
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Model
{
    public class Seat
    {
        //座位号
        public string ID { get; set; }
        //是否有人坐
        public string IsSitting { get; set; }
        //坐的时间
        public string SitingTime { get; set; }
        //正在坐的人
        public string SittingPeple { get; set; }
    }
}