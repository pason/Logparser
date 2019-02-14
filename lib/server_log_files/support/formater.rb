# Presenter
module ServerLogFiles
  module Support
    module Formater
      def display_as data, format
        case format
        when :text
          data.map { |k, v| "#{k} #{v}" }.join(' ')
        else
          data
        end
      end
    end
  end
end
