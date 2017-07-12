
feature "list of spaces" do
  scenario "user creates a space" do
    sign_up
    sign_in
    create_space
    expect(page).to have_content("tiny flat")
    expect(page).to have_content("50.0")
    expect(page).to have_content("Mile End")
    fill_in(:price_min, with: "20")
  end
end

feature "correct errors are thrown" do
  scenario "blank fields throw an error" do
    create_space(location: nil)
    expect(page).to have_content("must not be blank")
  end
end
