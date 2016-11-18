
require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:my_user) { create(:user) }
  let(:wiki) { create(:wiki, user: my_user) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_least(5) }

  describe "attributes" do
    it "has title and body attributes" do
      expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, user: my_user, private: false)
    end

    it "is public by default" do
      expect(wiki.private).to be(false)
    end
  end
end
