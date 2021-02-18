class Logo


    def self.frame_one
        system 'clear'
        puts"




                    
                  (  (  (
                   )  )  )".colorize(:blue)
                   puts"
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
puts"               🔥🔥🔥🔥🔥🔥🔥🔥 "
        sleep(0.3)
    end




    def self.frame_two
        system 'clear'
        puts"




                   (  (  ( 
                    )  )  )
                   (  (  (".colorize(:blue)
                       puts"
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
puts"               🔥🔥🔥🔥🔥🔥🔥🔥 "
        sleep(0.3)
    end
    
    def self.frame_three
        system 'clear'
        puts"
                  
                   
                  (  (  (

                   )  )  ) 
                  (  (  (
                   )  )  )".colorize(:blue)
                   puts"
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
puts"               🔥🔥🔥🔥🔥🔥🔥🔥 "
        sleep(0.3)
    end

    def self.frame_four
        system 'clear'
        puts"
                    
                  (  (  (
                   )  )  )

                   (  (  ( 
                    )  )  )
                   (  (  (".colorize(:blue)
                puts"
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
puts"               🔥🔥🔥🔥🔥🔥🔥🔥 "
        sleep(0.3)
    end

    def self.frame_five
        system 'clear'
        puts"
                  (  (  (
                   )  )  )
                  (  (  (

                   )  )  ) 
                  (  (  (
                   )  )  )".colorize(:blue)
                   puts"
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
puts"               🔥🔥🔥🔥🔥🔥🔥🔥 "
        sleep(0.3)
    end


    def self.motion
        3.times do
            Logo.frame_one
            Logo.frame_two
            Logo.frame_three
            Logo.frame_four
            Logo.frame_five
        end
    end

    def self.start
        Logo.motion
    end

end