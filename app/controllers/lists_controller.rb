class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]


  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: "list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_url, notice: "list was successfully destroyed."
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end

end
