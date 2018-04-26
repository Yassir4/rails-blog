class StaticPagesController < ApplicationController
  def home
    @articles= Article.of_followed_writers(current_writer.following).order('created_at DESC')
  end

  def about
  end

  def contact
  end
end
