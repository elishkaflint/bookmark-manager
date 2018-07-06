

class BookmarkTag

  include DatabaseConnection

  attr_reader :id, :bookmark_id, :tag_id

  def initialize(id, bookmark_id, tag_id)
    @id = id
    @bookmark_id = bookmark_id
    @tag_id = tag_id
  end

  def self.all
    connection = DatabaseConnection::Connection.create
    result = connection.exec("SELECT * FROM bookmarks_tags")
    result.map { |bookmark_tag| BookmarkTag.new(bookmark_tag['id'],bookmark_tag['bookmark_id'],bookmark_tag['tag_id']) }
  end

  def self.add(bookmark_id,tag_id)
    connection = DatabaseConnection::Connection.create
    result = connection.exec("INSERT INTO bookmarks_tags (bookmark_id, tag_id) VALUES('#{bookmark_id}','#{tag_id}') RETURNING id, bookmark_id, tag_id")
    BookmarkTag.new(result.first['id'],result.first['bookmark_id'],result.first['tag_id'])
  end

  def ==(other)
    @id == other.id
  end

end
