class Computer
    attr_reader :brand, :model, :price, :screensize, :itemname
    
    def initialize (inhash)
        @brand = inhash[:brand]
        @model = inhash[:model]
        @price = inhash[:price].to_i
        @screensize = inhash[:screensize].to_f
        @itemname = inhash[:itemname]
    end 

    def get_name()
        itemname
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
        puts "4.  Filter computers by max screen size"
        puts "5.  Find my perfect computer!"
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
        computers_to_return = Hash.new

        allcomputers.each_value do |computer|
            if computer.get_price <= max
                computers_to_return[computer.get_name] = computer 
            end 
        end 
        return computers_to_return
    end
    
    def by_max_screen_size(max_screen_size, allcomputers)
        computers_to_return = Hash.new
        
        allcomputers.each_value do |computer|
            if computer.get_screensize <= max_screen_size
                computers_to_return[computer.get_name] = computer 
            end 
        end 
        return computers_to_return
    end  

end 

def seed (allcomputers) 
    seed = File.open('seed.txt', "r")
    outhash = Hash.new()

    seed.each_line do |line| 
        fields = line.split(',')
 
        computerkey = fields[0]
        outhash[:itemname] = fields[0]
        outhash[:brand] = fields[1]
        outhash[:model] = fields[2]
        outhash[:price] = fields[3]
        outhash[:screensize] = fields[4]
        c = Computer.new(outhash)
        allcomputers[computerkey] = c
    end 

    seed.close()

    return allcomputers
end

def when5(allcomputers, filters)
    print "Enter the maximum price: "
    input = gets.chomp
    max_p = input.to_i
    if (max_p > 0)
        returnedcomputers_p = filters.by_max_price(max_p, allcomputers)
    else
        puts "Sorry I didn't understand that." 
        return
    end

    print "Enter the maximum screen size you would like: "
    input = gets.chomp
    max_s = input.to_f
    if (max_s > 0)
        returnedcomputers = filters.by_max_screen_size(max_s, returnedcomputers_p)
    else
        puts "Sorry I didn't understand that." 
        return
    end

    if (returnedcomputers.length > 0)
        puts "\nThe following computers meet you criteria of less than $#{max_p} and a screen smaller than #{max_s} inches."
        returnedcomputers.each_value {|computer| puts "The #{computer.get_brand} #{computer.get_model} costs $#{computer.get_price}"}
    else
        puts "Sorry there were no computers that matched your criteria."
    end
end

allcomputers = Hash.new()
allcomputers = seed(allcomputers)
print_info = Printer.new 
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
                returnedcomputers = filters.by_max_price(max, allcomputers)
                if (returnedcomputers.length > 0)
                    puts "\nThe following computers are less than $#{max}:"
                    returnedcomputers.each_value {|computer| puts "The #{computer.get_brand} #{computer.get_model} costs $#{computer.get_price}"}
                else
                    puts "Sorry there were no computers that had a price less than $#{max}."
                end
            else
                puts "Sorry I didn't understand that." 
            end 
        when '4'
            print "Enter the maximum screen size you would like: "
            input = gets.chomp
            max = input.to_f
            if (max > 0)
                returnedcomputers = filters.by_max_screen_size(max, allcomputers)
                if (returnedcomputers.length > 0)
                    puts "\nThe following computers have a screen size smaller than #{max} inches:"
                    returnedcomputers.each_value {|computer| puts "The #{computer.get_brand} #{computer.get_model} has a screen size of #{computer.get_screensize} inches"}
                else
                    puts "Sorry there were no computers that had a screen size less than #{max} inches."
                end
            else
                puts "Sorry I didn't understand that."
            end 

#need to fix exiting when statement if user inputs junk
        when '5'
            when5(allcomputers, filters)
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

