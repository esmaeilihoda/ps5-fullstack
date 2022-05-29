using Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop.Class;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Microsoft.AspNet.FriendlyUrls;

namespace Shop.Shop
{
    public partial class product : System.Web.UI.Page
    {
        Model.EXEQ ME = new Model.EXEQ();
        Model.SqlFuncTrans MS = new Model.SqlFuncTrans();
        ShowMessage SMM = new ShowMessage();
        protected void Page_Load(object sender, EventArgs e)
        {

            // IList<string> ids = Request.GetFriendlyUrlSegments();
          //   Response.Write(Constants.UrlParamValue(Request.GetFriendlyUrlSegments(), "cat"));
        }

        protected void ProductProperty_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ME.Q_Add(@"SELECT   PName, Id
                                                              FROM            Shop_Prop_Head WHERE Shop_Prop_Head.Id
                                                      IN (SELECT         ParentId
                                                                  FROM            Shop_Property WHERE Shop_Property.Id 
                                                                IN(SELECT    PropIdd   FROM     ShopPValue WHERE Pid = @Pid AND State=1)  )   ");
            ME.ParamAdd("@Pid", Request.QueryString["PID"].ToString());

            ProductProperty.DataSource = ME._GetDataTable();
        }

        protected void ProductProperty_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                
                    GridDataItem item = (GridDataItem)e.Item;
                    string propid = item["Id"].Text;
                    DropDownList PropSelect = (DropDownList)item.FindControl("propsel");
                    ME.Q_Add(@"SELECT       '0' AS Id, 'انتخاب' PName UNION
                               SELECT        Id, PName
                                 FROM            Shop_Property WHERE ParentId = @ParentId AND Id IN(SELECT        PropIdd
                                                                    FROM            ShopPValue WHERE  PId = @PId AND State=1 ) ");
                    ME.ParamAdd("@ParentId", propid);
                    ME.ParamAdd("@PId", Request.QueryString["PID"]);
                    PropSelect.DataTextField = "PName";
                    PropSelect.DataValueField = "Id";
                    PropSelect.DataSource = ME._GetDataTable();
                    PropSelect.DataBind();
               
            }
        }
        protected void ProductProperty_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            
        }

        protected void propsel_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Ppsummer = 0;
            foreach (GridDataItem GDI in ProductProperty.Items)
            {
                DropDownList PropSelect = (DropDownList)GDI.FindControl("propsel");
                if(PropSelect.SelectedValue != "0")
                {
                    ME.Q_Add(@"SELECT    PValue 
                                             FROM            ShopPValue WHERE Pid = @Pid AND PropIdd = @PropIdd  ");
                    ME.ParamAdd("@Pid", Request.QueryString["PID"]);
                    ME.ParamAdd("@PropIdd", PropSelect.SelectedValue);
                    Ppsummer += int.Parse((ME.GetF2Str()));
                }
                
            }
            if (Ppsummer != 0)
            {
                ppvalueshower.InnerText = "ارزش ویژگی " + Ppsummer.ToString();
                ppvalueshower.Visible = true;
            }
            else
                ppvalueshower.Visible = false;
        }

        protected void AddTCart_Click(object sender, EventArgs e)
        {
            ME.Q_Add(@"SELECT        COUNT(*) 
                          FROM  Shop_Products WHERE SHave = 1 AND Byable =1 AND CStatus =1 AND PId = @PId ");
            ME.ParamAdd("@PId", Request.QueryString["PID"]);
            if(ME.Counter() != 1)
            {
                SMM.CreateMessageAlert("محصول موجودی ندارد یا قابل خرید نیست", sender);
                return;
            }
            string props = string.Empty;
            int Ppsummer = 0;
            foreach (GridDataItem GDI in ProductProperty.Items)
            {
                DropDownList PropSelect = (DropDownList)GDI.FindControl("propsel");
                if (PropSelect.SelectedValue == "0")
                {
                    SMM.CreateMessageAlert("ویژگی را انتخاب کنید!!", sender);
                    return;
                }
                else
                    props += PropSelect.SelectedValue + ",";
                ME.Q_Add(@"SELECT    PValue 
                                             FROM            ShopPValue WHERE Pid = @Pid AND PropIdd = @PropIdd AND State=1 ");
                ME.ParamAdd("@Pid", Request.QueryString["PID"]);
                ME.ParamAdd("@PropIdd", PropSelect.SelectedValue);
                Ppsummer += int.Parse(ME.GetF2Str());

            }
            if (props.Length > 0)
                props = props.Substring(0, props.Length - 1);
            MS.T_Start();
            for (int i = 0; i < int.Parse(count.Value); i++)
            {
                MS.ParamAdd("@UserCookie", Class.CookieControl.GetCookie[0]);
                MS.ParamAdd("@Property", props);
                MS.ParamAdd("@propval", Ppsummer);
                MS.ParamAdd("@PId", Request.QueryString["PID"]);
                MS.Q_Add(@"INSERT  INTO    Shop_By_Bascket(UserCookie, PId, Type, Property, propval) 
                                   VALUES        (@UserCookie, @PId, 0, @Property, @propval)");
            }
            if (MS.commit())
            {
                SMM.CreateMessageAlert("محصول به سبدخرید شما اضافه شد", sender);
                //SMM.RunAnyScript("addtocart(0)", sender);
            }
            else
                SMM.CreateMessageAlert("ERR:0x788224", sender);

        }
    }
}