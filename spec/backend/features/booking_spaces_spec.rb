
feature 'Booking a Space' do
  before do
    sign_up
    create_space
  end

  scenario 'User can book a space' do
    expect{create_booking}.to change(Booking, :count).by(1)
  end

  scenario "User gets a confirmation page" do
    create_booking(id: 2) #DatabaseCleaner isn't cleaning DB before each spec, only after
    expect(page).to have_content("21/07/2017")
    expect(page).to have_content("22/07/2017")
  end

  scenario "Booking form is specific to space" do
    create_space(description: "medium flat")
    create_space(description: "small flat")
    create_space(description: "big flat")
    click_on("space4")
    expect(page).to have_content("medium flat")
  end

  scenario "Booking is only possible if user is logged in" do
    sign_out
    expect{create_booking(id: 7)}.to_not change(Booking, :count)
    expect(page).to have_content("You need to be signed in to book a space")
  end

  scenario "User can only book if start and end dates entered" do
    create_booking(id: 8, start_date: nil)
    expect(page).to have_content("Start and end dates needed")
  end

  scenario "Dates must be valid" do
    create_booking(id: 9, start_date: "22/7/2017", end_date: "21/7/2017")
    expect(page).to have_content "Dates must be valid"
  end

  scenario "Booking must be for at least one night" do
    create_booking(id: 10, start_date: "22/7/2017", end_date: "22/7/2017")
    expect(page).to have_content "Dates must be valid"
  end

  scenario "Can't double book a space" do
    create_booking(id: 11)
    create_booking(id: 11)
    expect(page).to have_content "Space is occupied"
  end
end
