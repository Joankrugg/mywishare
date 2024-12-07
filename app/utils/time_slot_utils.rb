class TimeSlotUtils
  require 'i18n'

  # Méthode pour les créneaux horaires disponibles avec le jour
  def self.available_time_slots_with_days(start_date, end_date)
    available_slots = available_time_slots
    (start_date..end_date).flat_map do |date|
      if %w[mercredi jeudi vendredi samedi].include?(I18n.l(date, format: '%A').downcase)
        available_slots.map { |time| "#{I18n.l(date, format: '%A %d/%m/%Y')} à #{time}" }
      else
        []
      end
    end
  end

  # Méthode pour les créneaux horaires valides
  def self.available_time_slots
    morning_slots = (12..13).flat_map { |hour| ["#{hour}:00", "#{hour}:30"] }
    evening_slots = (19..21).flat_map { |hour| ["#{hour}:00", "#{hour}:30"] }
    morning_slots + ["14:00"] + evening_slots
  end
end
