require 'rest_client'

class Api::V1::UsersController < ApplicationController
  
    # GET /users
    def index
      @users = User.all
      render json: @users
    end
  
    # GET /users/1
    def show
      @user = User.find_by(id: params[:id])
    end
  
    # POST /users
    def create

      # Request Access Tokens
      body = {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: ENV['REDIRECT_URI'],
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV["CLIENT_SECRET"]
      }

      auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)
      auth_params = JSON.parse(auth_response.body)

      # Request User Profile Information
      
      header = {
        Authorization: "Bearer #{auth_params["access_token"]}"
      }

      user_response = RestClient.get("https://api.spotify.com/v1/me", header)
      user_params = JSON.parse(user_response.body)

      @user = User.find_or_create_by(
        username: user_params["display_name"],
        spotify_url: user_params["external_urls"]["spotify"],
        href: user_params["href"],
        uri: user_params["uri"]
        )

      image = user_params["images"][0] ? user_params["images"][0]["url"] : nil
      @user.update(profile_img_url: image)

      if @user.access_token_expired?
        @user.refresh_access_token
      else
        @user.update(
          access_token: auth_params["access_token"], 
          refresh_token: auth_params["refresh_token"]
        )
      end

      redirect_to "http://localhost:3000/dashboard"
      

    end
  
    # PATCH/PUT /users/1
    def update
      @user = User.find_by(id: params[:id])
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1
    def destroy
      @user = User.find_by(id: params[:id])
      @user.destroy
    end
  
    private

      # def set_user
      #   @user = user.find(params[:id])
      # end
  
      # Only allow a list of trusted parameters through.
      def user_params 
        params.require(:user).permit(:username, :access_token, :refresh_token, :spotify_url, :profile_img_url, :href, :uri)
    end

end