require 'pg'
# lets you use sql in ruby code

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end

    result = connection.exec("SELECT * FROM bookmarks")
    # ^^ .exec allows you to run SQL on the connected database
    # This SQL query returns an array of hashes and assigns it to result
    result.map do |row|
      row['url']
    end
  end
end
