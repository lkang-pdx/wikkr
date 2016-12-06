require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  let(:user) { FactoryGirl.create(:user, email: "test@example.com") }
  let(:wiki) { FactoryGirl.create(:wiki, user: user) }
  let(:collaborator) { FactoryGirl.create(:collaborator, user_id: user.id, wiki_id: wiki.id)}

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:wiki) }

  describe "attributes" do
    it "has a user_id and a wiki_id" do
      expect(collaborator).to have_attributes(user_id: user.id, wiki_id: wiki.id)
    end
  end
end
