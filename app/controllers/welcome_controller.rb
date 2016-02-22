class WelcomeController < ApplicationController
  before_action :check_authentication_error, only: :callbacks

  def callbacks
    response = request_access_token(params[:code])

    flash[:notice] = if response.error
      "#{params[:error_reason]} - #{params[:error_description]}"
    else
      session[:access_token] = response.access_token
      session[:user] = response.user
      "Welcome to PulseSearch !"
    end
    redirect_to users_path
  end

  private

  def check_authentication_error
    if params[:error].present?
      flash[:notice] = "#{params[:error_reason]} - #{params[:error_description]}"
      redirect_to :root
    end
  end


  # response structure :
  #
  # {
  #   "access_token" => "2412559982.779b6b3.7e1c1ec4df1840ecb769d796c4af3fdd",
  #         "user" => {
  #            "username" => "ketan37.dm",
  #                 "bio" => "",
  #             "website" => "",
  #     "profile_picture" => "http://scontent.cdninstagram.com/t51.2885-19/11906329_960233084022564_1448528159_a.jpg",
  #           "full_name" => "",
  #                  "id" => "2412559982"
  # }
  # }
  def request_access_token(code)
    Instagram.get_access_token( code,
      redirect_uri: Instagram.redirect_uri,
      client_secret: Instagram.client_secret
    )
  end
end
