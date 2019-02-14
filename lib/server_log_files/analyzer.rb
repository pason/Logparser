require_relative 'support/formater'
# Analyzer
module ServerLogFiles
  class Analyzer
    include Support::Formater

    attr_reader :visits

    def initialize(parser:)
      @parser = parser
      @visits = {}
    end

    def analyze
      @parser.parse do |url, host|
        visits[url] ||= {}; visits[url][host] ||= 0; visits[url][host] += 1
      end
      self
    end

    def page_views(format: :text)
      display_as visits.map { |k, v| [k, v.values.sum] }.sort_by(&:last).reverse.to_h, format
    end

    def unique_views(format: :text)
      display_as visits.map { |k, v| [k, v.values.count] }.sort_by(&:last).reverse.to_h, format
    end
  end
end
