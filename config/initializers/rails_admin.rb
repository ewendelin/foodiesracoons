require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Datetime < RailsAdmin::Config::Fields::Base
          def value
            value_in_default_time_zone = bindings[:object].send(name)
            return nil if value_in_default_time_zone.nil?
            beijing = ActiveSupport::TimeZone.new('Beijing')
            value_in_default_time_zone.in_time_zone(beijing)
          end
        end
      end
    end
  end
end

RailsAdmin.config do |config|

  config.main_app_name = Proc.new {
    ["Emberall Admin", "(#{Time.zone.now.to_s(:time)})"]
  }

  config.main_app_name = ["LiliXia | 粒粒侠"]
  config.current_user_method(&:current_user)

  config.authorize_with do |controller|
    redirect_to main_app.root_path unless current_user #&& current_user.admin
  end

  config.model 'Restaurant' do
    parent 'User'
    # navigation_icon 'fa fa-'
    list do
      field :id
      field :name
      field :address
      field :cuisine
      field :user
    end
  end
  config.model 'Claim' do
    parent 'Post'
    list do
      field :id
      field :restaurant
      field :post
      field :active_inactive  do
        label 'Active/Inactive'
      end
      field :user
      field :status
      field :claimed_at
      field :created_at
      field :updated_at
    end
  end
  config.model 'Review' do

    # navigation_icon 'far fa-check-double'
    list do
      field :id
      field :restaurant
      field :rating
    end
  end
  config.model 'Post' do
    label 'Promotion'
    parent 'Restaurant'
    list do
      filters [:restaurant]
      field :id
      field :restaurant
      field :name
      field :description
      field :active_inactive  do
        label 'Active/Inactive'
      end
      field :original_price do
    label 'Original Price RMB'
      end
      field :discount do
        label 'discount %'
      end
      field :discount_price do
    label 'Discounted Price RMB'
      end
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
      field :kind
      field :created_at
    end
  end
  config.model 'Restaurant' do
    edit do
      field :name
      field :address
      field :cuisine
      field :user
      field :phone_number
      field :image
    end
  end
  config.model 'Post' do
    label 'Promotion'
    edit do
      field :restaurant
      field :name
      field :original_price
      field :discount
      field :description
      field :discount  do
        label 'discount %'
      end
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
      field :kind
      field :first_name
      field :last_name
      field :email
    end
  end
  #   config.model 'Post' do
  #   edit do
  #     group :post do
  #     label "Promotions"
  #   end
  #   end
  # end


  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  # # == Cancan ==
    config.authorize_with :cancancan

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
      except ['Claim', 'Review']
    end
    export
    bulk_delete
    show
    edit do
      except ['Review']
    end
    delete do
      except
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
