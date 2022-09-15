class Timetest < ApplicationRecord  
    def self.mytime    
      a = Timetest.new    
      a.time_now = Time.now    
      a.save  
    end
end