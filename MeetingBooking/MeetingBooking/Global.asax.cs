using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace MeetingBooking
{
  public class MvcApplication : System.Web.HttpApplication
  {
    protected void Application_Start()
    {
      AreaRegistration.RegisterAllAreas();
      FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
      RouteConfig.RegisterRoutes(RouteTable.Routes);
      BundleConfig.RegisterBundles(BundleTable.Bundles);
      Application["user_online"] = 0;

    }

    protected void Session_Start(object sender, EventArgs e)
    {
      Application.Lock();
      Application["user_online"] = (int)Application["user_online"] + 1;
      Application.UnLock();
    }

    protected void Session_End(object sender, EventArgs e)
    {
      Application.Lock();
      Application["user_online"] = (int)Application["user_online"] - 1;
      Application.UnLock();
    }
  }
}
