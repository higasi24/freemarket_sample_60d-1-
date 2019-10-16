# require 'rails_helper'
# describe User do
#   describe '#create' do
  
#     it "is valid create" do
#       user = build(:user)
#       user.valid?
#       expect(user).to be_valid
#     end

#     it "is invalid without a email" do
#       user = build(:user, email: "")
#       user.valid?
#       expect(user.errors[:email]).to include("can't be blank")
#     end

#     it "is invalid without a password" do
#       user = build(:user, password: "")
#       user.valid?
#       expect(user.errors[:password]).to include("can't be blank")
#     end

#     it "is invalid without a password_confirmation although with a password" do
#       user = build(:user, password_confirmation: "")
#       user.valid?
#       expect(user.errors[:password_confirmation]).to include("doesn't match Password")
#     end

#     it "is invalid with a duplicate email address" do
#       user = create(:user)
#       another_user = build(:user, email: user.email)
#       another_user.valid?
#       expect(another_user.errors[:email]).to include("has already been taken")
#     end

#     it "is valid with a password that has more than 7 characters,　both int & English characters mixed" do
#       user = build(:user, password: "000000d", password_confirmation: "000000d")
#       user.valid?
#       expect(user).to be_valid
#     end

#     it "is invalid with a password that has less than 6 characters although int & English characters mixed" do
#       user = build(:user, password: "00000d", password_confirmation: "00000d")
#       user.valid?
#       expect(user.errors[:password][0]).to include("is too short")
#     end


#     it "is invalid with a password that not int & English characters mixed although has more than 7 characters" do
#       user = build(:user, password: "0000000", password_confirmation: "0000000")
#       user.valid?
#       expect(user.errors[:password][0]).to include("is invalid")
#     end


#   end
# end