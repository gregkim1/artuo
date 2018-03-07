class ArtworksController < ApplicationController
  def index
    @q = Artwork.ransack(params[:q])
    @artworks = @q.result(:distinct => true).includes(:ownerships, :taggings, :collabs).page(params[:page]).per(10)

    render("artworks/index.html.erb")
  end

  def show
    @collab = Collab.new
    @tagging = Tagging.new
    @ownership = Ownership.new
    @artwork = Artwork.find(params[:id])

    render("artworks/show.html.erb")
  end

  def new
    @artwork = Artwork.new

    render("artworks/new.html.erb")
  end

  def create
    @artwork = Artwork.new

    @artwork.caption = params[:caption]
    @artwork.image_url = params[:image_url]
    @artwork.tag = params[:tag]

    save_status = @artwork.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/artworks/new", "/create_artwork"
        redirect_to("/artworks")
      else
        redirect_back(:fallback_location => "/", :notice => "Artwork created successfully.")
      end
    else
      render("artworks/new.html.erb")
    end
  end

  def edit
    @artwork = Artwork.find(params[:id])

    render("artworks/edit.html.erb")
  end

  def update
    @artwork = Artwork.find(params[:id])

    @artwork.caption = params[:caption]
    @artwork.image_url = params[:image_url]
    @artwork.tag = params[:tag]

    save_status = @artwork.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/artworks/#{@artwork.id}/edit", "/update_artwork"
        redirect_to("/artworks/#{@artwork.id}", :notice => "Artwork updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Artwork updated successfully.")
      end
    else
      render("artworks/edit.html.erb")
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])

    @artwork.destroy

    if URI(request.referer).path == "/artworks/#{@artwork.id}"
      redirect_to("/", :notice => "Artwork deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Artwork deleted.")
    end
  end
end
