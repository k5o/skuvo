class StaticPagesController < ApplicationController
  def index
  	if current_user
  		@user = User.find(current_user.id)
  	else
  		@user = User.new
  	end
  end

  def about
  end

  def terms
  end

  def demo
  end
end