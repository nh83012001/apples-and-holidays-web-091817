
require 'pry'
holiday_hash = {
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

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season.to_s == "winter"
        holiday.each do |attribute, value|
          value.push(supply)
        end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday|

      holiday.each do |attribute, value|
        if attribute.to_s == "memorial_day"
          value.push(supply)
        end
      end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.each do |season1, holiday|
      if season1 == season
        holiday_hash[season][holiday_name] = supply_array
      end
  end
end

#add_new_holiday_with_supplies(holiday_hash, "winter", "my_birthday", "hookers")


def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
new_array =[]
  holiday_hash.each do |season, holiday|
    if season.to_s == "winter"
      holiday.each do |attribute, value|
        value.each do |supplies|
          new_array.push(supplies)
        end
      end
    end
  end
  new_array
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

    holiday_hash.collect do |season, holiday|
      season = season.to_s.capitalize!
        holiday.each do |attribute, value|
          new_attribute = attribute.to_s.capitalize
          new_value = value.join(", ")
          #binding.pry
            puts season + ":"
            if new_attribute == "New_years"
              puts "  " + "New Years: "+ new_value
            elsif new_attribute == "Fourth_of_july"
              puts "  " + "Fourth Of July: "+ new_value
            elsif new_attribute == "Memorial_day"
              puts "  " + "Memorial Day: "+ new_value
            else
            puts "  " + new_attribute + ": "+ new_value
            end
        end
    end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
holidays = []
  holiday_hash.each do |season, holiday|
      holiday.each do |attribute, value|
            value.each do |x|
                if x == "BBQ"
                  holidays << holiday.keys
                end
            end
        #puts value.to_s
        if value.to_s == "BBQ"
          value.push(attribute)
        end
      end
  end
  #puts holidays
  holidays.flatten
end
all_holidays_with_bbq(holiday_hash)
