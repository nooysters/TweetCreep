require 'rails_helper'

RSpec.feature "UserSignIns", type: :feature do
  describe "the sign in process" do
    self.use_transactional_fixtures = false

    it "logs in user" do
      visit '/users/sign_in'

      user = create(:user)

      within ".starter-template" do
        fill_in 'Email', with:  user.email
        fill_in 'user[password]', with: user.password
        click_button "Log in"
      end

      expect(page).to have_content 'Creeping as'
    end
  end
end
