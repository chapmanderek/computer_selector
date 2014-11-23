class Computer
    attr_reader :brand, :model, :price, :screensize 
    
    def initialize (brand, model, price = 0)
        @brand = brand
        @model = model 
        @price = price 
    end 
    
    def get_price()
        price
    end 
    
    def get_model()
        model 
    end 
    
    def get_brand()
        brand 
    end
    
    def set_screensize(screensize = -1)
        @screensize = screensize
    end 
    
    def get_screensize()  
        screensize   
    end 
end

class Printer
    def initialize()
    end 
    
    def print_menu
        puts "1.  View all information for all computers in database"
        puts "2.  View all computers in database"  #        puts "3.  Exit"
        print "-->"
    end 
    
    def print_all_attributes(for_item)
        puts "The #{for_item.get_brand} #{for_item.get_model} costs $#{for_item.get_price} and has a screen size of #{for_item.get_screensize} inches."
    end
    
    def print_basic_info(for_item)
        puts "#{for_item.get_brand} #{for_item.get_model}"
    end 
end 

#tests 
hpchromebook11 = Computer.new("HP", "Chromebook 11", 279)
puts hpchromebook11.get_model() 
puts hpchromebook11.get_price() 