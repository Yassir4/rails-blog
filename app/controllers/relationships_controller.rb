class RelationshipsController < ApplicationController

  def follow_writer
    @writer = Writer.find(params[:id])
    if current_writer.follow(@writer.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow_writer
    @writer = Writer.find(params[:id])
    if current_writer.unfollow(@writer.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end
end
