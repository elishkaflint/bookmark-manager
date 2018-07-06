require 'bookmark_tag'

describe BookmarkTag do

  describe '.add/.all' do
    it 'creates a new link between bookmarks and tags' do
      bookmark = Bookmark.create('Makers','http://makersacademy.com')
      tag = Tag.create('fun')
      bookmark_tag = BookmarkTag.add(bookmark.id, tag.id)
      expect(BookmarkTag.all).to include bookmark_tag
    end
  end

  describe '#==' do
    it 'two bookmarktags are equal if their IDs match' do
      bookmark_tag1 = BookmarkTag.new(1, 2, 3)
      bookmark_tag2 = BookmarkTag.new(1, 2, 3)
      expect(bookmark_tag1).to eq bookmark_tag2
    end
  end


end
