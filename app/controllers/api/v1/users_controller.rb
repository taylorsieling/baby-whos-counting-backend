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

      auth_params = SpotifyApiAdapter.login(params[:code])
      user_data = SpotifyApiAdapter.getUserData(auth_params["access_token"])
      @user = User.find_or_create_by(user_params(user_data))
      img_url = user_data["images"][0] ? user_data["images"][0]["url"] : nil
      encodedAccess = issue_token({token: auth_params["access_token"]})
      encodedRefresh = issue_token({token: auth_params["refresh_token"]})

      
      @user.update(profile_img_url: img_url,access_token: encodedAccess,refresh_token: encodedRefresh)
      
      render json: @user.to_json(:except => [:access_token, :refresh_token, :created_at, :updated_at])

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
    def user_params(user_data)
      params = {
        username: user_data["display_name"],
        spotify_id: user_data["id"],
        spotify_url: user_data["external_urls"]["spotify"],
        email: user_data["email"]
      }
    end

end