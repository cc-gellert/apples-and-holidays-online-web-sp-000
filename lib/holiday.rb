require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  {
    :winter => {
      :christmas => ["Lights", "Wreath"],
      :new_years => ["Party Hats"]
    },
    :summer => {
      :fourth_of_july => ["Fireworks", "BBQ"]
    },
    :fall => {
      :thanksgiving => ["Turkey"]
    },
    :spring => {
      :memorial_day => ["BBQ"]
    }
  }
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  supplys = supply.to_s
  holiday_hash.each do |season, holiday|
    if(season == :winter)
      holiday.each do |holiday, supplies|
        supplies.push(supplys)
      end
    end
  end
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  supplys = supply.to_s
  holiday_hash.each do |season, holiday|
    if(season == :spring)
      holiday.each do |holiday, supplies|
        supplies.push(supplys)
      end  
    end
  end
  holiday_hash 
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  newHoliday = {holiday_name => supply_array}
  holiday_hash.each do |toy, holiday|
    if(toy == season)
     toy[holiday_name] = supply_array
    end
  end 
  holiday_hash     
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  wintersupplies = [] 
  holiday_hash.each do |season, holiday|
    if(season == :winter)
      holiday.each do |holiday, supplies|
        wintersupplies << supplies
      end 
    end 
  end
  wintersupplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday|
    str1 = season.to_s.capitalize! 
    puts "#{str1}:"
    holiday.each do |holiday, supplies|
      str = supplies.to_s 
      splits = str.split(" ")
      caps = splits.capitalize!
      newName = splits.join(" ")
      flattened = supplies.flatten.split(" ") 
      puts "#{newName}: #{flattened}"
      binding.pry 
    end 
  end 
  holiday_hash 
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidayArr = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, supplies|
      supplies.each do |supply|
        if(supply == "BBQ")
          holidayArr << holiday 
        end
      end 
    end
  end
  holidayArr 
end
