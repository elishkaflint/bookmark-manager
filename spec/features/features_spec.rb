feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create('Makers Academy','http://makersacademy.com')
    Bookmark.create('Destroy All Software','http://destroyallsoftware.com')
    Bookmark.create('Google','http://google.com')
    visit('/bookmarks')
    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'Destroy All Software'
    expect(page).to have_content 'Google'
  end
end

feature 'Adding bookmarks' do
  scenario 'A user can add a bookmark' do
    visit('/bookmarks')
    click_button("Add Bookmark")
    fill_in :url, with: 'http://facebook.com'
    fill_in :title, with: 'Facebook'
    click_button("OK")
    expect(page).to have_content 'Facebook'
  end
end

feature 'Validating bookmarks' do
  scenario 'A user gets an error message if the url is not valid' do
    visit('/bookmarks')
    click_button("Add Bookmark")
    fill_in :title, with: 'some title'
    fill_in :url, with: 'not a url'
    click_button("OK")
    expect(page).not_to have_content 'some title'
    expect(page).to have_content 'Invalid URL'
  end
end

feature 'Viewing bookmark titles' do
  scenario 'The homepage shows bookmark titles' do
    Bookmark.create('Makers Academy','http://makersacademy.com')
    visit('/bookmarks')
    expect(page).to have_content('Makers Academy')
  end
end

feature 'Clicking bookmark titles and landing on bookmarked URL' do
  scenario 'The titles on the homepage are links to the correct address' do
    Bookmark.create('Makers Academy','http://makersacademy.com')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', :href=>"http://makersacademy.com")
  end
end

feature 'Deleting bookmarks' do
  scenario 'A user can delete a bookmark' do
    bookmark1 = Bookmark.create('Makers Academy','http://makersacademy.com')
    bookmark2 = Bookmark.create('Facebook','http://facebook.com')
    visit('/bookmarks')
    click_button('Delete Bookmark', match: :first)
    expect(page).not_to have_content 'Makers Academy'
  end
end

feature 'Updating bookmarks' do
  scenario 'A user can update a bookmark title and url' do
    bookmark = Bookmark.create('Makers Academy','http://makersacademy.com')
    visit('/bookmarks')
    click_button('Update Bookmark')
    fill_in :title, with: 'Makers'
    fill_in :url, with: 'https://makers.tech/'
    click_button('OK')
    expect(page).not_to have_link('Makers Academy', :href=>"http://makersacademy.com")
    expect(page).to have_link('Makers', :href=>"https://makers.tech/")
  end
end

feature 'Commenting on a bookmark' do
  scenario 'The homepage has a comment button which shows existing comments on the bookmark\'s comment page' do
    bookmark = Bookmark.create('Makers Academy','http://makersacademy.com')
    comment = Comment.add(bookmark.id,'Some text')
    visit('/bookmarks')
    click_button('Comments')
    expect(page).to have_content('Some text')
  end
  scenario 'The comment page tells user if there are no comments' do
    bookmark = Bookmark.create('Makers Academy','http://makersacademy.com')
    visit('/bookmarks')
    click_button('Comments')
    expect(page).to have_content('No comments to display')
  end
end

feature 'Commenting on a bookmark' do
  scenario 'A user can comment on a bookmark' do
    bookmark = Bookmark.create('Makers Academy','http://makersacademy.com')
    visit('/bookmarks')
    click_button('Comments')
    click_button('Add Comment')
    fill_in :comment, with: 'A comment'
    click_button('Add Comment')
    expect(page).to have_content('A comment')
  end
end
