require 'pg'

class Bookmark

  def self.all(database = 'bookmark_manager', query = "SELECT * FROM bookmarks")
    connection = PG.connect(dbname: database)
    result = connection.exec(query)
    # ^^ .exec allows you to run SQL on the connected database
    # This SQL query returns an array of hashes and assigns it to result
    result.map do |row|
      row['url']
    end
  end
end
