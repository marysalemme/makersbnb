
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
    expect(page).to have_content("21/7/2017")
    expect(page).to have_content("22/7/2017")
  end

  scenario "Booking form is specific to space" do
    create_space(description: "medium flat")
    create_space(description: "small flat")
    create_space(description: "big flat")
    click_on("space4")
    expect(page).to have_content("medium flat")
  end
end
