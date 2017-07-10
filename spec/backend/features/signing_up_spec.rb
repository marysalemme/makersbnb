feature 'User sign up' do
  scenario "user can signup" do
    expect { sign_up }.to change { User.count }.by(1)
  end

  scenario "Sends user to homepage after registration" do
    sign_up
    expect(page.current_path).to eq '/'
  end

  feature 'Incorrect Sign ups' do
    scenario 'does not make account if password confirmation is wrong' do
      expect { sign_up(password: 'wrong') }.to_not change(User, :count)
    end

    scenario 'shows an error on non-matching passwords' do
      sign_up(password: 'very wrong')
      expect(page).to have_content 'Password does not match the confirmation'
    end

    feature 'Bad Emails' do
      scenario "can't sign up without entering an email address" do
        expect { sign_up(email: nil) }.to_not change(User, :count)
        expect(page).to have_content "Email must not be blank"
      end

      scenario "can't sign up twice with the same email" do
        sign_up
        expect { sign_up }.to_not change(User, :count)
        expect(page).to have_content "Email is already taken"
      end
    end

    feature "Bad Usernames" do
      scenario "can't sign up without a username" do
        expect { sign_up(username: nil) }.to_not change(User, :count)
        expect(page).to have_content "Username must not be blank"
      end

      scenario "can't sign up twice with the same username" do
        sign_up
        expect { sign_up }.to_not change(User, :count)
        expect(page).to have_content "Username is already taken"
      end
    end
  end
end
