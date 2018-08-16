# frozen_string_literal: true

require_relative 'test_helper'

class EnHundredthTest < Minitest::Test
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    Hundredth.default_locale = 'en'
  end

  def teardown
    # Do nothing
  end

  def test_english_one
    assert Hundredth.ordinal(1) == 'first'
  end

  def test_english_twelve
    assert Hundredth.ordinal(12) == 'twelfth'
  end

  def test_english_thirty_seven
    assert Hundredth.ordinal(37) == 'thirty seventh'
  end

  def test_english_ninety_nine
    assert Hundredth.ordinal(99) == 'ninety ninth'
  end

  def test_english_one_hundred
    assert Hundredth.ordinal(100) == 'one hundredth'
  end

  def test_english_one_hundred_and_one
    assert Hundredth.ordinal(101) == '101st'
  end

  def test_ordinal_indicator_of_large_number_ending_in_one
    ending_in_one = gimme_a_large_number { |n| (n * 100) + 1 }
    assert_equal("#{ending_in_one}st", Hundredth.ordinal(ending_in_one))
  end

  def test_ordinal_indicator_of_large_number_ending_in_two
    ending_in_one = gimme_a_large_number { |n| (n * 100) + 2 }
    assert_equal("#{ending_in_one}nd", Hundredth.ordinal(ending_in_one))
  end

  def test_ordinal_indicator_of_large_number_ending_in_three
    ending_in_one = gimme_a_large_number { |n| (n * 100) + 3 }
    assert_equal("#{ending_in_one}rd", Hundredth.ordinal(ending_in_one))
  end

  def test_ordinal_indicator_of_large_number_ending_in_0_4_5_6_7_8_or_9
    [0, 4, 5, 6, 7, 8, 9].each do |ending_digit|
      ending_in_ending_digit = gimme_a_large_number { |n| (n * 100) + ending_digit }
      assert_equal("#{ending_in_ending_digit}th", Hundredth.ordinal(ending_in_ending_digit))
    end
  end

  def test_ordinal_indicator_of_large_number_ending_in_the_teens
    [11, 12, 13, 14, 15, 16, 17, 18, 19].each  do |ending_digit|
      ending_in_ending_digit = gimme_a_large_number { |n| (n * 100) + ending_digit }
      assert_equal("#{ending_in_ending_digit}th", Hundredth.ordinal(ending_in_ending_digit))
    end
  end

  private

  def gimme_a_large_number
    large_random_number = rand(100..100_000)

    return yield(large_random_number) if block_given?

    large_random_number
  end
end
