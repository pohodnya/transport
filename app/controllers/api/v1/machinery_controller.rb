module Api
  module V1
    class MachineryController < ActionController::Base
      respond_to :json

      def index
        respond_with Machinery.all
      end
    end
  end
end

