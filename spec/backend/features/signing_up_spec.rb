feature 'User sign up' do
  scenario "Hello world" do
    visit '/'
    expect(page).to have_content "hello world"
  end
  
  scenario "user can signup" do
    expect { sign_up }.to change { User.count }.by(1)
  end
end
