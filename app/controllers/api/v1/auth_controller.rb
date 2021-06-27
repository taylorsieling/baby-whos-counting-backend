class Api::V1::AuthController < ApplicationController

    skip_before_action :authorized, only: [:spotify_request]
  
    def spotify_request
      # User has clicked "login" button - assemble GET request to Spotify to have
      # User authorizes application
      query_params = {
        client_id: ENV['CLIENT_ID'],
        response_type: "code",
        redirect_uri: ENV['REDIRECT_URI'],
        scope: "user-top-read playlist-modify-public playlist-modify-private user-read-email user-read-private",
        show_dialog: true
      }
      url = "https://accounts.spotify.com/authorize/"
      # redirects user's browser to Spotify's authorization page, which details scope
      redirect_to "#{url}?#{query_params.to_query}"
    end
  
    def create
      # Placeholder
      # NOTE: tokens are created and issued in users#create, due to how data is
      # handled from Spotify and restrictions on internal redirects with post actions
    end
  
    def show
    # if application_controller#authorized is successful, return data for user
      # render json: current_user
      render json: {username: current_user.username,
                    spotify_url: current_user.spotify_url,
                    profile_img_url: current_user.profile_img_url}
    end
  
  end