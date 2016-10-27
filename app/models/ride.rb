class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

def take_ride
  if (self.user.height < self.attraction.min_height) && (self.user.tickets < self.attraction.tickets)
      return  "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
     return "Sorry. You do not have enough tickets the #{attraction.name}."
    else
      user.update(tickets: (self.user.tickets - self.attraction.tickets), 
                  nausea: (self.user.nausea + self.attraction.nausea_rating),
                  happiness: (self.user.happiness + self.attraction.happiness_rating))
      return "Thanks for riding the #{attraction.name}!"
     end
  end
end
