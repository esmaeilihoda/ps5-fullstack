using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Shop.Class
{
    public static class CookieControl
    {
        public static string[] GetCookie
        {
            get
            {
                Shop.ShopMain Shm = new Shop.ShopMain();
                return Shm.Get_SetCookie();
            }
        }
        public static string GetDomainName
        {
            get
            {
                string
                    host = HttpContext.Current.Request.Url.Host;
                return host;
            }
        }
    }
}