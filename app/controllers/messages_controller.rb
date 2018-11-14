class MessagesController < ApplicationController
    before_action :find_message, only: [:show, :edit, :update, :destroy]

    def index
        @messages = Message.all.order("created_at DESC")
    end

    def new
        @message = current_user.messages.build
    end

    def show
    end
    
    def edit
    end
    
    def update
        if @message.update(message_params)
            redirect_to message_path
        else
            redirect_to 'edit'
        end
    end

    def destroy
        if @message.destroy
            redirect_to root_path
        end
    end

    def create
        @message = current_user.messages.build(message_params)
        if @message.save
            redirect_to root_path
        else
            redirect_to 'new'
        end
    end

    private
        def message_params
            params.require(:message).permit(:title, :description)
        end
        
        def find_message
            @message = Message.find(params[:id])
        end
            
end
