using System;
using System.Web;
using System.Web.UI;

namespace Impersonate
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                labelUser.Text = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
                labelVar.Text = HttpContext.Current.Request.ServerVariables["LOGON_USER"];
            }
        }
    }
}
