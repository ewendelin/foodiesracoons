RailsAdmin.config do |config|
  config.authorize_with do |controller|
    redirect_to main_app.root_path unless current_user && current_user.admin
  end
  config.model 'Restaurant' do
    list do
      field :id
      field :name
      field :address
      field :user
    end
  end
  config.model 'Claim' do
    list do
      field :id
      field :restaurant
      field :post
      field :user
      field :status
      field :claimed_at
      field :created_at
      field :updated_at
    end
  end
  config.model 'Post' do
    list do
      field :id
      field :restaurant
      field :name
      field :description
      field :original_price
      field :discount
      field :everyday
      field :start_time
      field :end_time
      field :created_at
      field :updated_at
    end
  end
  config.model 'User' do
    list do
      field :id
      field :email
      field :first_name
      field :last_name
      field :admin
      field :created_at
    end
  end
  config.model 'Restaurant' do
    edit do
      field :name
      field :address
      field :cuisine
      field :phone_number
    end
  end
  config.model 'Post' do
    edit do
      field :name
      field :original_price
      field :discount
      field :description
      field :discount
      field :everyday
      field :start_time
      field :end_time
      field :image
    end
  end
    config.model 'Claim' do
    edit do
      field :status
    end
  end
    config.model 'User' do
    edit do
      field :first_name
      field :last_name
    end
  end


  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit


  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['Claim']
    end
    export
    bulk_delete
    show
    edit
    delete do
      except ['Claim']
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
