class Api::V1::AuthController < ApplicationController
    include CurrentUserConcern
    # def create
    #     user = User.find_by(:email => params[:email])
    #     byebug
    #     if user && user.authenticate(params[:password])
    #     created_jwt = issue_token({id: user.id})
    #     cookies.signed[:jwt] = {value:  created_jwt, httponly: true}
    #     render json: {username: user.username}
    #     else
    #     render json: {
    #         error: 'Username or password incorrect'
    #     }, status: 404
    #     end
    # end
    def create
        user = User
            .find_by(:email => params[:email])
            .try(:authenticate, params[:password])
        byebug
        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user,
                session: session
            }
        else
            render json: {status: 401}
        end
    end

    def get
        render json: {message: "my stuff"}    
    end
end