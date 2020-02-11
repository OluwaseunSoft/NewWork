using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StyleMeal.Startup))]
namespace StyleMeal
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
