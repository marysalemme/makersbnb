feature 'Booking a Space' do
  scenario 'User can book a space' do
    sign_up
    create_space
    visit '/bookings/new'
    fill_in :space_id, with: '1'
    fill_in :start_date, with: "21/7/2017"
    fill_in :end_date, with: "22/7/2017"
    click_button("Book")
    expect(Booking.count).to eq 1
  end
end
