class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :show, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy

  def index
    @title = "All companies"
    @companies = current_user.companies #.paginate(:page => params[:page])
  end

  def show
    @user = current_user
    @title = @user.name
  end

  def new
    @title = "Sign up"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @title = "Edit user"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile updated"
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    flash[:notice] = "User #{user.name} destroyed"
    user.destroy
    redirect_to users_path
  end

  private



    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
