require 'bookmark'

describe Bookmark do

  describe ".all" do
    it "returns all bookmarks in an array" do

      Bookmark.create('http://makersacademy.com')
      Bookmark.create('http://destroyallsoftware.com')
      Bookmark.create('http://google.com')

      expected_bookmarks = [
        "http://makersacademy.com",
        "http://destroyallsoftware.com",
        "http://google.com"
      ]

      expect(Bookmark.all).to eq expected_bookmarks

    end

  end

  describe ".create" do
    it "adds a bookmark to the database" do

      Bookmark.create("www.facebook.com")
      Bookmark.create("www.yahoo.com")

      expected_bookmarks = [
        "www.facebook.com",
        "www.yahoo.com"
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

end
