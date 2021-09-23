using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
using System.Web.Services;

public partial class ChooseSeat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string BindSeat(int seat)
    {
        SeatBLL seatBLL = new SeatBLL();
        Seat[] seats = seatBLL.GetSeats();
        return seats[seat].IsSitting;

    }
    public bool JudgeLogin()
    {
        if (Session["user"] == null)
        {
            return false;
        }
        return true;
    }

    //选座
    public bool Choose(string Id )
    {
        Seat seat = new Seat();
        seat.ID = Id;
        seat.IsSitting = "不可选择";
        seat.SitingTime = DateTime.Now.ToString();
        if (Session["user"] != null)
        {
            User user = Session["user"] as User;
            seat.SittingPeple = user.Username;//座
        }
        
         SeatBLL seatBLL = new SeatBLL();
        if(seatBLL.seatsJudge(seat.SittingPeple))
        {
            return false;//人
        }
        return seatBLL.SeatAdd(seat);
       
    }
    [WebMethod]//标示为web服务方法属性
    public static string sayhell(string Id)//注意函数的修饰符,只能是静态的
    {
        ChooseSeat choose = new ChooseSeat();
        if (choose.JudgeLogin())
        {
            if (choose.Choose((Convert.ToInt16(Id) + 1).ToString()))
            {
                return "选座成功";
            }
            return "选座失败";
        }
        else
        {
            return "请先登陆";
        }
       
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {

    }
}