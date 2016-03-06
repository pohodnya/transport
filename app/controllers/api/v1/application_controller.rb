module Api
  module V1
    class ApplicationController < ActionController::Base
      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.
      protect_from_forgery with: :exception
      respond_to :json

      def index
        @machinerys = Machinery.all
        respond_with @machinerys
      end
    end
  end
end

