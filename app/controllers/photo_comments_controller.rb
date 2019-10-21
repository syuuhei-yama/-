class PhotoCommentsController < ApplicationController
	 def create
    @photo_comment = Photo_Comment.new(photo_comment_params)
    @photo_comment.user_id = current_user.id
    @photo_comment.photo_id = params[:photo_id]
    if @photo_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  private
  def photo_comment_params
    params.require(:comment).permit(:content)
  end
end

end
