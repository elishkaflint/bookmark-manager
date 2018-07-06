require 'tag'

  describe Tag do

    describe '.all/.add' do

      it 'should add a tag to a bookmark' do
        bookmark1 = Bookmark.create('Makers','http://makersacademy.com')
        tag1 = Tag.add('fun')
        tag2 = Tag.add('work')
        expected_tags = [
          tag1,
          tag2
        ]
        expect(Tag.all).to eq expected_tags
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
