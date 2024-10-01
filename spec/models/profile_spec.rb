require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロフィール作成機能' do
    context '作成が成功する場合' do
      it 'すべての必須項目が正しく入力されていれば作成できる' do
        expect(@profile).to be_valid
      end
    end

    context '作成が失敗する場合' do
      it 'ユーザーが紐付いていなければ作成できない' do
        @profile.user = nil
        expect(@profile.valid?).to eq(false)
        expect(@profile.errors.full_messages).to include('User must exist')
      end

      it '体重が空では作成できない' do
        @profile.weight = nil
        expect(@profile.valid?).to eq(false)
        expect(@profile.errors.full_messages).to include("Weight can't be blank")
      end

      it '身長が空でも作成できる' do
        @profile.height = nil
        expect(@profile).to be_valid
      end
    end
  end
end
