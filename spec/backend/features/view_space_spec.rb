
feature "Viewing Spaces" do
  before do
    sign_up
    sign_in
    create_space
  end

  scenario "Space is visible" do
    expect(page).to have_content("tiny flat")
  end

  scenario "Contact information is visible" do
    expect(page).to have_link("Book Now")
  end

  feature "Your Spaces Page" do
    scenario "User can view a list of their own spaces" do
      visit '/users/spaces'
      expect(page).to have_content("tiny flat")
    end

    scenario "Cannot view Your Spaces while not logged in" do
      sign_out
      visit '/users/spaces'
      expect(page.current_path).to eq '/space'
      expect(page).to have_content 'You must be logged in to view your Spaces'
    end
  end
end
