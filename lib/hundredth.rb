class Hundredth
  require 'i18n'

  I18n.config.enforce_available_locales = false
  @@gem_root = Gem.loaded_specs['hundredth'].full_gem_path

  I18n.load_path += Dir.glob(File.join(@@gem_root, 'lib/locales/*.yml'))
  I18n.backend.load_translations

  def self.ordinal(number)
    I18n.t 'hundredth.num_' + number.to_s
  end


end