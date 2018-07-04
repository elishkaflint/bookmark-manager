require 'pg'
# lets you use sql in ruby code
require 'uri'
# url validator module
require 'sinatra/flash'
# error


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

  def self.create(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    return false unless valid_url?(url)
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

  private

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
