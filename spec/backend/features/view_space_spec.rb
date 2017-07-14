
feature "Viewing Spaces" do
  before do
    sign_up
    sign_in
    create_space
  end

  feature "Spaces Index" do
    scenario "Space is visible" do
      expect(page).to have_content("tiny flat")
    end

    scenario "Contact information is visible" do
      expect(page).to have_link("Book Now")
    end
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

  feature "Listing Status Page" do
    scenario "Each page has a listing status page" do
      click_on "View Details"
      expect(page).to have_content("tiny flat")
      expect(page).to have_content("Price: £50.0")
      expect(page).to have_content("Location: Mile End")
    end

    feature "Available Spaces" do
      scenario "Space is listed as available" do
        visit '/space'
        click_on "View Details"
        expect(page).to have_link "Book Now"
      end
    end

    feature "Unavailable Spaces" do
      let(:today)    { Date.today }
      let(:tomorrow) { Date.today + 1}

      before do
        click_on("Book Now")
        fill_in :start_date, with: "#{today.strftime("%d/%m/%Y")}"
        fill_in :end_date, with: "#{tomorrow.strftime("%d/%m/%Y")}"
        click_button("Book")
      end

      scenario "Space is listed as unavailable" do
        visit '/space'
        click_on "View Details"
        expect(page).not_to have_link "Book Now"
        expect(page).to have_content "Next available: #{tomorrow.strftime("%d/%m/%Y")}"
      end
    end
  end
end
