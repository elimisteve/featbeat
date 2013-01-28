class Entry < ActiveRecord::Base
  
  attr_accessible :count
  attr_accessible :unit
  attr_accessible :noun
  attr_accessible :verb
  attr_accessible :data
  
  def Entry.parse_number(s)

    if s == 'one' 
      return 1
    elsif s == 'two' 
      return 2
    elsif s == 'three' 
      return 3
    elsif s == 'four' 
      return 4
    elsif s == 'five' 
      return 5
    elsif s == 'six' 
      return 6
    elsif s == 'seven' 
      return 7
    elsif s == 'eight' 
      return 8
    elsif s == 'nine' 
      return 9
    elsif s == 'ten' 
      return 10
    end
    
    return s.to_i

  end

  def Entry.create_from_sentence(s)
    a = s.split(' ')
    
    # I took 1 bus
    # I ran 5 kilometers
    # I ate 1 bannana
    if a.first.upcase == 'I' 
      
      if a.size > 5 and a[4] == 'of' # I ate 7 grams of protein
        noun = a[5]
      else
        noun = a[3]
      end

      return Entry.create(
        :count  => Entry.parse_number(a[2]),
        :unit   => a[3],
        :noun   => noun,
        :verb   => a[1]
      )

    elsif a.last == 'visited' # "1 venue something something something visited"
      return Entry.create(
        :count  => a[0],
        :unit   => a[1],
        :noun   => a[2..a.size-2].join(' '),
        :verb   => a.last
      )      
    elsif a.size == 4 # "1 unit noun verbed"
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