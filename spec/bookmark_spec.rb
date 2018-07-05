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

end
