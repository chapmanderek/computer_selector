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

#tests 
hpchromebook11 = Computer.new("HP", "Chromebook 11", 279)
puts hpchromebook11.get_model() 
puts hpchromebook11.get_price() 