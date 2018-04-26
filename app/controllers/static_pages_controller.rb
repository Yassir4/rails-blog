class StaticPagesController < ApplicationController
  def home
    @articles= Article.of_followed_writers(current_writer.following).order('created_at DESC').paginate(page: params[:page], per_page: 18)
    respond_to do |format|
      format.html
      format.js # add this line for your js template
    end
  end

  def about
  end

  def contact
  end
end
