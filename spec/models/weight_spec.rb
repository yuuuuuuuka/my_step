require 'rails_helper'

RSpec.describe Weight, type: :model do
  before do
    @weight = FactoryBot.build(:weight)
  end

  describe '体重記録機能' do
    context '体重が記録できるとき' do
      it 'すべての項目が正しく入力されている場合、ユーザーは有効である' do
        expect(@weight).to be_valid
      end
    end
    context '体重が記録できないとき' do
      it '体重が空では保存できない' do
        @weight.weight = nil
        expect(@weight.valid?).to eq(false)
        expect(@weight.errors.full_messages).to include('Weight 体重を入力してください')
      end

      it '日付が空では保存できない' do
        @weight.date = nil
        @weight.valid?
        expect(@weight.errors.full_messages).to include('Date 日付を入力してください。')
      end
      it 'ユーザーと紐付いていなければ保存できない' do
        @weight.user = nil
        @weight.valid?
        expect(@weight.errors.full_messages).to include('User ユーザーが必要です')
      end
    end
  end
end
