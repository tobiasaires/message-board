class CommentsController < ApplicationController
    
    before_action :find_message
    before_action :find_comment, only: [:edit, :update, :destroy]

    def create
        @comment.user_id = current_user.id

        if @comment.save
            redirect_to message_path(@message)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @comment.update(comments_params)
            redirect_to message_path(@message)
        else
            render 'edit'
        end
    end

    private

        def comments_params
            params.require(:comment).permit(:content)
        end

        def find_message
           @message =  Message.find(params[:message_id])
        end

        def find_comment
           @comment =  @message.comments.find(params[:id])
        end
end
