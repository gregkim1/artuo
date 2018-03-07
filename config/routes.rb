Rails.application.routes.draw do
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
