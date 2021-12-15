require 'rails_helper'


RSpec.describe ItemsController, type: :request do
    
    describe "#index" do
        
            context "items exist" do
                let!(:items){create_list(:item, 3)}
                it "response success" do
                    get "/items"
                    expect(response.status).to eq(200)
                end
                it "render blogs" do
                    get "/blogs"
                    blogs.each do |b|
                        expect(response.body).to include b.title
                    end
                end
            end
            
        end
        
end

    