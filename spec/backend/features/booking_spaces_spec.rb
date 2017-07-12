
feature 'Booking a Space' do
  scenario 'User can book a space' do
    sign_up
    create_space
    expect{create_booking}.to change(Booking, :count).by(1)
  end
  scenario "User gets a confirmation page" do
    sign_up
    create_space
    create_booking
    expect(page).to have_content("21/7/2017")
    expect(page).to have_content("22/7/2017")
  end
  scenario "Booking form is specific to space" do
    sign_up
    create_space(description: "big flat")
    create_space(description: "medium flat")
    create_space(description: "small flat")
    create_space
    click_on("#space2")
    expect(page).to have_content("medium flat")
  end

  # three/four space. Pick middle - then make sure middle is rendered on book form.

end
