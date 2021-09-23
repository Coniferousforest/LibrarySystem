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
    public class SeatBLL
    {
        //获取每一个座位的状态并返回数组
        public Seat[] GetSeats()
        {
            int i = 0;
            Seat[] seats = new Seat[60] ;
            for(int j = 0;j<60;j++)
            {
                seats[j] = new Seat(); 
            }
            DataTable dt = SeatDAL.GetSeat().Tables[0];
            foreach(DataRow row in dt.Rows)
            {
                seats[i].ID = row["ID"].ToString();
                seats[i].IsSitting = row["isSitting"].ToString();
                seats[i].SitingTime = row["sitingTime"].ToString();
                seats[i++].SittingPeple = row["sittingPeple"].ToString();
            }
            return seats;
        }
        public  bool seatsJudge(string sittingPeple)
        {
            return SeatDAL.seatsJudge(sittingPeple);
        }
        public bool SeatAdd(Seat seat)
        {
            return SeatDAL.seatsUpdate(seat);
        }

        public void  releaseSeat()
        {
             SeatDAL.releaseSeat();
        }
        public  void manureleaseSeat(string Id)
        {
            SeatDAL.manureleaseSeat(Id);
        }
    }
}
