class ClientsController < ApplicationController
  before_filter :authenticate, :only => [:index, :show, :edit, :update]
  # GET /clients
  # GET /clients.xml

  def current_company
    @current_company = current_user.companies.find(params[:company_id])
  end

  def clients
    current_company.clients
  end

  def index
    @clients = clients
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = clients.find(params[:id])
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = clients.new
    @client.build_address
  end

  # GET /clients/1/edit
  def edit
    @client = current_company.clients.find(params[:id], :include => :address)
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = clients.new(params[:client])

    if @client.save
      flash[:notice] = 'Customer was successfully created.'
      redirect_to(user_company_clients_url(current_company))
    else
      render :action => "new"
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = clients.find(params[:id])

    if @client.update_attributes(params[:client])
      flash[:notice] = 'Client was successfully updated.'
      redirect_to(user_company_clients_url(current_company))
    else
      render :action => "edit"
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = clients.find(params[:id])
    @client.destroy
    redirect_to(user_company_clients_url(current_company))
  end
end
