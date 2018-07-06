require 'pg'

module DatabaseConnection

  class Connection
    def self.create
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: "bookmark_manager_test")
      else
        connection = PG.connect(dbname: "bookmark_manager")
      end
    end
  end
end
