require 'pg'

class Comment

  attr_reader :id, :comment

  def initialize(id, comment)
    @id = id
    @comment = comment
  end

  # is this method necessary? repeated in Bookmark.comments
  def self.all(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    result = connection.exec("SELECT * FROM comments WHERE id='#{id}'")
    result.map { |row| Comment.new(row['id'],row['comment']) }
  end

  def self.add(id, comment)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    result = connection.exec("INSERT INTO comments (id, comment) VALUES('#{id}','#{comment}') RETURNING id, comment")
    Comment.new(result.first['id'],result.first['comment'])
  end

  def ==(other)
    @id == other.id
  end

end
