class UsersController < ApplicationController
  before_action :get_instagram_client
  before_action :set_user

  def index
    puts session[:access_token]
    @media = @client.media_popular(access_token: session[:access_token])
  end

  private

  def get_instagram_client
    @client = Instagram.client(access_token: session[:access_token])
  end

  def set_user
    @user = session[:user]
  end
end
