class CompaniesController < ApplicationController
  before_filter :authenticate, :only => [:index, :show, :edit, :update]
  # GET /companies
  def index
    @companies = current_user.companies
  end

  # GET /companies/1
  def show
    @company = current_user.companies.find(params[:id])
  end

  # GET /companies/new
  def new
    @company = current_user.companies.new
    @company.build_address
  end

  # GET /companies/1/edit
  def edit
    @company = current_user.companies.find(params[:id], :include => :address) 
  end

  # POST /companies
  def create
    @company = current_user.companies.new(params[:company])

    if @company.save
      flash[:notice] = 'Company was successfully created.'
      redirect_to(user_companies_url)
    else
      render :action => "new"
    end
  end

  # PUT /companies/1
  def update
    @company = current_user.companies.find(params[:id])

    if @company.update_attributes(params[:company])
      flash[:notice] = 'Company was successfully updated.'
      redirect_to(user_companies_url)
    else
      render :action => "edit"
    end
  end

  # DELETE /companies/1
  def destroy
    @company = current_user.companies.find(params[:id])
    @company.destroy
    redirect_to(user_companies_url)
  end
end