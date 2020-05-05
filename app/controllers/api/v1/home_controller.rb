class Api::V1::HomeController < ApplicationController
    def index
        render JSON: {"Message": "hello"}
    end
end 