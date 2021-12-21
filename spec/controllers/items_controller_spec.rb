require 'rails_helper'


RSpec.describe ItemsController, type: :request do
    let(:provider) { create(:provider) }
    
    
    
    context "not auth" do#ログインしてない時
        describe "index" do
            it "redirect sign in" do
                get "/items"
                expect(response.status).to redirect_to new_provider_session_path
            end
        end
    end
    
    
    
    context "authenticated" do#ログインしている時
        before do
            sign_in provider
        end
        
        describe "#index" do
            context "item blank" do#データが空の時
                it "response success" do
                    get "/items"
                    expect(response.status).to eq(200)
                end#処理が正常に行われるか
            end
            
            context "items exist" do#データがある時
                let!(:items){create_list(:item, 3,　provider_id: provider.id)}
                it "response success" do
                    get "/items"
                    expect(response.status).to eq(200)
                end
                
                it "render items" do#一覧画面にレンダリングされた時正常にHTMLが表示されているか
                    get "/items"
                    items.each do |i|
                        expect(response.body).to include i.text
                    end
                end
            end
        end
    end
    
    
    
    context "#show" do
        context "target exist" do#存在するid送られた時
            let!(:item){create(:item, provider_id: provider.id)}

            it "response success" do#正常に処理されるか
                get "/items/#{item.id}"
                expect(response.status).to eq(200)
            end
            it "render items" do#一覧画面にレンダリングされた時正常にHTML表示されているか
                get "/items/#{item.id}"
                expect(response.body).to include item.text
            end
        end
        
        context "target un exist" do#存在しないid送られた時
            it "response success" do
                expect {
                    get "/items/0"
                }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
    
    
    
    context "#new" do
        it "response success" do
            get "/items/new"
            expect(response.status).to eq(200)
        end
    end
    
    
    
    context "#create" do
        context "validation error" do#必須項目エラー
            let(:params) { {item: {name: ""}} }
            it "response success" do
                post "/items", params: params
                expect(response.status).to eq(200)
            end
            
            it "render new" do#new画面にレンダリングされるか
                post "/items", params: params
                expect(response.body).to include "New item"
            end
            
            it "render error" do#レンダリング失敗
                post "/items", params: params
                expect(response.body).to include "Missing create"
            end
        end
    end
    
    context "#edit" do
    end

    context "#update" do
    end
    
    context "#destroy" do
    end
    
end

    