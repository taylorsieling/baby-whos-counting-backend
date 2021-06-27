class Api::V1::AuthController < ApplicationController
  
    def spotify_request

        url = "https://accounts.spotify.com/authorize/"

        query_params = {
            client_id: ENV["CLIENT_ID"],
            response_type: "code",
            redirect_uri: ENV['REDIRECT_URI'],
            scope: "user-top-read 
                playlist-modify-public 
                playlist-modify-private 
                user-read-email 
                user-read-private",
            show_dialog: true
        }
      
      redirect_to "#{url}?#{query_params.to_query}"
    end
  
end