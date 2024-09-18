require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe "GET #new" do
    it "assigns a new Registration to @registration" do
      get :new
      expect(assigns(:registration)).to be_a_new(Registration)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    let(:registration) { create(:registration) }

    it "assigns the requested registration to @registration" do
      get :edit, params: { id: registration.id }
      expect(assigns(:registration)).to eq(registration)
    end

      it "renders the edit template" do
        get :edit, params: { id: registration.id }
        expect(response).to render_template(:edit)
      end
    end

    describe "GET #index" do
      it "assigns all registrations to @registrations" do
        registration1 = create(:registration)
        registration2 = create(:registration)
        get :index
        expect(assigns(:registrations)).to match_array([registration1, registration2])
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "DELETE #destroy" do
      let!(:registration) { create(:registration) }

      it "destroys the requested registration" do
        expect {
          delete :destroy, params: { id: registration.id }
        }.to change(Registration, :count).by(-1)
      end

      it "redirects to the registrations list" do
        delete :destroy, params: { id: registration.id }
        expect(response).to redirect_to(registrations_path)
      end

      it "sets a success notice" do
        delete :destroy, params: { id: registration.id }
        expect(flash[:notice]).to eq('ลบข้อมูลสำเร็จ')
      end
    end

    describe "GET #confirm_delete" do
    let(:registration) { create(:registration) }

    it "assigns the requested registration to @registration" do
      get :confirm_delete, params: { id: registration.id }, format: :turbo_stream
      expect(assigns(:registration)).to eq(registration)
    end

    it "returns a successful turbo_stream response" do
      get :confirm_delete, params: { id: registration.id }, format: :turbo_stream
      expect(response.media_type).to eq Mime[:turbo_stream]
      expect(response).to have_http_status(:success)
    end

    it "includes the registration id in the response" do
      get :confirm_delete, params: { id: registration.id }, format: :turbo_stream
      expect(response.body).to include("confirm_delete_#{registration.id}")
    end
  end

    describe "PATCH #update" do
      let(:registration) { create(:registration) }
      let(:valid_attributes) { { first_name: "New Name" } }
      let(:invalid_attributes) { { email: "" } }

      context "with valid params" do
        it "updates the requested registration" do
          patch :update, params: { id: registration.id, registration: valid_attributes }
          registration.reload
          expect(registration.first_name).to eq("New Name")
        end

        it "redirects to the registrations list" do
          patch :update, params: { id: registration.id, registration: valid_attributes }
          expect(response).to redirect_to(registrations_path)
        end

        it "sets a success notice" do
          patch :update, params: { id: registration.id, registration: valid_attributes }
          expect(flash[:notice]).to eq('ข้อมูลถูกอัพเดตเรียบร้อยแล้ว')
        end
      end

      context "with invalid params" do
        it "does not update the registration" do
          patch :update, params: { id: registration.id, registration: invalid_attributes }
          registration.reload
          expect(registration.email).not_to be_empty
        end

        it "re-renders the edit template" do
          patch :update, params: { id: registration.id, registration: invalid_attributes }
          expect(response).to render_template(:edit)
        end
      end
    end

    describe "POST #create" do
      let(:valid_attributes) { attributes_for(:registration) }
      let(:invalid_attributes) { attributes_for(:registration, email: "") }

      context "with valid params" do
        it "creates a new Registration" do
          expect {
            post :create, params: { registration: valid_attributes }
          }.to change(Registration, :count).by(1)
        end

        it "redirects to the registrations list" do
          post :create, params: { registration: valid_attributes }
          expect(response).to redirect_to(registrations_path)
        end

        it "sets a success notice" do
          post :create, params: { registration: valid_attributes }
          expect(flash[:notice]).to eq('ส่งข้อมูลลงทะเบียนเรียบร้อยแล้ว!')
        end
      end

      context "with invalid params" do
        it "does not create a new Registration" do
          expect {
            post :create, params: { registration: invalid_attributes }
          }.to_not change(Registration, :count)
        end

        it "re-renders the new template" do
          post :create, params: { registration: invalid_attributes }
          expect(response).to render_template(:new)
        end
      end
    end
end
