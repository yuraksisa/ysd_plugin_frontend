module YsdPluginFrontend
  module SinatraAdmin
    def self.registered(app)

      # Add the local folders to the views and translations
      app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'views')))
      app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'i18n')))

      #
      # Select the front-end theme
      #
      app.get '/admin/booking/config/theme', :allowed_usergroups => ['booking_manager', 'staff'] do

        @current_theme = SystemConfiguration::Variable.get_value('frontend.skin','rentit')
        @themes = Plugins::Plugin.plugin_invoke_all('frontend_skin',
                                                    {:app => self}).inject({}) do |result, item|
                    result.store(item,"/#{item}/img/theme-preview.jpg")
                    result
        end

        
        p "themes: #{@themes.inspect}"
        status 200
        load_page :choose_theme

      end

    end
  end
end