# AwaitManager by z64 (https://github.com/z64)
#
# https://gist.github.com/z64/664da118788889ce4740d4a62abd38e8
module Granz
  class ReactionAwaitManager
    class Timeout
      INSTANCE = new
    end

    def initialize
      @handlers = [] of Proc(Discord::Gateway::MessageReactionPayload, Bool)

      BOT.on_message_reaction_add do |payload|
        @handlers.dup.each do |handler|
          @handlers.delete(handler) if handler.call(payload)
        end
      end
    end

    private def on_message_reaction_add(&block : Discord::Gateway::MessageReactionPayload -> Bool)
      @handlers << block
    end

    def await_user(id : Discord::Snowflake, timeout : Time::Span? = nil)
      reaction = Reaction(Discord::Gateway::MessageReactionPayload | Timeout).new(1)

      if timeout
        spawn do
          sleep timeout.not_nil!
          reaction.send(Timeout::INSTANCE)
        end
      end

      spawn do
        on_message_reaction_add do |payload|
          if payload.user_id == id
            reaction.send(payload)
            true
          else
            false
          end
        end
      end

      reaction.receive
    end
  end
end
