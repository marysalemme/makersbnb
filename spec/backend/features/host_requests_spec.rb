

feature "host can see booking requests" do

  before do
    sign_up
    create_space
    # create_booking(id: 13)
  end

  scenario "host views a page of booking requests" do
    create_booking(id: 12)
    visit("/bookings/requests")
    expect(page).to have_content("tiny flat")
    expect(page).to have_content("21/07/2017")
    expect(page).to have_content("22/07/2017")
    expect(page).to have_content("Confirm Booking")
  end

  scenario "host can confirm a booking" do
    create_booking(id: 13)
    visit("/bookings/requests/:id")
    click_button("booking4")
    # p Space.get(13).bookings[0]
    expect(Space.get(13).bookings[0].approval).to be true

  end
end
