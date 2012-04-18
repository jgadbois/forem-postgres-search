module ForemPostgresSearch
  require 'forem'
end

module ForemPostgresSearch
  class Engine < Rails::Engine
    engine_name 'forem_postgres_search'
    
    initializer "forem.postgres_search.routes" do |app| #, :after => "spree.environment" do |app|
        Forem::Engine.routes.append do
          resources :forums, :only=> [:index, :show] do
            member { get :search }
          end
        end
      #Spree::SolrSearch::Config = Spree::SolrSearchConfiguration.new
      #Spree::Config.searcher_class = Spree::Search::Solr
    end

    def self.activate
      ENV['RAILS_ENV'] = Rails.env

      #Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
      #  Rails.configuration.cache_classes ? require(c) : load(c)
      #end
      
      # Load application's view overrides
      #Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/**/*.rb")) do |c|
      #  Rails.configuration.cache_classes ? require(c) : load(c)
      #end

    end

    config.to_prepare &method(:activate).to_proc
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
