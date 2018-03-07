class FollowsController < ApplicationController
  before_action :current_user_must_be_follow_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_follow_user
    follow = Follow.find(params[:id])

    unless current_user == follow.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @follows = current_user.follows.page(params[:page]).per(10)

    render("follows/index.html.erb")
  end

  def show
    @follow = Follow.find(params[:id])

    render("follows/show.html.erb")
  end

  def new
    @follow = Follow.new

    render("follows/new.html.erb")
  end

  def create
    @follow = Follow.new

    @follow.user_id = params[:user_id]
    @follow.artist_id = params[:artist_id]

    save_status = @follow.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/follows/new", "/create_follow"
        redirect_to("/follows")
      else
        redirect_back(:fallback_location => "/", :notice => "Follow created successfully.")
      end
    else
      render("follows/new.html.erb")
    end
  end

  def edit
    @follow = Follow.find(params[:id])

    render("follows/edit.html.erb")
  end

  def update
    @follow = Follow.find(params[:id])

    @follow.user_id = params[:user_id]
    @follow.artist_id = params[:artist_id]

    save_status = @follow.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/follows/#{@follow.id}/edit", "/update_follow"
        redirect_to("/follows/#{@follow.id}", :notice => "Follow updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Follow updated successfully.")
      end
    else
      render("follows/edit.html.erb")
    end
  end

  def destroy
    @follow = Follow.find(params[:id])

    @follow.destroy

    if URI(request.referer).path == "/follows/#{@follow.id}"
      redirect_to("/", :notice => "Follow deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Follow deleted.")
    end
  end
end
