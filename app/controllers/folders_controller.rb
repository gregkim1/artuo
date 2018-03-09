class FoldersController < ApplicationController
  before_action :current_user_must_be_folder_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_folder_user
    folder = Folder.find(params[:id])

    unless current_user == folder.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.folders.ransack(params[:q])
      @folders = @q.result(:distinct => true).includes(:user, :bookmarks).page(params[:page]).per(10)

    render("folders/index.html.erb")
  end

  def show
    @bookmark = Bookmark.new
    @folder = Folder.find(params[:id])

    render("folders/show.html.erb")
  end

  def new
    @folder = Folder.new

    render("folders/new.html.erb")
  end

  def create
    @folder = Folder.new

    @folder.user_id = params[:user_id]
    @folder.name = params[:name]

    save_status = @folder.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/folders/new", "/create_folder"
        redirect_to("/folders")
      else
        redirect_back(:fallback_location => "/", :notice => "Folder created successfully.")
      end
    else
      render("folders/new.html.erb")
    end
  end

  def edit
    @folder = Folder.find(params[:id])

    render("folders/edit.html.erb")
  end

  def update
    @folder = Folder.find(params[:id])
    @folder.name = params[:name]

    save_status = @folder.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/folders/#{@folder.id}/edit", "/update_folder"
        redirect_to("/folders/#{@folder.id}", :notice => "Folder updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Folder updated successfully.")
      end
    else
      render("folders/edit.html.erb")
    end
  end

  def destroy
    @folder = Folder.find(params[:id])

    @folder.destroy

    if URI(request.referer).path == "/folders/#{@folder.id}"
      redirect_to("/", :notice => "Folder deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Folder deleted.")
    end
  end
end
