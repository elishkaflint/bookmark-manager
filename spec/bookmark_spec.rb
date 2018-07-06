require 'bookmark'
require 'uri'

describe Bookmark do

  describe ".all" do
    it "returns all bookmarks in an array" do

      bookmark1 = Bookmark.create('Makers','http://makersacademy.com')
      bookmark2 = Bookmark.create('Software','http://destroyallsoftware.com')
      bookmark3 = Bookmark.create('Google','http://google.com')

      expected_bookmarks = [
        bookmark1,
        bookmark2,
        bookmark3
      ]

      expect(Bookmark.all).to eq expected_bookmarks

    end

  end

  describe ".create" do
    it "adds a bookmark and title to the database" do
      bookmark = Bookmark.create("Facebook", "http://www.facebook.com")
      expect(Bookmark.all).to include bookmark
    end
    # have a go at this text
    it "does not add a bookmark if the url is invalid" do
      Bookmark.create("some title","not a url")
      expect(Bookmark.all).not_to include "not a url"
    end
  end

  describe '#==' do
    it 'two Bookmarks are equal if their IDs match' do
      bookmark1 = Bookmark.new(1, 'Test', 'http://testbookmark.com')
      bookmark2 = Bookmark.new(1, 'Test', 'http://testbookmark.com')
      expect(bookmark1).to eq bookmark2
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create("Facebook", "http://www.facebook.com")
      Bookmark.delete(bookmark.id)
      expect(Bookmark.all).not_to include bookmark
    end
  end

  describe '.update' do
    it 'updates a bookmark title and url' do
      old_bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
      new_bookmark = Bookmark.update(old_bookmark.id,'Makers','http://www.makers.tech')
      expect(Bookmark.all).to include new_bookmark
    end
  end

  describe '.view_comments' do
    it 'displays all the comments associated with a particular bookmark id' do
      bookmark1 = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
      bookmark2 = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
      comment1 = Comment.add(bookmark1.id,'Random text')
      comment2 = Comment.add(bookmark1.id,'More random text')
      comment3 = Comment.add(bookmark2.id,'More random text')
      expected_comments = [
        comment1,
        comment2
      ]
      expect(Bookmark.view_comments(bookmark1.id)).to eq expected_comments
    end
  end

  describe '.view_tags' do
    it 'shows all the tags associated with a particular bookmark id' do
      bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
      tag1 = Tag.create('fun')
      tag2 = Tag.create('work')
      bookmark_tag = BookmarkTag.add(bookmark.id,tag1.id)
      bookmark_tag = BookmarkTag.add(bookmark.id,tag2.id)
      expected_tags = [
        tag1,
        tag2,
      ]
      expect(Bookmark.view_tags(bookmark.id)).to eq expected_tags
    end
  end

end
