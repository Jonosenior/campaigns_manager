class CommentsController < ApplicationController
  def new
    @parent =
    @comment = Comment.new
  end

  def create
    
  end
end
