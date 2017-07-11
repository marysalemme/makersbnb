
feature "Viewing Bookable spaces" do
  scenario "Contact information is visible" do
    sign_up
    sign_in
    create_space
    expect(page).to have_link("Book Now")
  end
end
