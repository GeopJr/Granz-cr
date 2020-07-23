# AwaitManager by z64 (https://github.com/z64)
#
# https://gist.github.com/z64/664da118788889ce4740d4a62abd38e8

## Example
# response = Granz::ReactionAwaitManager.new.await_manager.await_user(payload.author.id, 30.seconds)
# case response
# when Discord::Message
#   BOT.create_message(payload.channel_id, "Input: #{response.content}")
# when Granz::ReactionAwaitManager::Timeout
#   BOT.create_message(payload.channel_id, "You took too long!")
# end

module Granz
  class MessageAwaitManager
    class Timeout
      INSTANCE = new
    end

    def initialize
      @handlers = [] of Proc(Discord::Message, Bool)

      BOT.on_message_create do |payload|
        @handlers.dup.each do |handler|
          @handlers.delete(handler) if handler.call(payload)
        end
      end
    end

    private def on_message(&block : Discord::Message -> Bool)
      @handlers << block
    end

    def await_user(id : Discord::Snowflake, timeout : Time::Span? = nil)
      channel = Channel(Discord::Message | Timeout).new(1)

      if timeout
        spawn do
          sleep timeout.not_nil!
          channel.send(Timeout::INSTANCE)
        end
      end

      spawn do
        on_message do |payload|
          if payload.author.id == id
            channel.send(payload)
            true
          else
            false
          end
        end
      end

      channel.receive
    end
  end
end
