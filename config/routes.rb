Rails.application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    resources :houses

    resources :contacts, only: [:new, :create]

    get 'dashboard/change_banner'  => 'dashboard#change_banner', as: :banner
    post 'dashboard/update_banner' => 'dashboard#update_banner'

    get 'dashboard/change_service/:id' => 'dashboard#change_service', as: :service
    post 'dashboard/update_service/:id' => 'dashboard#update_service'

    get 'dashboard/edit_map' => 'dashboard#edit_map', as: :map
    post 'dashboard/update_map' => 'dashboard#update_map'

    get 'dashboard/services' => 'dashboard#services', as: :services
    root 'welcom#index'

  end
  get '*path', to: redirect("/#{I18n.default_locale}/%path")
  get '', to: redirect("/#{I18n.default_locale}")
end
