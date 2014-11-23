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
        puts "2.  View all computers in database" 
        puts "3.  Filter computers by max price"
        puts "E =  Exit"
        print "-->"
    end 
    
    def print_all_attributes(for_item)
        puts "The #{for_item.get_brand} #{for_item.get_model} costs $#{for_item.get_price} and has a screen size of #{for_item.get_screensize} inches."
    end
    
    def print_basic_info(for_item)
        puts "#{for_item.get_brand} #{for_item.get_model}"
    end 
end 

class Filter
    def initialize 
    end 
    
    def by_max_price(max, allcomputers)
        puts "The following computers are less than $#{max}"
        allcomputers.each_value do |computer|
            if computer.get_price <= max
                puts "The #{computer.get_brand} #{computer.get_model} costs $#{computer.get_price}"
            end 
        end 
                
    end 
end 

def seed (allcomputers) 
    hpchromebook11 = Computer.new("HP", "Chromebook 11", 279)
    allcomputers["hpchromebook11"] = hpchromebook11
    hpchromebook11.set_screensize(11)

    googlepixel = Computer.new("Google", "Pixel", 1249)
    googlepixel.set_screensize(12)
    allcomputers["googlepixel"] = googlepixel
    
    return allcomputers
end

allcomputers = Hash.new()
print_info = Printer.new 
allcomputers = seed(allcomputers)
filters = Filter.new  

breakout = false
while breakout != true 
    print_info.print_menu()
    input = gets.chomp 
    
    input.downcase!
    
    case input
        when '1' 
            allcomputers.each_value {|computer| print_info.print_all_attributes(computer)}
        when '2' 
            allcomputers.each_value {|computer| puts "#{computer.get_brand} #{computer.get_model}"}
        when '3'
            print "Enter the maximum price: "
            input = gets.chomp
            max = input.to_i
            if (max > 0)
                filters.by_max_price(max, allcomputers)
            else
                puts "Sorry I didn't understand that." 
            end 
        when 'e'
            breakout = true 
        else 
            puts "Invalid input.  Try again." 
    end
    
    puts ""
end



#tests 
=begin 
puts "\n\n Tests"
puts allcomputers["hpchromebook11"].get_model
puts print_info.print_all_attributes(allcomputers["googlepixel"])
=end 

