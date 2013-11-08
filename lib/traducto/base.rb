module Traducto
  #*************************************************************************************
  # Base helper methods to add path to lazy lookup and allow formatting.
  #*************************************************************************************
  class Base
    attr_reader :rails_helpers

    delegate :content_tag,  to: :rails_helpers
    delegate :request,      to: :rails_helpers

    def initialize(rails_helpers)
      @rails_helpers = rails_helpers

      init_state
    end

    def translate(key, options={})
      init_state key, options

      lazy_translate if lazy_lookup?

      i18n_translate @base_key if translation_missing?

      format

      return @text.html_safe
    end

    private

    def action
      request[:action]
    end

    def controller
      request[:controller]
    end

    def format
      case @options[:format]
        when :text then format_text
        else format_base
      end
    end

    def format?
      @options[:format] ? true : false
    end

    def format_base
      @text = @text.join("\n") if @text.is_a? Array
    end

    def format_text
      @text = [@text] if not @text.is_a? Array

      @text = @text.map { |x| content_tag(:p, x.html_safe) }.join.html_safe
    end

    def i18n_translate(key)
      @text = I18n.translate(key, @options)
    end

    def init_state(key='', options={})
      @options = options.reverse_merge default: '', format: nil

      @base_key = key
      @text = nil
    end

    def lazy_lookup?
      @base_key[0,1] == '.'
    end

    def lazy_translate
      i18n_translate "views.#{controller}.#{action}#{@base_key}"
      i18n_translate "views.#{controller}#{@base_key}" if translation_missing?
      i18n_translate "views#{@base_key}" if translation_missing?
    end

    def translation_missing?
      @text.blank? or @text.include? 'translation missing'
    end
  end
end
