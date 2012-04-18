Forem::ForumsController.class_eval do
  def search
    @forum = Forem::Forum.find(params[:id])
    @topics = if forem_admin_or_moderator?(@forum)
      @forum.topics
    else
      @forum.topics.visible.approved_or_pending_review_for(forem_user)
    end

    @topics = @topics.by_pinned_or_most_recent_post.page(params[:page]).per(Forem.per_page)
  end
end
