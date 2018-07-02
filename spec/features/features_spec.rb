feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "www.google.com"
    expect(page).to have_content "www.amazon.com"
    expect(page).to have_content "www.makers.com"



  end
end
