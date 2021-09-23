<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // 在应用程序启动时运行的代码

        System.Threading.Thread LoadServiceData = new System.Threading.Thread(new System.Threading.ThreadStart(LoadFromWebservice));
        LoadServiceData.Start();
        //LoadServiceData.Abort();

    }

    void Application_End(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(10000);

        string RequestURL = "http://www.test.com/default.aspx";
        //这里设置你的web地址，可以随便指向你的任意一个aspx页面甚至不存在的页面，目的是要激发Application_Start
        System.Net.HttpWebRequest __HttpWebRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(RequestURL);
        System.Net.HttpWebResponse __HttpWebResponse = (System.Net.HttpWebResponse)__HttpWebRequest.GetResponse();
        System.IO.Stream __rStream = __HttpWebResponse.GetResponseStream();//得到回写的字节流  
                                                                           //当不再需要计时器时，请使用 Dispose 方法释放计时器持有的资源。
        __rStream.Close();
        __rStream.Dispose();

    }

    void Application_Error(object sender, EventArgs e)
    {
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e)
    {
        // 在新会话启动时运行的代码

    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
        // 或 SQLServer，则不引发该事件。

    }
    private void LoadFromWebservice()
    {
        //定义一个定时器，并开启和配置相关属性
        System.Timers.Timer Wtimer = new System.Timers.Timer(1000);//执行任务的周期
        Wtimer.Elapsed += new System.Timers.ElapsedEventHandler(Wtimer_Elapsed);
        Wtimer.Enabled = true;
        Wtimer.AutoReset = true;
        if (1 == 1)
        {

        }
    }
    void Wtimer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
    {
        BLL.SeatBLL seatBLL = new BLL.SeatBLL();
        seatBLL.releaseSeat();
    }

</script>
