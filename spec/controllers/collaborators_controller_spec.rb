require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  include Devise::TestHelpers
  before(:each) do
    @my_user = FactoryGirl.create(:user)
    sign_in @my_user
    @collab_user = FactoryGirl.create(:user)
    @my_wiki = FactoryGirl.create(:wiki, user: @my_user)
    @my_private_wiki = FactoryGirl.create(:wiki, user: @my_user, private: true)
    @my_collaborator = FactoryGirl.create(:collaborator, user: @collab_user)
  end

  describe "POST create" do
    it "increases the number of Collaborators by 1" do
      expect { post :create, collaborator: { user_id: @my_user.id, wiki_id: @my_wiki.id }}.to change(Collaborator, :count).by(1)
    end

    it "assigns the new collaborator to @collaborators" do
      post :create, collaborator: { user_id: @my_user.id, wiki_id: @my_wiki.id }
      expect(assigns(:collaborator)).to eq Collaborator.last
    end
  end

  describe "DELETE destroy" do
    it "deletes the collaborator" do
      delete :destroy, id: @my_collaborator.id
      count = Collaborator.where({user_id: @collab_user.id}).count
      expect(count).to eq 0
    end
  end
end
