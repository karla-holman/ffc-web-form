RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model "Admin" do
    list do
      exclude_fields :created_at, :updated_at
    end
  end
  config.model "House" do
    list do
      exclude_fields :created_at, :updated_at
    end
  end
  config.model "ServiceProvider" do
    list do
      exclude_fields :created_at, :updated_at
    end
  end
  config.model Page do
    edit do
      field :name
      field :content, :ck_editor
      field :icon do
        help 'Use http://fontawesome.io/icons/'
      end
      include_all_fields
    end
  end
end
