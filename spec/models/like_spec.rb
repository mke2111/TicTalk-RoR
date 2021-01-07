require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Testing associations' do
    it 'belongs to a user' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      o = Talk.new(author_id: u.id, content: 'Talk one')
      e = Like.new(user_id: u.id, talk_id: o.id)
      expect(e.user_id).to eql(u.id)
    end

    it 'belongs to a talk' do
      u = User.new(username: 'Mkenya', fullname: ' Mkenya Jaj')
      u.save
      o = Talk.new(author_id: u.id, content: 'Talk one')
      e = Like.new(user_id: u.id, talk_id: o.id)
      expect(e.talk_id).to eql(o.id)
    end
  end
end
