#
# Booking Front-end Extension
#
module YsdPluginFrontend

  class FrontendExtension < Plugins::ViewListener


    # ========= Installation =================

    # 
    # Install the plugin
    #
    def install(context={})

        SystemConfiguration::Variable.first_or_create({:name => 'frontend.skin'},
          {:value => 'rentit', 
           :description => 'front end skin', 
           :module => :tryton_integration})

    end
  end
end          