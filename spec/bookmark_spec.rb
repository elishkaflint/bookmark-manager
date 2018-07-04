require 'bookmark'
require 'uri'

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
      url = "http://www.facebook.com"
      Bookmark.create(url)
      expected_bookmarks = [
        url
      ]
      expect(Bookmark.all).to eq expected_bookmarks
    end
    it "does not add a bookmark if the url is invalid" do
      Bookmark.create("not a url")
      expect(Bookmark.all).not_to include "not a url"
    end
  end

end
