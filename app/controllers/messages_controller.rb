class MessagesController < ApplicationController
    def new 
        @message = Message.new
    end
    def create
        @message = Message.new(message_params)    
        if @message.save
          redirect_to root_path, notice: 'Message sent successfully!'
        else
          render :new, status: :unprocessable_entity
        end
    end
    
    private
    def message_params
        params.require(:message).permit(:sender, :receiver, :title, :body)
    end
   
  end