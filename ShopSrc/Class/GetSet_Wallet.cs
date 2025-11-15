using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Library;

namespace Shop.Class
{

    public class GetSet_Wallet
    {
        UserPayMoney UPM = new UserPayMoney();
        Model.EXEQ ME = new Model.EXEQ();
        private string[] UserName; private bool Control;
        public string[] Set_Uname
        {
            set
            {
                UserName = value;
            }
        }
        public double GetWalletAmount
        {
            get
            {
                UPM.process(UserName);
                return UPM.getmandekif;
            }
        }
        public Int64 SetPayedWallet
        {

            set
            {
                ME.Q_Add(@"INSERT INTO   Wallet(MID, Income, DateP, ForType, Perecent, PayType)
                                    VALUES        (@MID, @Income, @DateP, 3, 0, 1)");
                ME.ParamAdd("@MID", UserName[1]);
                ME.ParamAdd("@Income", value.ToString());
                ME.ParamAdd("@DateP", Constants.CurDate());
                if (ME.Run() == "runed")
                    Control = true;
                else
                    Control = false;
            }
        }
        public bool GetControl
        {
            get
            {
                return Control;
            }
        }
        public double GetUserDiscount
        {
            get
            {
                double disc = 1/5;
                ME.Q_Add("SELECT [RCardType]  FROM[RozCards] WHERE Status = 1 AND MID = @MID");
                ME.ParamAdd("@MID", UserName[1]);
                string rtr = ME.GetF2Str();
                switch(rtr)
                {
                    case "1":
                        disc = (double)1/5;
                        break;
                    case "3":
                        disc = (double)2 /5;
                        break;
                    case "5":
                        disc = (double)3 /5;
                        break;
                    case "7":
                        disc = (double)1;
                        break;
                }
                return disc;
            }
        }
    }
}