module Api
  module V1
    class MachineryTypesController < ApplicationController
      respond_to :json

      def index
        @machinery_types = MachineryType.all
        respond_with @machinery_types
      end
    end
  end
end

