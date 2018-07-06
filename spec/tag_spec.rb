require 'tag'

  describe Tag do

    describe '.all/.create' do

      it 'should add a tag to a bookmark' do
        bookmark1 = Bookmark.create('Makers','http://makersacademy.com')
        tag1 = Tag.create('fun')
        tag2 = Tag.create('work')
        expected_tags = [
          tag1,
          tag2
        ]
        expect(Tag.all).to eq expected_tags
      end

    end

    describe '.view_bookmarks' do
      it 'shows all the bookmarks associated with a particular tag id' do
        bookmark1 = Bookmark.create('Makers','http://makersacademy.com')
        bookmark2 = Bookmark.create('Facebook','http://facebook.com')
        tag = Tag.create('fun')
        bookmark_tag = BookmarkTag.add(bookmark1.id,tag.id)
        bookmark_tag = BookmarkTag.add(bookmark2.id,tag.id)
        expected_bookmarks = [
          bookmark1,
          bookmark2
        ]
        expect(Tag.view_bookmarks(tag.id)).to eq expected_bookmarks
      end
    end


    describe '#==' do
      it 'two tags are equal if their IDs match' do
        tag1 = Tag.new(1, 'random tag')
        tag2 = Tag.new(1, 'random tag')
        expect(tag1).to eq tag2
      end
    end

  end
