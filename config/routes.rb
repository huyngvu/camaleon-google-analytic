Rails.application.routes.draw do

  scope 'admin', as: 'admin' do
    namespace 'plugins' do
      namespace 'camaleon_google_analytic' do
        get 'settings' => 'admin#settings'

        post 'settings' => 'admin#save_settings'
      end
    end
  end

end

