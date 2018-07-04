feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create('http://makersacademy.com')
    Bookmark.create('http://destroyallsoftware.com')
    Bookmark.create('http://google.com')
    visit('/bookmarks')
    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://google.com"
    expect(page).to have_content "http://destroyallsoftware.com"
  end
end

feature 'Adding bookmarks' do
  scenario 'A user can add a bookmark' do
    visit('/bookmarks')
    click_button("Add Bookmark")
    fill_in :add_url, with: 'http://facebook.com'
    click_button("OK")
    expect(page).to have_content 'http://facebook.com'
  end
end

feature 'Validating bookmarks' do
  scenario 'A user gets an error message if the url is not valid' do
    visit('/bookmarks')
    click_button("Add Bookmark")
    fill_in :add_url, with: 'not a url'
    click_button("OK")
    expect(page).not_to have_content 'not a url'
    expect(page).to have_content 'Invalid URL'
  end
end
