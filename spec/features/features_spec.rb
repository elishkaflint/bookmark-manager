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
    bookmark = Bookmark.create('Makers Academy','http://makersacademy.com')
    visit('/bookmarks')
    click_button('Delete Bookmark')
    expect(page).not_to have_content 'Facebook'
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
