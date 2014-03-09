require 'spec_helper'

describe IssuesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:issue) { FactoryGirl.create(:issue, user: user) }

  describe 'GET #show' do
    it "assigns the requested issue to @issue" do
      get :show, id: issue
      expect(assigns(:issue)).to eq issue
    end

    it "renders the :show template" do
      get :show, id: issue
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "requires login" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'GET #edit' do
    it "requires login" do
      get :edit, id: issue
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "administrator access" do
    before do
      login_user user
    end

    describe 'GET #new' do
      it "assigns a new Issue to @issue" do
        get :new
        expect(assigns(:issue)).to be_a_new(Issue)
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      it "assigns the requested issue to @issue" do
        get :edit, id: issue
        expect(assigns(:issue)).to eq issue
      end

      it "renders the :edit template" do
        get :edit, id: issue
        expect(response).to render_template :edit
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new issue in the database" do
          expect{post :create, issue: FactoryGirl.attributes_for(:issue)}.to change(Issue, :count).by(1)
        end
        it "redirects to issues#show" do
          post :create, issue: FactoryGirl.attributes_for(:issue)
          expect(response).to redirect_to issue_path(assigns[:issue])
        end
      end

      context "with invalid attributes" do
        it "does not save the new issue in the database" do
          expect{post :create,issue: FactoryGirl.attributes_for(:issue, title: nil, description: nil)}.to_not change(Issue, :count)
        end

        it "re-renders the :new template" do
          post :create,issue: FactoryGirl.attributes_for(:issue, title: nil, description: nil)
          expect(response).to render_template :new
        end
      end
    end

    describe 'PUT #update' do
      context "valid attributes" do
        it "located the requested @issue" do
          put :update, id: issue, issue: FactoryGirl.attributes_for(:issue)
          expect(assigns(:issue)).to eq(issue)
        end

        it "changes issue's attributes" do
          put :update, id: issue,issue: FactoryGirl.attributes_for(:issue, title: 'Title', description: 'go to work')
          issue.reload
          expect(issue.title).to eq("Title")
          expect(issue.description).to eq("go to work")
        end

        it "redirects to the updated issue" do
          put :update, id: issue, issue: FactoryGirl.attributes_for(:issue)
          expect(response).to redirect_to @issue
        end
      end

      context "with invalid attributes" do
        it "does not change the issue's attributes" do
          put :update, id: issue, issue: FactoryGirl.attributes_for(:issue, title: nil)
          issue.reload
          expect(issue.title).to eq("#{issue.title}")
          expect(issue.description).to eq("#{issue.description}")
        end

        it "re-renders the edit template" do
          put :update, id: issue, issue: FactoryGirl.attributes_for(:issue, description: nil)
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE destroy' do
      it "deletes the issue" do
        issue
        expect{delete :destroy, id: issue}.to change(Issue,:count).by(-1)
      end

      it "redirects to issues#index" do
        delete :destroy, id: issue
        expect(response).to redirect_to issues_path
      end
    end
  end

  describe "GET search_issue" do
    it "returns the issue" do
      get :search, title: issue.title
      expect(issue.reload.present?).to be_true
    end

    it "redirects to issue#show" do
      get :search, title: issue.title
      expect(response).to render_template :search
    end
  end
end
