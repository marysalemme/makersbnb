
feature "Viewing Bookable spaces" do
  scenario "Contact information is visible" do
    create_space
    expect(page).to have_link("Book Now")
  end
end
