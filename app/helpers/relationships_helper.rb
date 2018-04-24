module RelationshipsHelper
    def current_writer_is_following(current_writer_id, followed_writer_id)
        relationship = Relationship.find_by(follower_id: current_writer_id, following_id: followed_writer_id)
        return true if relationship
    end
end
