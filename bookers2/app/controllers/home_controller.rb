class HomeController < ApplicationController
  def top
  	# ログイン状態に応じて、表示するページを変更
  	if user_signed_in?
  		redirect_to user_path(current_user.id)
  	end
  end

  def about
  end
end
