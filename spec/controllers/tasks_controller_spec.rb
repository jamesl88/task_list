require 'rails_helper'

describe TasksController do
  let(:task) { FactoryGirl.create(:task) }

  describe "GET index" do
    before { get :index }
    it { expect(response).to be_success }
  end

  describe "GET new" do
    before { get :new }

    it { expect(response).to be_success }
  end

  describe "POST create" do
    let(:params) {
      {
        name: 'Create rails project',
        complete: true
      }
    }

    before do
      post :create, task: params, format: :js
    end

    it { expect(response).to be_success }
    it { expect(Task.last.name).to eq 'Create rails project' }
    it { expect(Task.last.complete).to eq true }

    it { expect{ post :create, task: params, format: :js }.to change(Task, :count).by(1) }
  end

  describe "PATCH update" do
    let(:params) {
      {
        name: 'Create new rails project',
        complete: true
      }
    }

    before do
      patch :update, id: task.id, task: params, format: :js
    end

    it { expect(Task.last.name).to eq 'Create new rails project' }
    it { expect(Task.last.complete).to eq true }
  end

  describe "DELETE destroy" do
    before do
      delete :destroy, id: task.id, format: :js
    end

    it { expect(Task.count).to eq 0 }
  end

end
