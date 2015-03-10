module Domain
  class PostProcessor
    include ActiveDomain::CommandProcessor
    process DeletePostCommand do |command|
      if command.valid?
        event DeletedPostEvent.new command.to_hash
      end
    end

    process UpdatePostCommand do |command|
      if command.valid?
        event UpdatedPostEvent.new command.to_hash
      end
    end

    process CreatePostCommand do |command|
      if command.valid?
        id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
        event CreatedPostEvent.new command.to_hash.merge(id: id)
      end
    end

  end
end
