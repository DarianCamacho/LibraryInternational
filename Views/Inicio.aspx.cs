using Library.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using c = Library.Controller;

namespace Library.Views
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogged();

                string session = Request.QueryString["session"];

                if (session == "false")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('Login','You must login to access this page')", true);
                }

                c.Book resortController = new c.Book();

                repResorts.DataSource = resortController.GetResorts();
                repResorts.DataBind();
            }
        }

        protected void btnLogin_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            c.Login loginController = new c.Login();

            LoginResponsePayload loginInfo = loginController.SignInWithPassword(new Model.LoginResponsePayload
            {
                email = txtEmail.Value,
                password = txtPassword.Value
            });

            if (loginInfo != null && loginInfo.registered)
            {
                Session["loginInfo"] = loginInfo;
                msg = "Welcome " + txtEmail.Value;
                IsLogged();
            }
            else
            {
                msg = "Incorrect credentials";
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('Login','" + msg + "')", true);
        }

        private void IsLogged()
        {
            if (Session["loginInfo"] != null)
            {
                m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];

                lblName.InnerText = session.email;
                cardLogin.Attributes.Add("hidden", "hidden");
                cardUser.Attributes.Remove("hidden");
                tabBookings.Attributes.Remove("hidden");
            }
        }

        private void IsLogOut()
        {
            if (Session["loginInfo"] == null)
            {
                cardUser.Attributes.Add("hidden", "hidden");
                cardLogin.Attributes.Remove("hidden");
                tabBookings.Attributes.Add("hidden", "hidden");
            }
        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session.Clear();
            IsLogOut();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('Login','Thank you for visiting Booking.com')", true);
        }

        //protected void Unnamed_ServerClick(object sender, EventArgs e)
        //{
        //    var button = (HtmlButton)sender;

        //    var id = button.Attributes["dataId"];
        //}
    }
}