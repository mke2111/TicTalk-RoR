require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      f = Following.new
      expect(f).to be_a(Object)
    end
  end

  context 'Attribute validations' do
    it 'validates following without users to be invalid' do
      f = Following.new
      expect(f.valid?).to be_falsy
    end

    it 'checks that a user doesnt follow themselves' do
      u = User.new(username: 'Sanchez', fullname: 'Rick Sanchez')
      u.save
      f = Following.new(follower_id: u.id, followed_id: u.id)
      expect(f.valid?).to be_falsy
    end

    it 'finds the relationship object with correct attributes to be valid' do
      u = User.new(username: 'Sanchez', fullname: 'Rick Sanchez')
      u.save
      u2 = User.new(username: 'Sanchez2', fullname: 'Rick Sanchez')
      u2.save
      f = Following.new(follower_id: u.id, followed_id: u2.id)
      expect(f.valid?).to be_truthy
    end
  end

  context 'Association tests' do
    it 'associates follower and followed' do
      u = User.new(username: 'Sanchez', fullname: 'Rick Sanchez')
      u.save
      u2 = User.new(username: 'Sanchez2', fullname: 'Rick Sanchez')
      u2.save
      f = Following.new(follower_id: u.id, followed_id: u2.id)
      expect(f.follower.username).to eql(u.username)
      expect(f.followed.username).to eql(u2.username)
    end
  end
end
