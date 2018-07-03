require 'bookmark'
require 'pg'

describe Bookmark do

  # # we need these tests to look in a test database, HOW

  describe ".all" do
    it "returns first row" do
      described_class.all('bookmark_manager_test', "INSERT INTO bookmarks VALUES('1','http://makersacademy.com')")
      expect(described_class.all('bookmark_manager_test',"SELECT * FROM bookmarks")).to include ("http://makersacademy.com")
    end
    it "returns second row" do
      described_class.all('bookmark_manager_test', "INSERT INTO bookmarks VALUES('2','http://google.com')")
      expect(described_class.all('bookmark_manager_test',"SELECT * FROM bookmarks")).to include ("http://google.com")
    end
    it "returns third row" do
      described_class.all('bookmark_manager_test', "INSERT INTO bookmarks VALUES('3','http://destroyallsoftware.com')")
      expect(described_class.all('bookmark_manager_test',"SELECT * FROM bookmarks")).to include ("http://destroyallsoftware.com")
    end
  end
end
