require 'pg'
# lets you use sql in ruby code
require 'uri'
# url validator module
require 'sinatra/flash'
# error


class Bookmark

  attr_reader :title, :url, :id

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end

    result = connection.exec("SELECT * FROM bookmarks")

    result.map { |bookmark| Bookmark.new(bookmark['id'],bookmark['title'],bookmark['url']) }

  end

  def self.create(title, url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    return false unless valid_url?(url)
    result = connection.exec("INSERT INTO bookmarks (url,title) VALUES('#{url}','#{title}') RETURNING url, title, id")
    Bookmark.new(result.first['id'],result.first['title'],result.first['url'])
  end

  def ==(other)
    @id == other.id
  end

  private

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
