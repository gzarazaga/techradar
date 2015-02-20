require "rails_helper"

describe Radars::BlipsController do
  include StubCurrentUserHelper

  let(:user) { create(:user) }
  let(:radar) { create(:radar, owner: user) }
  let(:blip) { double("Blip") }

  before do
    sign_in(user)
    stub_current_user_with(user)
    allow(Radar).to receive(:find).and_return(radar)
  end

  describe "GET 'new'" do
    specify do
      get :new, radar_id: radar.to_param
      expect(response).to be_successful
    end
  end

  describe "POST 'create'" do
    it "delegates to radar for new" do
      allow(user).to receive(:find_radar) { radar }
      topic = double(:topic)
      attrs = attributes_for(:blip, topic_id: topic.to_param)
      blip = double("blip", quadrant: "tools", save: true)
      allow(radar).to receive(:new_blip) { blip }

      post :create, radar_id: radar.to_param, blip: attrs

      expect(radar).to have_received(:new_blip).with(
        topic_id: topic.to_param,
        quadrant: "tools",
        ring: "adopt"
      )
    end

    it "redirects on success" do
      allow(user).to receive(:find_radar) { radar }
      attrs = attributes_for(:blip, topic_id: 1)
      blip = double("blip", quadrant: "tools", save: true)
      allow(radar).to receive(:new_blip) { blip }

      post :create, radar_id: radar.to_param, blip: attrs

      expected_path = radar_quadrant_path(radar, quadrant: "tools")
      expect(response).to redirect_to(expected_path)
    end

    it "re-renders on failure" do
      allow(user).to receive(:find_radar) { radar }
      attrs = attributes_for(:blip, topic_id: 1)
      blip = double("blip", quadrant: "tools", save: false)
      allow(radar).to receive(:new_blip) { blip }

      post :create, radar_id: radar.to_param, blip: attrs

      expect(response).to render_template("new")
    end
  end

  context "DELETE /radars/:radar_id/blips/:id" do
    let(:blip) { mock_model(Blip) }
    before { allow(radar).to receive(:find_blip) { blip } }

    it "destroys the blip" do
      pending
      expect(blip).to receive(:destroy!)
      delete "destroy", radar_id: radar.id, id: blip.id
    end

    it "redirects to the parent radar" do
      pending
      allow(blip).to receive(:destroy!)
      delete "destroy", radar_id: radar.id, id: blip.id
      expect(response).to redirect_to(radar)
    end
  end

  context "PUT /radars/:radar_id/blips/:id" do
    let(:blip) { mock_model(Blip) }
    let(:params) { { notes: "updated notes" } }
    before { allow(radar).to receive(:find_blip) { blip } }

    it "updates the blip" do
      pending
      expect(blip).to receive(:update).with("notes" => "updated notes")
      put "update", radar_id: radar.id, id: blip.id, blip: params
    end

    it "redirects to the parent radar on success" do
      pending
      allow(blip).to receive(:update) { true }
      put "update", radar_id: radar.id, id: blip.id, blip: params
      expect(response).to redirect_to(radar)
    end

    it "redirects to the parent radar on success" do
      pending
      allow(blip).to receive(:update) { true }
      put "update", radar_id: radar.id, id: blip.id, blip: params
      expect(response).to redirect_to(radar)
    end

    it "re-renders the 'edit' template in failure" do
      pending
      allow(blip).to receive(:update) { false }
      put "update", radar_id: radar.id, id: blip.id, blip: { name: "updated name" }
      expect(response).to render_template("edit")
    end
  end
end
