feature 'Search' do
  scenario 'user can filter by min and max price' do
    sign_up
    create_space
    create_space(description: 'big flat', price: '70.0', location: 'Aldgate East')
    search
    expect(page).to have_current_path('/search/results')
    expect(page).to have_content('tiny flat')
  end

  scenario 'user can filter by location' do
    sign_up
    create_space
    create_space(description: 'big flat', price: '70.0', location: 'Aldgate East')
    search(price_min: '60', price_max: '75', location: 'Aldgate East')
    expect(page).to have_current_path('/search/results')
    expect(page).to have_content('big flat')
    expect(page).to_not have_content('tiny flat')
  end
end
