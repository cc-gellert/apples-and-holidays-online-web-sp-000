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
  holiday_hash[season][holiday_name] = supply_array 
  holiday_hash     
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].map do |key, value|
    value
  end.flatten 
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday|
    str1 = season.to_s.capitalize! 
    puts "#{str1}:"
    holiday.each do |event, supplies|
      puts "  #{event.to_s.split("_").map {|x| x.capitalize}.join(" ")}: #{supplies.join(", ")}"
    end 
  end 
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
