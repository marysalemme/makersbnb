

feature "host can see booking requests" do

  before do
    sign_up
    create_space
    create_booking(id: 12)
  end

  scenario "host views a page of booking requests" do
    visit("/bookings/requests")
    expect(page).to have_content("tiny flat")
    expect(page).to have_content("21/07/2017")
    expect(page).to have_content("22/07/2017")
    expect(page).to have_content("Confirm Booking")
  end
end
