Rails.application.routes.draw do
  get 'lists/new'
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  get  '/top' => 'homes#top'
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  # ... /lists/1 や .../lists/3 に該当する
  get 'lists/:id' => 'lists#show', as: 'list'
end
