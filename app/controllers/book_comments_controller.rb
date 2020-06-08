class BookCommentsController < ApplicationController

	def create
	book = Book.find(params[:book_id])
	comment = BookComment.new(book_comment_params)
	comment.user_id = current_user.id
	comment.book_id = book.id

	  if comment.save
	   redirect_back(fallback_location: root_path)
      end
    end

    def destroy
	# book_comment = BookComment.find_by(id:params[:id],book_id:params[:book_id])
	book_comment = BookComment.find(params[:id])
	book_comment.destroy
	redirect_back(fallback_location: root_path)
    end
    private
    def book_comment_params
        params.require(:book_comment).permit(:comment,:user_id,:book_id)
    end

end
