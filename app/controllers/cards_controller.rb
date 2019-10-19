class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end

  def edit
    if @card.present?
      Payjp.api_key = "sk_test_cfbdb30c289d9e6dfcd07fde"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      # binding.pry

      # 《＋α》 登録しているカード会社のブランドアイコンを表示するためのコードです。---------
      @card_brand = @card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcbcard.png"
      when "MasterCard"
        @card_src = "mastercard.png"
      when "American Express"
        @card_src = "americanexpress.png"
      when "Diners Club"
        @card_src = "dinersclub.png"
      when "Discover"
        @card_src = "discover.png"
      end
      # ---------------------------------------------------------------
    end
  end

  def destroy #PayjpとCardのデータベースを削除
    Payjp.api_key = "sk_test_cfbdb30c289d9e6dfcd07fde"
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      redirect_to credit_user_path(current_user.id), notice: "削除しました"
    else #削除に失敗した時にアラートを表示します。
      redirect_to action: "edit", alert: "削除できませんでした"
    end
  end

 # indexアクションはここでは省略

#  def create #PayjpとCardのデータベースを作
#   Payjp.api_key = 'sk_test_cfbdb30c289d9e6dfcd07fde'

#   if params['payjp-token'].blank?
#     redirect_to action: "new"
#   else
#     # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
#     customer = Payjp::Customer.create(card: params["payjp-token"])
#     # customer = Payjp::Customer.create(
#     #   description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
#     #   email: current_user.email,
#     #   card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
#     #   metadata: {user_id: current_user.id} # 無くてもOK。
#     # )
#     @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
#     if @card.save
#       redirect_to action: "index"
#     else
#       redirect_to action: "create"
#     end
#   end
# end
  def create #PayjpとCardのデータベースを作成
    @url = request.referer
    Payjp.api_key = 'sk_test_cfbdb30c289d9e6dfcd07fde'
    if params['payjp-token'].blank? 
      # && @url.match(/\/users\/\d+\/save/)
      redirect_to edit_user_path(current_user.id)
    elsif params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(card: params["payjp-token"])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save && @url.match(/\/users\/\d+\/save/)
        redirect_to edit_card_path(current_user.id)
      elsif @card.save
        redirect_to action: "index"
      elsif @url.match(/\/users\/\d+\/save/)
        redirect_to save_user_path(current_user.id)
      else
        redirect_to action: "create"
      end
    end
  end
  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
