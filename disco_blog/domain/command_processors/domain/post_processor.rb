module Domain
  class PostProcessor
    include ActiveDomain::CommandProcessor

    process PostDeleteCommand do |command|
      command.is_valid_do { event PostDeleteEvent.new command.to_hash }
    end

    process PostUpdateCommand do |command|
      command.is_valid_do { event PostUpdateEvent.new command.to_hash }
    end

    process PostCreateCommand do |command|
      command.id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
      command.is_valid_do { event PostCreateEvent.new command.to_hash }
    end
  end
end