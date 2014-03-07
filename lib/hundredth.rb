class Hundredth
  require 'i18n'

  @@gem_root = Gem.loaded_specs['hundredth'].full_gem_path
  I18n.load_path += Dir.glob(File.join(@@gem_root, 'lib/locales/*.yml'))
  I18n.backend.load_translations
  I18n.config.enforce_available_locales = true
  I18n.config.default_locale = :en

  class << self
    def ordinal(number, locale = Thread.current[:locale] || I18n.config.default_locale)
      I18n.t 'hundredth.num_' + number.to_s, locale: locale
    end

    def default_locale
      I18n.config.default_locale
    end

    def default_locale=(value)
      I18n.config.default_locale = value
    end
  end
end