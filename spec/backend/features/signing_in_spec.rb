feature 'User sign in' do
  scenario 'user can sign in' do
    sign_up
    sign_in
    expect(page).to have_content('Signed in as John Doe')
  end
end
