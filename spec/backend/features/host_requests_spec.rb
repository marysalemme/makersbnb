

feature "host can see booking requests" do

  before do
    sign_up
    create_space
  end

  scenario "host views a page of booking requests" do
    create_booking(id: 13)
    visit("/bookings/requests")
    expect(page).to have_content("tiny flat")
    expect(page).to have_content("21/07/2017")
    expect(page).to have_content("22/07/2017")
  end

  scenario "host can confirm a booking" do
    create_booking(id: 14)
    visit("/bookings/requests")
    click_button("Confirm Booking")
    expect(Space.get(14).bookings[0].approval).to be true
  end

  scenario "booking button removes itself on approval" do
    create_booking(id: 15)
    visit("/bookings/requests")
    find('#6').click
    expect(page).to_not have_css('#6')
  end
end
