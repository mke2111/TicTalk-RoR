require 'rails_helper'

RSpec.describe Talk, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      o = Talk.new
      expect(o).to be_a(Object)
    end

    it 'assigns the values passed' do
      o = Talk.new({ content: 'Talk one' })
      expect(o.content).to eql('Talk one')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      o = Talk.new
      expect(o.valid?).to be_falsy
    end

    it 'validates the object with proper attributes to be valid' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      o = Talk.new(author_id: u.id, content: 'Talk one')
      expect(o.valid?).to be_truthy
    end

    it 'validates text presence' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      o = Talk.new(author_id: u.id, content: ' ')
      expect(o.valid?).to be_falsy
    end

    it 'should save successfully' do
      talk = Talk.new(content: 'Test content', author_id: 1).save
      expect(talk) == true
    end
  end

  context 'Testing associations' do
    it 'belongs to a user' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      o = Talk.new(author_id: u.id, content: 'Talk one')
      expect(o.author.username).to eql(u.username)
    end
  end
end
