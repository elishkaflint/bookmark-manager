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

  def ==(other)
    @id == other.id
  end

end
