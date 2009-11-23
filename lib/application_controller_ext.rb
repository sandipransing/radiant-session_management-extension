module SessionManagementExt
  module ApplicationControllerExt
	  def self.included(base)
	    base.class_eval do
	      before_filter :track_session
	    end
	  end
	  
	  def current_site
            Page.current_site
          end
	  
	  def track_session
    
	    #**"Hello from Session tracker !!!"**
	    
	    #TODO: location track
	    # It can be delayed task
	    #sudo gem install geoip_city -- --with-geoip-dir=/opt/GeoIP
	    # require 'geoip_city'
	    # g = GeoIPCity::Database.new('/opt/GeoIP/share/GeoIP/GeoLiteCity.dat')
	    # res = g.look_up('201.231.22.125')
	    # {:latitude=>-33.13330078125, :country_code3=>"ARG", :longitude=>-64.3499984741211, :city=>"Río Cuarto", :country_name=>"Argentina", :country_code=>"AR", :region=>"05"}

	    UserSessionInfo.create( :user_id => current_user ? current_user.id : nil,
      :site_id => current_site ? current_site.id : nil,
      :ipaddress => request.remote_ip,
      :page_url =>  "http://#{request.env["HTTP_HOST"]}#{request.request_uri}",
      :session => request.session_options[:id] )
	  end
  end
end
