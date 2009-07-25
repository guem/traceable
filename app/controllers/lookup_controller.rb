class LookupController < ApplicationController
  require 'xmlrpc/client'
  require 'rubygems'
  require 'geokit'

  def lookup_traceable
    # Das ist im trunks-controller implementiert, kann
    # spaeter hierherziehen. Hier muss nichts stehen, keine
    # Funktionalitaet. Aufruf von #show_map_for_traceable,
    # die dann #check_traceable und #show_map aufruft
  end

  def show_map_for_traceable
    code = params[:input_traceable_code]
    trunk = check_traceable(code) #Wie gehts im Fehlerfall?
    show_map(trunk.latitude, trunk.longitude)
  end

  def lookup_address
  end

  def show_map_for_address
    address_string = params[:input_address_string]
    # your list of places. In a real app, this would come from the database,
    # and have more robust descriptions
    #places = [
    #  {:address=>'555 Irving, San Francisco, CA',:description=>'Irving'},
    #  {:address=>'1401 Valencia St, San Francisco, CA',:description=>'Valencia'},
    # ]

    # this loop will do the geo lookup for each place
    #places.each_with_index do |place,index|
      # get the geocode by calling our own get_geocode(address) method
    #  geocode = get_geocode place[:address]
    geocode = get_geocode(address_string)

    # Fuer geocode gibt vielleicht ein geeignetes
    # Objekt, mit lat und lon, das genau diese
    # Repraesentation darstellt, in geokit und google-geo
    # nachschauen, was es dort gibt!

      # geo_code is now a hash with keys :latitude and :longitude
      # place these values back into our "database" (array of hashes)
      #place[:latitude]=geocode[:latitude]
      #place[:longitude]=geocode[:longitude]

    #end

    #place the result in the session so we can use it for display
    # session[:str] = places

    #let the user know the lookup went ok
    #render :text=> 'Looked up the geocodes for '+places.length.to_s+
    #' address and stored the result in the session . . .'
    show_map(geocode[:latitude], geocode[:longitude])
  end

  private
  def show_map(latitude, longitude)
    #Hier müssen noch die Parameter uebergeben werden
    latitude = @trunk.loc_lat
    longitude = @trunk.loc_lon
    @location = Geokit::LatLng.new(latitude, longitude)
    @marker_string = "The origin of your <br/>Wood4Life soustainable product is here"
        + "<br />Traceable: " + @trunk.traceable 
        + "<br />" + "Latitude: " + @trunk.loc_lat
        + "<br />" + "Longitude: " + @trunk.loc_lon
  end

  def check_traceable(code)
    unless (code =~ /\d{8}/)
      flash[:error] = "TraceableTree code is composed of 8 numerals"
      redirect_to lookup_trunk_path
      return :success=> false
    end
      @trunk = Trunk.find_by_traceable(code)
      if @trunk == nil then
        flash[:error] = "TraceableTree could not be found for this code"
        redirect_to lookup_trunk_path
        return :success => false
      end
      return :sucess => true,
          :trunk => @trunk
  end

  def get_geocode(address)
    logger.debug 'starting geocoder call for address: '+address
    # this is where we call the geocoding web service
    server = XMLRPC::Client.new2('http://rpc.geocoder.us/service/xmlrpc')
    result = server.call2('geocode', address)
    logger.debug "Geocode call: "+result.inspect

    return {:success=> true,
      :latitude => result[1][0]['lat'],
      :longitude => result[1][0]['long']}
  end

end
