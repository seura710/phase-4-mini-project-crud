class SpicesController < ApplicationController

  # GET /spices
  def index 
    spices = Spice.all 
    render json: spices
  end

  # GET /spices/:id
#   def show 
#     spice = Spice.find_by(id: params[:id])
#     render json: spice
#   end

  # POST /spices
  def create
    spice = Spice.create(title: params[:title], notes: params[:notes], image: params[:image], description: params[:description], rating: params[:rating])
    render json: spice, status: :created
  end

  # PATCH /spices/:id
  def update
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.update(spice_params)
      render json: spice
    else 
      render json: { error: "Spice not found" }, status: :not_found
    end
  end

  def spice_params
    params.permit(:title, :notes, :description, :rating, :image)
  end

  def destroy
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.destroy
      head :no_content
    else
      render json: { error: "Spice not found" }, status: :not_found
    end
  end
end
