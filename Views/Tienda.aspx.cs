using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using c = Library.Controller;

namespace Library.Views
{
    public partial class Tienda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            c.Book bookController = new c.Book();

            int id = Convert.ToInt16(Request.QueryString["id"]);

            repBook.DataSource = bookController.GetBook(id);
            repBook.DataBind();
        }

        protected void btnSave_ServerClick(object sender, EventArgs e)
        {

        }
    }
}