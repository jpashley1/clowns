class ClownsController < ApplicationController

  def index
    @clowns = Clown.all 
    render :index
    # render json: {message: "index"}
  end

  def show
    @clown = Clown.find_by(id: params[:id])
    render :show
    # render json: {message: "show"}
  end

  def create
    @clown = Clown.new(
    name: params[:name],
    description: params[:description]
    )

    if @clown.save
      render :show
    else
      render json: { errors: clown.errors.full_messages }, status: :bad_request
    end

    # render json: {message: "create"}
  end

  def update
    @clown = Clown.find_by(id: params[:id ])
    @clown.update(
      name: params[:name] || @clown.name,
      description: params[:description] || @clown.description
      )
      @clown.save
      render :show
      # render json: {message: "update"}
    end
    
    def destroy
      @clown = Clown.find_by(id: params[:id ])
      
      @clown.destroy
    # render json: {message: "destroy"}
    render json: { message: "Clown has been removed" }

  end




end
