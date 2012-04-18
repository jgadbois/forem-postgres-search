Forem::ForumsController.class_eval do
  def search
    @forum = Forem::Forum.find(params[:id])
    @search = params[:q]

    @topics = Forem::Topic.search(@search).where(:forum_id => @forum.id)

    unless forem_admin_or_moderator?(@forum)
      @topics = @topics.visible.approved_or_pending_review_for(forem_user).search(@search) 
    end
    
    @topics = @topics.by_pinned_or_most_recent_post.page(params[:page]).per(Forem.per_page)
  end
end
