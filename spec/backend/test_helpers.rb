
module TestHelper
  
  def sign_up(username: 'John Doe', email: 'johndoetest@gmail.com', password: 'password123', password_confirmation: 'password123')
    visit('users/new')
    fill_in(:username, with: username)
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    fill_in(:password_confirmation, with: password_confirmation)
    click_button('Submit')
  end
  
  def sign_in(username: 'John Doe', password: 'password123')
    visit('sessions/new')
    fill_in(:username, with: username)
    fill_in(:password, with: password)
    click_button('Submit')
  end
  
  def create_space(description: "tiny flat", price: "50.0", location: "Mile End")
    visit '/space/new'
    fill_in "description", with: description
    fill_in "price", with: price
    fill_in "location", with: location
    click_on("List space")
  end
end
