require 'rails_helper'

RSpec.describe 'Sign in page', type: :system do
  describe 'sign in page' do
    it 'shows the sign in page' do
      visit 'sessions/new'
      expect(page).to have_content('Sign in')
    end
  end

  describe 'sign up page' do
    it 'shows the sign up page' do
      visit 'users/new'
      expect(page).to have_content('Sign Up')
    end
  end
end
