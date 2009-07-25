ActionController::Routing::Routes.draw do |map|

  map.resources :kinds
  map.resources :trunks
  map.resources :process_trunks
  
  # The priority is based upon order of creation: first created -> highest priority.
  map.root :controller => "trunks", :action => "lookup_trunk"

  map.login 'login', :controller => "authentication", :action => "login"
  map.logout 'logout', :controller => "authentication", :action => "logout"
  map.check 'check', :controller => "authentication", :action => "check"
  # map.lookup 'lookup', :controller => "trunks", :action => "lookup_geocodes"
  map.maps 'maps', :controller => "trunks", :action => "show_google_map"
  map.lookup_trunk 'lookup_trunk', :controller => "trunks", :action => "lookup_trunk"
  map.lookup_address 'lookup_address', :controller => "lookup", :action => "lookup_address"
end
