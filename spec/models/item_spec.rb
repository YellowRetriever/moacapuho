require 'rails_helper'


RSpec.describe Item, type: :model do
    
    describe "validetions" do
        describe "#name" do
            it { is_expected.to validate_presence_of(:text) }#必須バリデーションチェック
        end
        
        describe "#status" do
            it { is_expected.to validate_presence_of(:text) }
        end
        
        describe "#prefecture" do
            it { is_expected.to validate_presence_of(:text) }
        end
        
        describe "#city" do
            it { is_expected.to validate_presence_of(:text) }
        end
        
        describe "#address" do
            it { is_expected.to validate_presence_of(:text) }
        end
        
        describe "#text" do
            it { is_expected.to validate_presence_of(:text) }
        end
        
        describe "#provider_id" do
            it { is_expected.to validate_presence_of(:text) }
        end
    end
        
end