class HomeController < ApplicationController
  def index
    default_user = User.where('is_admin = 1').first

    @entries = Entry.where('user_id = ?', default_user.id).limit(20).order('id desc')
    
    # todo: where created_at > 30 days ago
    @rollups = ActiveRecord::Base.connection.execute("""
      select sum(count) as count, unit, verb, noun        
      from entries 
      where user_id = #{default_user.id}
      group by unit, verb, noun
      order by count desc
      limit 20;""").to_a
    
    @rollups.each { |r| r.symbolize_keys! }
  end
end
