feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
    expect(page).not_to have_content('password does not match confirmation')
  end

  scenario 'I cannot sign in when password does not match' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'I cannot sign up without entering an email' do
    expect { sign_up(email: '') }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalidly formatted email' do
    expect { sign_up(email: 'com.@xxx') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up twice with the same email' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
