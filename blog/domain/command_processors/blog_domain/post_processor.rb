module BlogDomain
  class PostProcessor
    include ActiveDomain::CommandProcessor

    process Blog::PostCreate do |command|
      command.id = unique_id
      command.is_valid_do { event Blog::PostCreated.new command.to_hash.merge(posted_at: DateTime.now.utc) }
    end

    process Blog::PostUpdate do |command|
      command.is_valid_do { event Blog::PostUpdated.new command.to_hash }
    end

    process Blog::PostDelete do |command|
      command.is_valid_do { event Blog::PostDeleted.new command.to_hash }
    end

    private

    def unique_id
      Post.unique_id
    end
  end
end
