feature 'Root' do
  scenario 'Shows that test environment is working' do
    visit('/')
    expect(page).to have_content("Test environment is working")
  end
end
