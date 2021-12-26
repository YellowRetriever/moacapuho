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
    
    
    
    describe "#show" do
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
    
    
    
    describe "#new" do
        it "response success" do
            get "/items/new"
            expect(response.status).to eq(200)
        end
    end
    
    
    
    describe "#create" do
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
        
        context "登録成功" do
            let(:item) {build(:item, provider_id: provider.id)}
            let(:params) { {item: {name: item.name, status: item.status, prefecture: item.prefecture, city: item.city, address: item.address, text: item.text, show_count: item.show_count}} }
            let(:created_item) { Item.last }
        end
        it "response redirect" do#登録成功したら一覧が返されるか
            post "/items", params: params
            expect(response.status).to redirect_to item_path(created_item.id)
        end
        it "response redirect" do
            expect {
                post "/items", params: params
            }.to change{ Item.count }.by(1)
        end
    end
    
    
    
    describe "#edit" do
        let!(:item){create(:item, provider_id: provider.id)}
        
        context "target exist" do
            it "response success" do
                get "/items/#{item.id}/edit"
                expect(response.status).to eq(200)
            end
            
            it "render item" do
                get "/items/#{todo.id}/edit"
                expect(response.body).to include item.text
            end
        end
        
        context "target un exist" do
            it "response success" do
                expect {
                    get "/items/0/edit"
                }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end



    describe "#update" do
        context "update failure" do
            let(:item) {create(:item, provider_id: provider.id)}
            let(:params) { {item: {name: "", status: item.status, prefecture: item.prefecture, city: item.city, address: item.address, text: item.text, show_count: item.show_count}} }
            
            it "response success" do
              patch "/items/#{item.id}", params: params
              expect(response.status).to eq(200)
            end
            it "render edit" do
                patch "/items/#{item.id}", params: params
                expect(response.body).to include "Editing Item"
            end
        end
        
        context "update success" do
            let(:item) {create(:item, provider_id: provider.id)}
            let(:params) { {item: {name: item.name + " updated", status: item.status, prefecture: item.prefecture, city: item.city, address: item.address, text: item.text, show_count: item.show_count}} }
            
            it "response redirect" do
                patch "/items/#{item.id}", params: params
                expect(response.status).to redirect_to item_path(item.id)
            end
        end
        
    end
    
    
    
    describe "#destroy" do
        context "削除成功" do
            let!(:item) {create(:item, provider_id: provider.id)}
            it "delete success" do
            expect {
                delete "/items/#{item.id}"
            }.to change{Item.count}.by(-1)
            end

            it "response redirect" do
              delete "/items/#{item.id}"
                expect(response.status).to redirect_to items_path
            end
        end
    end
    
end

    