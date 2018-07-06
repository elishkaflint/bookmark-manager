class Tag

  include DatabaseConnection

  attr_reader :id, :tag

  def initialize(id, tag)
    @id = id
    @tag = tag
  end

  def self.all
    connection = DatabaseConnection::Connection.create
    result = connection.exec("SELECT * FROM tags")
    result.map { |tag| Tag.new(tag['id'],tag['content']) }
  end

  def self.create(tag)
    connection = DatabaseConnection::Connection.create
    result = connection.exec("INSERT INTO tags (content) VALUES('#{tag}') RETURNING id, content")
    Tag.new(result.first['id'],result.first['content'])
  end

  def self.view_bookmarks(tag_id)
    connection = DatabaseConnection::Connection.create
    bookmark_tags = connection.exec("SELECT * FROM bookmarks_tags WHERE tag_id='#{tag_id}'")
    result = bookmark_tags.map { |bookmark_tag| BookmarkTag.new(bookmark_tag['id'],bookmark_tag['bookmark_id'],bookmark_tag['tag_id']) }
    bookmarks = result.map do |bookmark_tag|
      connection.exec("SELECT * FROM bookmarks WHERE id=#{bookmark_tag.bookmark_id}")
    end
    bookmarks.map do |bookmark|
      Bookmark.new(bookmark.first['id'],bookmark.first['title'],bookmark.first['url'])
    end
  end


  def ==(other)
    @id == other.id
  end

end
