# frozen_string_literal: true

# Writes out ordinals to 100
class Hundredth
  require 'hundredth/version'
  require 'i18n'

  I18n.load_path += Dir.glob(File.join(Gem.loaded_specs['hundredth'].full_gem_path, 'lib/locales/*.yml'))
  I18n.backend.load_translations
  I18n.config.enforce_available_locales = true
  I18n.config.default_locale = :en

  class << self
    def ordinal(number, locale = Thread.current[:locale] || I18n.config.default_locale)
      begin
        number = number.to_int
      rescue StandardError
        raise HundredthError, I18n.t('hundredth.not_an_integer', number)
      end

      raise HundredthError, I18n.t('hundredth.less_than_one', number) if number < 1

      return beyond100(number, locale) if number > 100

      I18n.t 'hundredth.num_' + number.to_s, locale: locale
    end

    def default_locale
      I18n.config.default_locale
    end

    def default_locale=(value)
      I18n.config.default_locale = value
    end

    private

    def beyond100(number, locale)
      case locale.to_s.split('-').first
      when 'en'
        beyond100_en number
      when 'es'
        raise NotImplementedError
      when 'fr'
        raise NotImplementedError
      else
        raise NotImplementedError
      end
    end

    # Higher ordinals are not often written in words, unless they are round numbers (thousandth,
    # millionth, billionth). They are written using digits and letters as described below. Here are
    # some rules that should be borne in mind.
    #
    # The suffixes -th, -st, -nd and -rd are occasionally written superscript above the number
    # itself.
    #
    # If the tens digit of a number is 1, then write "th" after the number. For example: 13th, 19th,
    # 112th, 9,311th.
    # If the tens digit is not equal to 1, then use the following table:
    # If the units digit is:       0   1   2   3   4   5   6   7   8   9
    # write this after the number  th  st  nd  rd  th  th  th  th  th  th
    # For example: 2nd, 7th, 20th, 23rd, 52nd, 135th, 301st.
    # TODO: option to just return the ordinal indicator
    def beyond100_en(number)
      return "#{number}th" if tens_digit_is_a_one(number)

      case number % 10
      when 0, 4, 5, 6, 7, 8, 9
        "#{number}th"
      when 1
        "#{number}st"
      when 2
        "#{number}nd"
      when 3
        "#{number}rd"
      end
    end

    def tens_digit_is_a_one(number)
      (number > 10) && (((number / 10) % 10) == 1)
    end
  end
end

class HundredthError < StandardError
  # just gives a strong named hundredth error
end
