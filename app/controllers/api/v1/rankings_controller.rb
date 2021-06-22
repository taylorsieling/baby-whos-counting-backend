class Api::V1::RankingsController < ApplicationController

    before_action :set_ranking, only: [:show, :update, :destroy]
  
    # GET /rankings
    def index
      @rankings = ranking.all
      render json: @rankings
    end
  
    # GET /rankings/1
    def show
      render json: @ranking
    end
  
    # POST /rankings
    def create
      @ranking = ranking.new(ranking_params)
  
      if @ranking.save
        render json: @ranking, status: :created, location: @ranking
      else
        render json: @ranking.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /rankings/1
    def update
      if @ranking.update(ranking_params)
        render json: @ranking
      else
        render json: @ranking.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /rankings/1
    def destroy
      @ranking.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_ranking
        @ranking = ranking.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def ranking_params 
        params.require(:ranking).permit(:score)
    end

end
