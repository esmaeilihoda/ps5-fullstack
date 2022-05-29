using Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zarinpal;

namespace Shop.Shop
{
    public partial class ShowOrderItem : System.Web.UI.Page
    {
        string[] Userlogin = null;


        Model.EXEQ ME = new Model.EXEQ();
        ShowMessage SMM = new ShowMessage();

        protected DataTable dtsh = null;
        protected string OID;

        protected void Page_Load(object sender, EventArgs e)
        {
            Model.EXEQ ME = new Model.EXEQ();


            Userlogin = (string[])Session["Login"];



            if (Userlogin == null)
            {
                Response.Redirect("../Account/Login.aspx?ComeBack=~/Shop/Factors.aspx");
            }




            if (!IsPostBack && (Userlogin != null))
            {
                ME.Q_Add("SELECT Name, Family, Address, City, PostalCode, Email, Mobile, State FROM Marketers WHERE Id = @Id ");
                ME.ParamAdd("@Id", Userlogin[1]);
                DataView MSS = ME._GetDataView();

                name.Value = MSS[0]["Name"].ToString();
                Family.Value = MSS[0]["Family"].ToString();
                Address.Value = MSS[0]["Address"].ToString();
                City.Value = MSS[0]["City"].ToString();
                Email.Value = MSS[0]["Email"].ToString();
                Mobile.Value = MSS[0]["Mobile"].ToString();
                PostalCode.Value = MSS[0]["PostalCode"].ToString();
                state.Value = MSS[0]["State"].ToString();
            }

            OID = Request.QueryString["oid"];
            if (OID != null)
            {
                ME.Q_Add(@"--showorder
                        SELECT SOI.PId
                            ,(SELECT PName FROM Shop_Products SP WHERE SP.PId=SOI.PId) AS PName
                            ,(SUM(SOI.Propval)+ SUM(AMT)) AS NPrice
                            ,COUNT(SOI.PId) AS CNT
                            ,(SELECT ImageUrl FROM Shop_Products SP WHERE SP.PId=SOI.PId) AS imageurl
                            ,( SELECT stuff( ( SELECT '
'+SPH.PName +' : ' +sp.PName FROM  Shop_Property sp  
						LEFT JOIN Shop_Prop_Head SPH ON sp.ParentId=SPH.Id
						WHERE  SP.Id  IN (SELECT  item FROM dbo.StringSplit(SOI.Property ,',')) FOR XML PATH('')),7,1,'')) AS Property	
                    FROM Shop_OrdersItem SOI
                    WHERE  MID = @MId AND OId=@FId 
                    GROUP BY SOI.PId,SOI.Property
                    ORDER BY SOI.PId ASC");

                ME.ParamAdd("@FId", OID);
                ME.ParamAdd("@MId", Userlogin[1]);
                dtsh = ME._GetDataTable();

                double sumtp = 0, maliat = 0;
                for (int i = 0; i < dtsh.Rows.Count; i++)
                {
                    sumtp += double.Parse(dtsh.Rows[i]["NPrice"].ToString());

                }
                maliat = sumtp * 9 / 100;
                maliat = Math.Round(maliat);
                SMM.RunAnyScript("$('.sumPrice').text('" + sumtp.ToString() + " تومان');", sender);
                SMM.RunAnyScript("$('.maliat').text('" + maliat.ToString() + " تومان');", sender);

                ME.Q_Add("SELECT AMT, ISNULL(AmtPercentDisc,0) AS AmtPercentDisc  FROM ShopOrders WHERE Id=@FId AND MID=@MId");
                ME.ParamAdd("@FId", OID);
                ME.ParamAdd("@MId", Userlogin[1]);

                DataView Dv = ME._GetDataView();
                SMM.RunAnyScript("$('.copen ').text('" + Dv[0]["AmtPercentDisc"].ToString() + " تومان');", sender);
                SMM.RunAnyScript("$('.totalsum ').text('" + Dv[0]["AMT"].ToString() + " تومان');", sender);

            }









        }


    }
}