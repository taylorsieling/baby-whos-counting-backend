class ApplicationController < ActionController::API
    def issue_token(payload)
        JWT.encode(payload, ENV["JWT_SECRET"])
        byebug
    end
  
    def decode(jwt_token)
        JWT.decode(jwt_token, ENV["JWT_SECRET"])
    end
end