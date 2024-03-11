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

      def logger_debug(msg)
        if logger
          logger.debug(logger_format msg)
        end
      end

      def logger_info(msg)
        if logger
          logger.info(logger_format msg)
        end
      end

      def logger_warn(msg)
        if logger
          logger.warn(logger_format msg)
        end
      end

      def logger_error(msg)
        if logger
          logger.error(logger_format msg)
        end
      end

      def logger_fatal(msg)
        if logger
          logger.fatal(logger_format msg)
        end
      end

      def logger_format(msg)
        if respond_to? 'uid_string'
          "[ #{uid_string} ] #{msg}"
        else
          msg
        end
      end

    end

  end

end
