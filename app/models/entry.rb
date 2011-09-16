class Entry < ActiveRecord::Base
  # "1 unit noun verbed"
  def Entry.create_from_sentence(s)
    a = s.split(' ')
    
    if a.last == 'visited'
      return Entry.create(
        :count  => a[0],
        :unit   => a[1],
        :noun   => a[2..a.size-2].join(' '),
        :verb   => a.last
      )      
    elsif a.size == 4
      return Entry.create(
        :count  => a[0],
        :unit   => a[1],
        :noun   => a[2],
        :verb   => a[3]
      )
    else 
      Rails.logger.warn "unrecognized sentence #{s}"
      return nil
    end
  end
end