require 'ysd-plugins' unless defined?Plugins::Plugin

Plugins::SinatraAppPlugin.register :frontend do

  name=        'frontend'
  author=      'yurak sisa'
  description= 'tryton'
  version=     '0.1'
  hooker YsdPluginFrontend::FrontendExtension
  sinatra_extension YsdPluginFrontend::SinatraAdmin

end