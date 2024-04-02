module Tinkerforge

  module Shared

    # Mixin for event logging to a Logger instance.
    #
    # Logger is part of the Ruby Standard Library:
    # - https://docs.ruby-lang.org/en/master/Logger.html
    module Logger

      private

      def logger
        Tinkerforge.logger
      end

      def logger_debug(message='', &block)
        logger_log(0, message, &block)
      end

      def logger_info(message='', &block)
        logger_log(1, message, &block)
      end

      def logger_warn(message='', &block)
        logger_log(2, message, &block)
      end

      def logger_error(message='', &block)
        logger_log(3, message, &block)
      end

      def logger_fatal(message='', &block)
        logger_log(4, message, &block)
      end

      def logger_log(level, message='', &block)
        return unless logger

        if message.empty? and block_given?
          message = yield
        end

        if respond_to? 'uid_string'
          message = "[ #{uid_string} ] #{message}"
        end

        case level
          when 0
            logger.debug(message)
          when 1
            logger.info(message)
          when 2
            logger.warn(message)
          when 3
            logger.error(message)
          when 4
            logger.fatal(message)
        end
      end

    end

  end

end
