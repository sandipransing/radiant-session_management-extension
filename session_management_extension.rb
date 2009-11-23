# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'
require_dependency "#{File.expand_path(File.dirname(__FILE__))}/lib/application_controller_ext"

class SessionManagementExtension < Radiant::Extension
  version "1.0"
  description "Tracks visitor information (i.e. ip, session, page_url, site)"
  url "http://github.com/sandipransing/radiant-session_management-extension"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :session_management
  #   end
  # end
  
  def activate
    # admin.tabs.add "Session Management", "/admin/session_management", :after => "Layouts", :visibility => [:all]
    ApplicationController.send(:include, SessionManagementExt::ApplicationControllerExt)
  end
  
  def deactivate
    # admin.tabs.remove "Session Management"
  end
  
end
