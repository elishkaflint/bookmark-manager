require 'pg'
require_relative './connection_module.rb'

class Comment

  include DatabaseConnection

  attr_reader :id, :comment

  def initialize(id, comment)
    @id = id
    @comment = comment
  end

  def self.add(id, comment)
    connection = DatabaseConnection::Connection.create
    result = connection.exec("INSERT INTO comments (id, comment) VALUES('#{id}','#{comment}') RETURNING id, comment")
    Comment.new(result.first['id'],result.first['comment'])
  end

  def ==(other)
    @id == other.id
  end

end
