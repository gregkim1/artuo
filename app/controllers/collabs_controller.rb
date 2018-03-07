class CollabsController < ApplicationController
  def index
    @collabs = Collab.all

    render("collabs/index.html.erb")
  end

  def show
    @collab = Collab.find(params[:id])

    render("collabs/show.html.erb")
  end

  def new
    @collab = Collab.new

    render("collabs/new.html.erb")
  end

  def create
    @collab = Collab.new

    @collab.artwork_id = params[:artwork_id]
    @collab.artist_id = params[:artist_id]

    save_status = @collab.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/collabs/new", "/create_collab"
        redirect_to("/collabs")
      else
        redirect_back(:fallback_location => "/", :notice => "Collab created successfully.")
      end
    else
      render("collabs/new.html.erb")
    end
  end

  def edit
    @collab = Collab.find(params[:id])

    render("collabs/edit.html.erb")
  end

  def update
    @collab = Collab.find(params[:id])

    @collab.artwork_id = params[:artwork_id]
    @collab.artist_id = params[:artist_id]

    save_status = @collab.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/collabs/#{@collab.id}/edit", "/update_collab"
        redirect_to("/collabs/#{@collab.id}", :notice => "Collab updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Collab updated successfully.")
      end
    else
      render("collabs/edit.html.erb")
    end
  end

  def destroy
    @collab = Collab.find(params[:id])

    @collab.destroy

    if URI(request.referer).path == "/collabs/#{@collab.id}"
      redirect_to("/", :notice => "Collab deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Collab deleted.")
    end
  end
end
