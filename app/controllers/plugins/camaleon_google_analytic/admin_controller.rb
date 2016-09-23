class Plugins::CamaleonGoogleAnalytic::AdminController < CamaleonCms::Apps::PluginsAdminController
  include Plugins::CamaleonGoogleAnalytic::MainHelper

  def settings
    @google_analytic = current_site.get_meta('camaleon_google_analytic_config')
  end

  def save_settings
    current_site.set_meta('camaleon_google_analytic_config',
                          {code: params[:camaleon_google_analytic][:code]
                          })
    flash[:notice] = "#{t('plugin.camaleon_google_analytic.messages.settings_saved')}"
    redirect_to action: :settings
  end
end
