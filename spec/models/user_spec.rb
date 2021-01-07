require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      u = User.new
      expect(u).to be_a(Object)
    end

    it 'assigns the values passed' do
      u = User.new({ username: 'Mkenya' })
      expect(u.username).to eql('Mkenya')
    end
  end

  context 'validation test' do
    it 'ensures username and fullname of user is present' do
      user = User.new(username: 'Mkenya').save
      expect(user).to eq(false)
    end

    it 'ensures minimum length for name to be 3' do
      user = User.new(username: 'Mk', fullname: 'Mkenya Jaj').save
      expect(user).to eq(false)
    end

    it 'ensures max length for name to be 3' do
      user = User.new(username: 'Mkenya Mkenya Mkenya Mkenya Mkenya', fullname: 'Mkenya Jaj').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(username: 'Mkenya', fullname: 'Mkenya Jaj').save
      expect(user) == true
    end

    it 'validates Username uniqueness' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      u2 = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      expect(u2.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'has many talks' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      expect(u.talks.empty?).to be_truthy
    end

    it 'has many follower_relationships' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      expect(u.follower_relationships.empty?).to be_truthy
    end

    it 'has many followers' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      expect(u.followers.empty?).to be_truthy
    end

    it 'has many following_relationships' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      expect(u.following_relationships.empty?).to be_truthy
    end

    it 'has many following' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      expect(u.following.empty?).to be_truthy
    end
  end
end
