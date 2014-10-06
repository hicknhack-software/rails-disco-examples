module Domain
  class MessageProcessor
    include ActiveDomain::CommandProcessor
    process DeleteMessageCommand do |command|
      if command.valid?
        event DeletedMessageEvent.new command.to_hash
      end
    end

    process UpdateMessageCommand do |command|
      if command.valid?
        event UpdatedMessageEvent.new command.to_hash
      end
    end

    process CreateMessageCommand do |command|
      if command.valid?
        id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
        event CreatedMessageEvent.new command.to_hash.merge(id: id)
      end
    end

  end
end
