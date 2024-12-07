module EventsHelper
  def available_dates(start_month, end_month)
    start_date = Date.today.beginning_of_month
    end_date = (start_date >> (end_month - start_month)).end_of_month

    (start_date..end_date).select do |date|
      date.wday.in?([3, 4, 5, 6]) # Mercredi (3), Jeudi (4), Vendredi (5), Samedi (6)
    end
  end
  def available_time_slots
    morning_slots = (12..13).flat_map { |hour| ["#{hour}:00", "#{hour}:30"] }
    evening_slots = (19..21).flat_map { |hour| ["#{hour}:00", "#{hour}:30"] }
    morning_slots + ["14:00"] + evening_slots
  end
end
