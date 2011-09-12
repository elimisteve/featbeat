class HomeController < ApplicationController
  def index
    @entries = Entry.limit(20).order('id desc')
    
    # todo: where created_at > 30 days ago
    @rollups = ActiveRecord::Base.connection.execute(      'select sum(count) as count, unit, verb, noun        from entries        group by unit, verb, noun       order by count desc;').to_a
    @rollups.each { |r| r.symbolize_keys! }
  end
end
