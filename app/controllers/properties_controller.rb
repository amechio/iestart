class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show destroy ]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to "/matchings", notice: "Property was successfully created." }
        format.json { render :index, status: :created, location: @matching }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:property_type, :url, :other, :trader, :price)
  end
end
