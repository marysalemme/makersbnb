
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

  def sign_out
    click_button('Sign Out')
  end

  def create_space(description: "tiny flat", price: "50.0", location: "Mile End")
    visit '/space/new'
    fill_in "description", with: description
    fill_in "price", with: price
    fill_in "location", with: location
    click_on("List space")
  end

  def search(price_min: '20', price_max: '60', location: 'Mile End')
    fill_in(:price_min, with: price_min)
    fill_in(:price_max, with: price_max)
    fill_in(:location, with: location)
    click_on('Search')
  end

  def create_booking(id: 1, start_date: "21/7/2017", end_date: "22/7/2017")
    visit '/space'
    click_on("space#{id}")
    fill_in :start_date, with: start_date
    fill_in :end_date, with: end_date
    click_button("Book")
  end

end
