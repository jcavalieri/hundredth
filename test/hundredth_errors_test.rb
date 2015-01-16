require_relative 'test_helper'

class HundredthErrorsTest < Minitest::Test

  def test_number_not_an_integer
    error = assert_raises(HundredthError) {
      Hundredth.ordinal('a')
    }

    assert_equal(I18n.t('hundredth.not_an_integer', 'a'), error.message)
  end

  def test_decimal_is_truncated
    assert_equal('first', Hundredth.ordinal(1.1, 'en'))
  end

  def test_negative_one
    error = assert_raises(HundredthError) {
      Hundredth.ordinal(-1)
    }

    assert_equal(I18n.t('hundredth.less_than_one', -1), error.message)
  end

  def test_zero
    error = assert_raises(HundredthError) {
      Hundredth.ordinal(0)
    }
    assert_equal(I18n.t('hundredth.less_than_one', 0), error.message)
  end
end