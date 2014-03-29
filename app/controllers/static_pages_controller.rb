class StaticPagesController < ApplicationController
  def index
    current_user ? @user = User.find(current_user.id) : @user = User.new
  end

  def about
  end

  def terms
  end

  def demo
    @demo_user = User.find(1).username
  end
end