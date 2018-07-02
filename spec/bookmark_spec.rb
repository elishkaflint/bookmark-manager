require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }
  describe "#initialize" do
    it "initialize with an array" do
      expect(bookmark.array).to eq ["www.google.com", "www.amazon.com", "www.makers.com"]
    end
  end
end
