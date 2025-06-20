class MessagesController < ApplicationController
    before_action :authenticate_user!

    def index
        @order = Order.find(params[:order_id])
        if [@order.buyer_id, @order.tweet.user_id].include?(current_user.id)
        @messages = @order.messages.includes(:user)
        @message = Message.new
        else
        redirect_to root_path, alert: "アクセス権がありません"
        end
    end

    def create
        @order = Order.find(params[:order_id])
        if [@order.buyer_id, @order.tweet.user_id].include?(current_user.id)
        @message = @order.messages.build(message_params.merge(user_id: current_user.id))
            if @message.save
                redirect_to order_messages_path(@order)
            else
                render :index
            end
        else
        redirect_to root_path, alert: "不正なアクセスです"
        end
    end

    private

    def message_params
        params.require(:message).permit(:body)
    end
end
