require 'rails_helper'

describe 'the signin process', type: :feature do
  before :each do
    User.create(username: 'Mkenya', fullname: ' Mkenya Jaj')
  end

  it 'signs @user in' do
    visit '/sessions/new'
    fill_in 'Username', with: 'Mkenya'
    click_button 'Sign in'
    expect(current_path).to eq(talks_path)
    expect(page).to have_text('Log in successful')
  end
end
