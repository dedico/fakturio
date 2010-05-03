class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to current_user
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end
end
