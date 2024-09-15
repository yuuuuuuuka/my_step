require 'rails_helper'

RSpec.describe Log, type: :model do
  before do
    @log = FactoryBot.build(:log)
  end
  describe '運動投稿機能' do
    context '投稿が成功する場合' do
      it 'すべての必須項目が正しく入力されていれば出品できる' do
        expect(@log).to be_valid
      end
    end
    context '投稿が失敗する場合' do
      it '運動名が空では投稿できない' do
        @log.name = nil
        expect(@log.valid?).to eq(false)
        expect(@log.errors.full_messages).to include('Name 運動した名前を入力してください')
      end
      it '時間が空では投稿できない' do
        @log.duration = nil
        @log.valid?
        expect(@log.errors.full_messages).to include('Duration 運動時間は0分以上の整数値を入力してください。')
      end

      it '時間が半角英数字でなければ投稿できない' do
        @log.duration = '三十'
        @log.valid?
        expect(@log.errors.full_messages).to include('Duration 運動時間は0分以上の整数値を入力してください。')
      end

      it '回数が空では投稿できない' do
        @log.reps = nil
        @log.valid?
        expect(@log.errors.full_messages).to include('Reps 回数は1回以上の整数値を入力してください。')
      end

      it '回数が半角英数字でなければ投稿できない' do
        @log.reps = '十'
        @log.valid?
        expect(@log.errors.full_messages).to include('Reps 回数は1回以上の整数値を入力してください。')
      end

      it '日付が空では投稿できない' do
        @log.date = nil
        @log.valid?
        expect(@log.errors.full_messages).to include('Date 運動を行った日付を入力してください。')
      end

      it 'ユーザーと紐付いていなければ投稿できない' do
        @log.user = nil
        @log.valid?
        expect(@log.errors.full_messages).to include('User must exist')
      end
    end
  end
end
