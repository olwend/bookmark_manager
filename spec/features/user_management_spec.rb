feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
    expect(page).not_to have_content('password does not match confirmation')
  end

  scenario 'I cannot sign in when password does not match' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(page).to have_content('password does not match confirmation')
  end

  scenario 'I cannot sign up without entering an email' do
    expect { sign_up(email: '') }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an invalidly formatted email' do
    expect { sign_up(email: 'com.@xxx') }.not_to change(User, :count)
  end

end
