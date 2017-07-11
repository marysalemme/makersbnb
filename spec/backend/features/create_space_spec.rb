
feature "list of spaces" do
  scenario "user creates a space" do
    visit '/space'
    fill_in "description", with: "tiny flat"
    fill_in "price", with: "50.0"
    fill_in "location", with: "Mile End"
    click_on("List space")
    expect(page).to have_content("tiny flat")
    expect(page).to have_content("50.0")
    expect(page).to have_content("Mile End")
  end
end

feature "correct errors are thrown" do
  scenario "blank fields throw an error" do
    visit '/space'
    fill_in "description", with: "tiny flat"
    fill_in "price", with: "50.0"
    click_on("List space")
    expect(page).to have_content("must not be blank")
  end
end
