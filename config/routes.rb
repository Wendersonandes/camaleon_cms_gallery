Rails.application.routes.draw do


    scope PluginRoutes.system_info["relative_url_root"] do
      scope '(:locale)', locale: /#{PluginRoutes.all_locales}/, :defaults => {  } do
        # frontend
        namespace :plugins do
          namespace 'gallery' do
            get 'index' => 'front#index'
          end
        end
      end

      #Admin Panel
      scope 'admin', as: 'admin' do
        namespace 'plugins' do
          namespace 'gallery' do
            get 'index' => 'admin#index'
            get 'settings' => 'admin/settings#index'
            resources :galleries, controller: "admin/galleries"
          end
        end
      end

      # main routes
      #scope 'gallery', module: 'plugins/gallery/', as: 'gallery' do
      #  Here my routes for main routes
      #end
    end
  end
