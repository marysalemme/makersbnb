feature 'Search' do
  scenario 'user can filter by min and max price' do
    sign_up
    create_space
    create_space(description: 'big flat', price: '70.0', location: 'Aldgate East')
    fill_in(:price_min, with: '20')
    fill_in(:price_max, with: '60')
    fill_in(:location, with: 'Mile End')
    click_on('Search')
    expect(page).to have_current_path('/search/results')
    expect(page).to have_content('tiny flat')
  end

  scenario 'user can filter by location' do
    sign_up
    create_space
    create_space(description: 'big flat', price: '70.0', location: 'Aldgate East')
    fill_in(:price_min, with: '60')
    fill_in(:price_max, with: '75')
    fill_in(:location, with: 'Aldgate East')
    click_on('Search')
    expect(page).to have_current_path('/search/results')
    expect(page).to have_content('big flat')
    expect(page).to_not have_content('tiny flat')
  end
end
