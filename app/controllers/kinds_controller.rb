class KindsController < ApplicationController

  verify :session => :admin,
    :add_flash => {:error => "You are not signed in as 'admin'"},
    :redirect_to => {:controller => "authentication", :action => "login"}

  before_filter :find_kind, :only => [:edit, :update, :show, :destroy]

  def find_kind
    @kind = Kind.find(params[:id])
  end

  # GET /kinds
  # GET /kinds.xml
  def index
    @kinds = Kind.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kinds }
    end
  end

  # GET /kinds/1
  # GET /kinds/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kind }
    end
  end

  # GET /kinds/new
  # GET /kinds/new.xml
  def new
    @kind = Kind.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kind }
    end
  end

  # GET /kinds/1/edit
  def edit
  end

  # POST /kinds
  # POST /kinds.xml
  def create
    @kind = Kind.new(params[:kind])

    respond_to do |format|
      if @kind.save
        flash[:notice] = 'Species was successfully created.'
        format.html { redirect_to kinds_path }
        format.xml  { render :xml => @kind, :status => :created, :location => @kind }
      else
        flash[:error] = "Species could not be saved"
        format.html do
          render :action => "new"
        end
        format.xml  do
          render :xml => @kind.errors, :status => :unprocessable_entity
        end
      end
      @kind.picture.styles
    end
  end

  # PUT /kinds/1
  # PUT /kinds/1.xml
  def update
    respond_to do |format|
      if @kind.update_attributes(params[:kind])
        flash[:notice] = 'Species was successfully updated.'
        format.html { redirect_to kinds_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kind.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kinds/1
  # DELETE /kinds/1.xml
  def destroy
    if !@kind.trunks.empty?
      flash[:error] = "There are still " + @kind.trunks.size.to_s + " trunks referencing this species. Remove all referencing trunks first!"
      redirect_to kinds_path
      return
    end
    @kind.destroy
    flash[:notice] = "Trunk has been successfully deleted"

    respond_to do |format|
      format.html { redirect_to kinds_path }
      format.xml  { head :ok }
    end
  end

end
