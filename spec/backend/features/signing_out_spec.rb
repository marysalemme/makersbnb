feature 'User sign out' do
  scenario 'there should be a sign out button' do
    sign_up
    sign_in
    expect(page).to have_button('Sign Out')
  end

  scenario 'user can successfully sign out' do
    sign_up
    sign_in
    click_button "Sign Out"
    expect(page).not_to have_content('Signed in as John Doe')
    expect(page.current_path).to eq('/')
  end

end
