using Microsoft.AspNet.FriendlyUrls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Shop
{
    public class Global : System.Web.HttpApplication
    {
        private static readonly List<string> _sessions = new List<string>(); 
        private static readonly object padlock = new object();
        protected void Application_Start(object sender, EventArgs e)
        {
            Library.Model skdl = new Library.Model();
            skdl.Setconstr = @"Data Source=.;Database=PhoneixShop;User ID=sa;Password=qwerty123@;";
            RegisterRoutes(RouteTable.Routes);
        }
        public static List<string> Sessions
        {
            get
            {
                return _sessions;
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            lock (padlock)
            {
                _sessions.Add(Session.SessionID);
            }
        }
        protected void Session_End(object sender, EventArgs e)
        {
            lock (padlock)
            {
                _sessions.Remove(Session.SessionID);
            }
        }
        public static void RegisterRoutes(RouteCollection routes)
        {
            //var settings = new FriendlyUrlSettings();
            //settings.
            //    AutoRedirectMode = RedirectMode.Permanent;
            //settings.
            //    ResolverCachingMode = ResolverCachingMode.Dynamic;
            //routes.EnableFriendlyUrls(new FriendlyUrlSettings()
            //{
            //    AutoRedirectMode = RedirectMode.Permanent,
            //    ResolverCachingMode = ResolverCachingMode.Dynamic
            //});

            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings,
                                  new IFriendlyUrlResolver[] {
                                 new CustomFriendlyUrlResolver() });

            // routes.MapPageRoute("", "Product/cat/{id}", "~/shop/Product.aspx");
            // routes.MapPageRoute("", "Register", "~/Register.aspx");
        }
        public class CustomFriendlyUrlResolver : WebFormsFriendlyUrlResolver
        {
            public CustomFriendlyUrlResolver() { }

            public override string ConvertToFriendlyUrl(string path)
            {
                if (!string.IsNullOrEmpty(path))
                {
                    //how to ignore radeditor dialoghandler.aspx
                    if (path.ToLower().Contains("telerik.web.ui.dialoghandler.aspx"))
                    { // Here the filter code
                        return path;
                    }
                    //how to ignore all aspx requests for url rewriting
                    //if (path.ToLower().Contains(".aspx"))
                    //{
                    //    return path;
                    //}
                }
                return base.ConvertToFriendlyUrl(path);
            }
        }
    }
}