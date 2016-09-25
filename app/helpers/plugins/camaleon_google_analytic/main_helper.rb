module Plugins::CamaleonGoogleAnalytic::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  # here all actions on going to active
  # you can run sql commands like this:
  # results = ActiveRecord::Base.connection.execute(query);
  # plugin: plugin model
  def camaleon_google_analytic_on_active(plugin)
    current_site.set_meta('camaleon_google_analytic_config',
                          {google_analytics_code: 'UA-XXXXXX-X'
                          })
  end

  # here all actions on going to inactive
  # plugin: plugin model
  def camaleon_google_analytic_on_inactive(plugin)
  end

  # here all actions to upgrade for a new version
  # plugin: plugin model
  def camaleon_google_analytic_on_upgrade(plugin)
  end

  def google_analytic_front_before_load
    camaleon_google_analytics_meta = current_site.get_meta('camaleon_google_analytic_config')
    if camaleon_google_analytics_meta.has_key? :code
      camaleon_google_analytics_code = camaleon_google_analytics_meta[:code]
      #append_pre_asset_content("<script>window.GAID='#{camaleon_google_analytics_code}';</script>")
      #append_asset_libraries({camaleon_google_analytic: {js: [plugin_gem_asset('google_analytics')]}})
      append_pre_asset_content("<script>
                                  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                                  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                                  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                                  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
                                  ga('create', '#{camaleon_google_analytics_code}', 'auto');
                                  ga('send', 'pageview');
                                </script>")
    end
  end

  def google_analytic_admin_before_load
    google_analytic_menu = { icon: "google", title: "Google Analytic", url: admin_plugins_camaleon_google_analytic_settings_path }
    admin_menu_append_menu_item('settings', google_analytic_menu)
  end

  def google_analytic_plugin_options(arg)
    arg[:links] << link_to(t('plugin.camaleon_google_analytic.settings.link_name'), admin_plugins_camaleon_google_analytic_settings_path)
  end
end
