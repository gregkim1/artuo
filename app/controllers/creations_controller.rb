class CreationsController < ApplicationController
  def index
    @q = Creation.ransack(params[:q])
    @creations = @q.result(:distinct => true).includes(:artist, :art).page(params[:page]).per(10)

    render("creations/index.html.erb")
  end

  def show
    @creation = Creation.find(params[:id])

    render("creations/show.html.erb")
  end

  def new
    @creation = Creation.new

    render("creations/new.html.erb")
  end

  def create
    @creation = Creation.new

    @creation.artwork_id = params[:artwork_id]
    @creation.artist_id = params[:artist_id]
    @creation.share = params[:share]

    save_status = @creation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/creations/new", "/create_creation"
        redirect_to("/creations")
      else
        redirect_back(:fallback_location => "/", :notice => "Creation created successfully.")
      end
    else
      render("creations/new.html.erb")
    end
  end

  def edit
    @creation = Creation.find(params[:id])

    render("creations/edit.html.erb")
  end

  def update
    @creation = Creation.find(params[:id])

    @creation.artwork_id = params[:artwork_id]
    @creation.artist_id = params[:artist_id]
    @creation.share = params[:share]

    save_status = @creation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/creations/#{@creation.id}/edit", "/update_creation"
        redirect_to("/creations/#{@creation.id}", :notice => "Creation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Creation updated successfully.")
      end
    else
      render("creations/edit.html.erb")
    end
  end

  def destroy
    @creation = Creation.find(params[:id])

    @creation.destroy

    if URI(request.referer).path == "/creations/#{@creation.id}"
      redirect_to("/", :notice => "Creation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Creation deleted.")
    end
  end
end
