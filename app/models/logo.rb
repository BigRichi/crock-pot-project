class Logo


    def self.frame_one
        system 'clear'
        puts"
                   )  )  ) 
                  (  (  (
                   )  )  )
             _.---||-'^'-||---._  
            (   (/        `-'   )      
           _|''--._________.--''|_      
          (_|                   |_)        
          '--)                 (--'  
            |                   |   
            |                   |  
            |                   | 
            `-.__           __.-'   
                 '''-----''' ".colorize(:red)
        sleep(0.3)
    end

    def self.frame_two
        system 'clear'
        puts"
                   (  (  ( 
                    )  )  )
                   (  (  (
             _.---||-'^'-||---._  
            (   (/        `-'   )      
           _|''--._________.--''|_      
          (_|                   |_)        
          '--)                 (--'  
            |                   |   
            |                   |  
            |                   | 
            `-.__           __.-'   
                 '''-----''' ".colorize(:red)
        sleep(0.3)
    end

    def self.motion
        6.times do
            Logo.frame_one
            Logo.frame_two
        end
    end

    def self.start
        Logo.motion
    end

end