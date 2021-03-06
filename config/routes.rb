Jci::Application.routes.draw do
  devise_for :admins#, :skip => :registrations


devise_scope :admin do
  get "/login" => "devise/sessions#new"
end

devise_scope :admin do
  delete "/logout" => "devise/sessions#destroy"
end

  # authenticated :admin do
  #   root :to => 'senhorjcis#inbox'
  # end

unauthenticated :admin do
  root :to => 'home#index'
end

  get "home/index"

  resources :posts


resources :home do
    collection do
      get :cadastrar
      get :logar
      get :admin
      get :contato
      get :sobre
    end
  end


  resources :voluntario_pessoa_juridicas do
    resources :historicos
     collection do
      get :buscar
      get :editarmeucadastro
      get :vermeucadastro
      get :visualizado_pj
      get :buscarHistorico
      get :buscarGeral
      get :buscarArray
    end
  end

  resources :entidades do
    resources :historicos 
    collection do
      get :buscar
      get :buscarArray
      get :editarmeucadastro
      get :vermeucadastro
      get :several
      get :aprovado
      get :visualizado_ent
      get :busca_publico_ent
      get :busca_por_atuacao
      get :busca_por_apoio
      get :buscarHistorico
      get :cruzar_pf_ent
    end
  end

  resources :voluntario_pessoa_fisicas do
    resources :historicos
    collection do
      get :buscar
      get :editarmeucadastro
      get :vermeucadastro
      get :visualizado_pf   
      get :busca_disponibilidade_horario
      get :busca_por_afinidade
      get :busca_por_disponibilidade
      get :busca_experiencia
      get :busca_atuacao
      get :buscarHistorico
      get :buscarGeral
      get :cruzar_pf_ent
    end
  end

  resources :senhorjcis do
    collection do
      get :index
      get :inbox
      get :admin
      get :pendencias
      get :novoAdministrador
      get :adicionarAdministrador
    end
  end

match 'entidades/:entidade_id/historicos/:id(.:format)' => 'historicos#destroy_ent', :as => :destroy_ent
match 'voluntario_pessoa_fisicas/:voluntario_pessoa_fisica_id/historicos/:id(.:format)' => 'historicos#destroy_pf', :as => :destroy_pf
match 'voluntario_pessoa_juridicas/:voluntario_pessoa_juridica_id/historicos/:id(.:format)' => 'historicos#destroy_pj', :as => :destroy_pj

# get "entidades/editarmeucadastro"
  get "entidades/list"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'  

  match '/' => 'home#index', :as => :home
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
