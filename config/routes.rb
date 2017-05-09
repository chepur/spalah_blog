Rails.application.routes.draw do
  # get 'welcome/index'

  root 'welcome#index'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :posts, concerns: :paginatable do
    resources :images
  end

end
