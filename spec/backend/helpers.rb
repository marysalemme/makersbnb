
def sign_up(username: 'John Doe', email: 'johndoetest@gmail.com', password: 'password123', password_confirmation: 'password123')
  visit('users/new')
  fill_in(:username, with: username)
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password_confirmation)
  click_button('Submit')
end
