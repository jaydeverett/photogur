class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @pictures_more_than_a_month = Picture.created_before(1.month.ago)
    @pictures_from_a_year = Picture.pictures_created_in_year(2017)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to "/pictures"
    else
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def picture_params
    params.require(:picture).permit(:title, :artist, :url)
  end

end
