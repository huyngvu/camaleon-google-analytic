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
      append_pre_asset_content("<script>window.GAID='#{camaleon_google_analytics_code}';</script>")
      append_asset_libraries({camaleon_google_analytic: {js: [plugin_gem_asset('google_analytics')]}})
    end
  end

  def google_analytic_plugin_options(arg)
    arg[:links] << link_to(t('plugin.camaleon_google_analytic.settings.link_name'), admin_plugins_camaleon_google_analytic_settings_path)
  end
end
