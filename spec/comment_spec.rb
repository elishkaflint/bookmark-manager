require 'comment'

  describe Comment do

    describe '.all/.add' do
      it 'shows all the comments associated with a bookmark' do
        bookmark1 = Bookmark.create('Makers','http://makersacademy.com')
        bookmark2 = Bookmark.create('Facebook','http://facebook.com')
        comment1 = Comment.add(bookmark1.id,'Random text')
        comment2 = Comment.add(bookmark1.id,'More random text')
        comment3 = Comment.add(bookmark2.id,'Even more random text')

        expected_comments = [
          comment1,
          comment2
        ]

        expect(Comment.all(bookmark1.id)).to eq expected_comments
      end
    end

    describe '#==' do
      it 'two Comments are equal if their IDs match' do
        comment1 = Comment.new(1, 'Random Text')
        comment2 = Comment.new(1, 'Random Text')
        expect(comment1).to eq comment2
      end
    end

  end
