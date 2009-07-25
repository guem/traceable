class TrunksController < ApplicationController
  require 'xmlrpc/client'
  require 'rubygems'
  require 'geokit'

  verify :except => ["lookup_trunk", "show_google_map"],
    :session => :dataentry,
    :add_flash => {:error => "You are not signed in as 'dataentry'"},
    :redirect_to => {:controller => "authentication", :action => "login"}

  before_filter :find_trunk, :only => [:edit, :update, :show, :destroy]

  def find_trunk
    @trunk = Trunk.find(params[:id])
  end

  def index
    @trunks = Trunk.find(:all)
    @trunk = Trunk.new
  end

  def edit
  end

  def new
    @trunk = Trunk.new
  end

  def show
    @process_trunks = @trunk.process_trunks
    @process_trunk = ProcessTrunk.new(:trunk => @trunk)

    respond_to do |format|
      format.html
      format.xml {render :xml => @trunk.to_xml(
               :only => [:traceable, :kind, :location])}
    end
  end

  def create
    @trunk = Trunk.new(params[:trunk])
    if @trunk.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Trunk has been created sucessfully"
          redirect_to trunks_path
        end
        format.js
      end
    else
      flash[:error] = "Trunk could not be saved"
      #redirect_to trunks_path
      render :action => "new"
    end
  end

  def destroy
    @trunk.destroy
    flash[:notice] = "Trunk has been deleted successfully"
    redirect_to trunks_path
  end

  def update
    if @trunk.update_attributes(params[:trunk])
      flash[:notice] = "Trunk has been saved sucessfully"
      redirect_to trunks_path
    else
      render :action => "edit"
    end
  end

  def lookup_trunk
  end

  def show_google_map
    code = params[:input_traceable_code]
    unless (code =~ /\d{8}/)
      flash[:error] = "TraceableTree code is composed of 8 numerals"
      redirect_to lookup_trunk_path
      return
    end
    #begin
      @trunk = Trunk.find_by_traceable(code)
      if @trunk == nil then
    #rescue
        flash[:error] = "TraceableTree could not be found by this code"
        redirect_to lookup_trunk_path
        return
      end
    #else
      latitude = @trunk.loc_lat
      longitude = @trunk.loc_lon
      @location = Geokit::LatLng.new(latitude, longitude)
      @marker_string = "The origin of your <br/>Wood4Life soustainable product is here" + "<br />Traceable: " + @trunk.traceable + "<br />" + "Latitude: " + @trunk.loc_lat + "<br />" + "Longitude: " + @trunk.loc_lon
    #end
  end

end
