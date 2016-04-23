module Api
  module V1
    class MachineriesController < ActionController::Base
      respond_to :json

      def index
        @machineries = Machinery.find(machinery_params)
        respond_with @machineries
      end

      def show
        @machinery = Machinery.find params[:id]
        respond_with @machinery
      end

      def create
        @machinery = Machinery.create machinery_params
        if @machinery
          respond_to do |format|
            format.json {render json: @machinery, status: :ok, location: false}
          end
        else
          respond_with @machinery, status: :unprocessable_entity, location: false
        end
      end

      private
      def machinery_params
        p = params.require(:machinery).permit :type, :name, :phone, :price, :min_order, :description, :user_id, :avatar
        p
      end
    end
  end
end

