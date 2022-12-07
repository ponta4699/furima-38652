require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ニックネームとメールアドレス、パスワードとパスワード(確認)、お名前とお名前カナが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが10文字以上の半角英数字混合であれば登録できる' do
        @user.password = '1a1a1a1a1a'
        @user.password_confirmation = '1a1a1a1a1a'
        expect(@user).to be_valid
      end
      it '名字が全角文字であれば登録できる' do
        @user.last_name = '中本'
        expect(@user).to be_valid
      end
      it '名前が全角文字であれば登録できる' do
        @user.first_name = '宏俊'
        expect(@user).to be_valid
      end
      it '名字が全角カナであれば登録できる' do
        @user.last_name = 'ナカモト'
        expect(@user).to be_valid
      end
      it '名前が全角カナであれば登録できる' do
        @user.first_name = 'ヒロトシ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'メースアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'メールアドレスは、＠を含む必要だあること' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードは、10文字以上での入力が必須であること' do
        @user.password = '000000000'
        @user.password_confirmation = '000000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードは、数字のみでは登録ができない' do
        @user.password = '1111111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードは、英字のみでは登録ができない' do
        @user.password = 'aaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードとパスワード(確認)は、値の一致が必須であること' do
        @user.password = '1234567890'
        @user.password_confirmation = '12345678901'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '１a1a1a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it '生年月日が必須であること' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end


      it '姓（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("性（全角）を入力してください")
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("性（全角）は不正な値です")
      end

      it '名（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（全角）を入力してください")
      end


      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名（全角）は不正な値です")
      end



      it '姓（カナ）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("性（カナ）を入力してください")
      end

      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('性（カナ）は不正な値です')
      end

     


      it '名（カナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）を入力してください")
      end

      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('名（カナ）は不正な値です')
      end

     

    



    end
  end
end