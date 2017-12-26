require 'rails_helper'

RSpec.describe PostsController, type: :controller do

	describe "GET #index" do
		it "renders the index template" do

			get :index
			expect(response).to render_template :index

		end

	end

	describe "GET #show" do
  		it "renders the show template" do
    	post = FactoryGirl.create(:post)
    	get :show, params: {id:post.id}   
    	expect(response).to render_template :show
  		end
	end


	describe "GET #new" do
		it "renders the new template" do
			get :new
			expect(response).to render_template :new
		end
	end


	describe "POST #create" do
		it "creates a new post" do
		end

		it "redirects_to root_path" do
		end
		context "when attributes are valid" do
  			it "creates a new post" do
    		expect {post :create, params:{post: FactoryGirl.attributes_for(:post)} }.to change(Post, :count).by(1)
  			end
  			it "redirects to root_path" do
    		post :create, params:{post: FactoryGirl.attributes_for(:post)}
   			 expect(response).to redirect_to root_path
  			end
		end

		context "when attributes are invalid" do
			it "doesn't create a new post" do
				expect{post :create, params:{post: FactoryGirl.attributes_for(:invalid_post)}}.to change(Post, :count).by(0)
			end
			it "renders the new template" do
				post :create, params:{post: FactoryGirl.attributes_for(:invalid_post)}
				expect(response).to render_template :new
			end
		end
	end

	describe "GET #edit" do
		it "edits the existing post" do
			post = FactoryGirl.create(:post)
			get :edit,params:{id:post.id}
			expect(response).to render_template :edit

		end
	end
end
