# frozen_string_literal: true

Rails.application.routes.draw do
  resources :clocks, only: %i[index new create show destroy]
  root 'clocks#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
