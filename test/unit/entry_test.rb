require 'test_helper'

# bundle exec ruby -I"lib:test" test/unit/entry_test.rb
class EntryTest < ActiveSupport::TestCase

  def setup
    @u = User.new
  end

  test 'parses full sentence' do
    entry = Entry.create_from_sentence(@u, 'I ate 1 slice of pie')
    assert_equal 'ate', entry.verb
    assert_equal 1, entry.count
    assert_equal 'slice', entry.unit
    assert_equal 'pie', entry.noun
  end

  test 'uses unit as noun if no noun' do
    entry = Entry.create_from_sentence(@u, 'I ran 1 mile')
    assert_equal 'ran', entry.verb
    assert_equal 1, entry.count
    assert_equal 'mile', entry.unit
    assert_equal 'mile', entry.noun
  end

end