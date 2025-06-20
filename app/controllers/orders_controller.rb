class OrdersController < ApplicationController
    before_action :authenticate_user!

    def create
        tweet = Tweet.find(params[:tweet_id])
        order = Order.create(tweet: tweet, buyer: current_user)
        redirect_to order_messages_path(order)
    end

    def destroy
        @order = Order.find(params[:id])
        # 出品者だけが中止可能
        if @order.tweet.user_id == current_user.id
            @order.destroy
            redirect_to tweet_path(@order.tweet), notice: "取引を中止しました。商品は再び購入可能です。"
        else
            redirect_to root_path, alert: "権限がありません。"
        end
    end
end
