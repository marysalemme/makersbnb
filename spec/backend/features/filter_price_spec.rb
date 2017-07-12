
feature "filter by price" do
  scenario "user can specify min and max price" do
    sign_up
    create_space
    create_space(description: "big flat", price: "70.0", location: "Aldgate East")
    fill_in(:price_min, with: "20")
    fill_in(:price_max, with: "60")
    click_on('Search')
    expect(page).to have_current_path("/search/results")
    expect(page).to have_content("tiny flat")
  end
end
