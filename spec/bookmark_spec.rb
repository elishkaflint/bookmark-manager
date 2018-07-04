require 'bookmark'
require 'uri'

describe Bookmark do

  # Test feels uneccesary given .create test:

  # describe ".all" do
  #   xit "returns all bookmarks in an array" do
  #
  #     Bookmark.create('http://makersacademy.com')
  #     Bookmark.create('http://destroyallsoftware.com')
  #     Bookmark.create('http://google.com')
  #
  #     expected_bookmarks = [
  #       "http://makersacademy.com",
  #       "http://destroyallsoftware.com",
  #       "http://google.com"
  #     ]
  #
  #     expect(Bookmark.all).to eq expected_bookmarks
  #
  #   end
  #
  # end

  describe ".create" do
    it "adds a bookmark and title to the database" do
      Bookmark.create("Facebook", "http://www.facebook.com")
      Bookmark.create("Amazon", "http://www.amazon.com")
      expected_bookmarks = [
        {title: "Facebook", url: "http://www.facebook.com"},
        {title: "Amazon", url: "http://www.amazon.com"},
      ]
      expect(Bookmark.all).to include "Facebook"
      expect(Bookmark.all).to include "Amazon"
    end
    # have a go at this text
    it "does not add a bookmark if the url is invalid" do
      Bookmark.create("some title","not a url")
      expect(Bookmark.all).not_to include "not a url"
    end
  end

end
