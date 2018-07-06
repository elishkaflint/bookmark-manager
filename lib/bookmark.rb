require 'pg'
# lets you use sql in ruby code
require 'uri'
# url validator module
require 'sinatra/flash'
# error pop-up
require_relative './comment.rb'
require_relative './tag.rb'
require_relative './bookmark_tag.rb'
require_relative './connection_module.rb'

class Bookmark

  include DatabaseConnection

  attr_reader :title, :url, :id

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = DatabaseConnection::Connection.create
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| Bookmark.new(bookmark['id'],bookmark['title'],bookmark['url']) }
  end

  def self.create(title, url)
    connection = DatabaseConnection::Connection.create
    return false unless valid_url?(url)
    result = connection.exec("INSERT INTO bookmarks (url,title) VALUES('#{url}','#{title}') RETURNING url, title, id")
    Bookmark.new(result.first['id'],result.first['title'],result.first['url'])
  end

  def self.delete(id)
    connection = DatabaseConnection::Connection.create
    connection.exec("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  def self.update(id, title, url)
    connection = DatabaseConnection::Connection.create
    result = connection.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING url, title, id")
    Bookmark.new(result.first['id'],result.first['title'],result.first['url'])
  end

  def self.view_comments(id)
    connection = DatabaseConnection::Connection.create
    result = connection.exec("SELECT * FROM comments WHERE id='#{id}'")
    result.map { |row| Comment.new(row['id'],row['comment']) }
  end

  def ==(other)
    @id == other.id
  end

  private

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
