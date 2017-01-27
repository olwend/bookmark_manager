feature "users can sign in" do
  scenario "i'm logged" do
    sign_up
    sign_up email: "otherguy@guy.com"
    visit 'session/new'

    fill_in('email', with:'alice@example.com')
    fill_in('password', with:'12345678')
    click_button('Log in')

    expect(page).to have_content ("log in successfull, alice@example.com")
  end
end
