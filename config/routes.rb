Rails.application.routes.draw do
  # Routes for the Follow resource:
  # CREATE
  get "/follows/new", :controller => "follows", :action => "new"
  post "/create_follow", :controller => "follows", :action => "create"

  # READ
  get "/follows", :controller => "follows", :action => "index"
  get "/follows/:id", :controller => "follows", :action => "show"

  # UPDATE
  get "/follows/:id/edit", :controller => "follows", :action => "edit"
  post "/update_follow/:id", :controller => "follows", :action => "update"

  # DELETE
  get "/delete_follow/:id", :controller => "follows", :action => "destroy"
  #------------------------------

  # Routes for the Collab resource:
  # CREATE
  get "/collabs/new", :controller => "collabs", :action => "new"
  post "/create_collab", :controller => "collabs", :action => "create"

  # READ
  get "/collabs", :controller => "collabs", :action => "index"
  get "/collabs/:id", :controller => "collabs", :action => "show"

  # UPDATE
  get "/collabs/:id/edit", :controller => "collabs", :action => "edit"
  post "/update_collab/:id", :controller => "collabs", :action => "update"

  # DELETE
  get "/delete_collab/:id", :controller => "collabs", :action => "destroy"
  #------------------------------

  # Routes for the Tag resource:
  # CREATE
  get "/tags/new", :controller => "tags", :action => "new"
  post "/create_tag", :controller => "tags", :action => "create"

  # READ
  get "/tags", :controller => "tags", :action => "index"
  get "/tags/:id", :controller => "tags", :action => "show"

  # UPDATE
  get "/tags/:id/edit", :controller => "tags", :action => "edit"
  post "/update_tag/:id", :controller => "tags", :action => "update"

  # DELETE
  get "/delete_tag/:id", :controller => "tags", :action => "destroy"
  #------------------------------

  # Routes for the Tagging resource:
  # CREATE
  get "/taggings/new", :controller => "taggings", :action => "new"
  post "/create_tagging", :controller => "taggings", :action => "create"

  # READ
  get "/taggings", :controller => "taggings", :action => "index"
  get "/taggings/:id", :controller => "taggings", :action => "show"

  # UPDATE
  get "/taggings/:id/edit", :controller => "taggings", :action => "edit"
  post "/update_tagging/:id", :controller => "taggings", :action => "update"

  # DELETE
  get "/delete_tagging/:id", :controller => "taggings", :action => "destroy"
  #------------------------------

  # Routes for the Ownership resource:
  # CREATE
  get "/ownerships/new", :controller => "ownerships", :action => "new"
  post "/create_ownership", :controller => "ownerships", :action => "create"

  # READ
  get "/ownerships", :controller => "ownerships", :action => "index"
  get "/ownerships/:id", :controller => "ownerships", :action => "show"

  # UPDATE
  get "/ownerships/:id/edit", :controller => "ownerships", :action => "edit"
  post "/update_ownership/:id", :controller => "ownerships", :action => "update"

  # DELETE
  get "/delete_ownership/:id", :controller => "ownerships", :action => "destroy"
  #------------------------------

  # Routes for the Artwork resource:
  # CREATE
  get "/artworks/new", :controller => "artworks", :action => "new"
  post "/create_artwork", :controller => "artworks", :action => "create"

  # READ
  get "/artworks", :controller => "artworks", :action => "index"
  get "/artworks/:id", :controller => "artworks", :action => "show"

  # UPDATE
  get "/artworks/:id/edit", :controller => "artworks", :action => "edit"
  post "/update_artwork/:id", :controller => "artworks", :action => "update"

  # DELETE
  get "/delete_artwork/:id", :controller => "artworks", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
