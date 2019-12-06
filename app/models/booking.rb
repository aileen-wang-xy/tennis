class Booking < ApplicationRecord
    
    
    validates :duration, presence: true

    validate :start_time_is_valid


    
    def start_time_is_valid
      errors.add(:start_time, ': Bookings only available between 9AM and 18PM') if (!start_time.hour.between?(9, 18))
      errors.add(:start_time, ': Bookings must start at the hour.') if (start_time.min != 0)
      errors.add(:start_time, ': Please book the courts at future.') if (start_time.past?)
    end

    validate :booking_not_available

    def booking_not_available

       Booking.all.each do |booking|
        errors.add(:start_time, ': Court had been booked for given time.') if (id != booking.id && start_time.hour >= booking.start_time.hour && start_time.hour < (booking.start_time.hour + booking.duration)) || (id != booking.id && (start_time.hour + duration) > booking.start_time.hour && (start_time.hour + duration) <= (booking.start_time.hour + booking.duration))
       end
    end
    
end
