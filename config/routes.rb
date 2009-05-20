ActionController::Routing::Routes.draw do |map|

  map.resources :users do |user|
    user.resources :votings
  end

  map.resources :votings do |voting|
    voting.resources :votes
  end

  map.static '/:action', :controller => 'static'

  map.root :controller => 'static', :action => 'index'

end
