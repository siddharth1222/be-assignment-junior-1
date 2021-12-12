# frozen_string_literal: true

module ApplicationHelper

    def timzone
    'Asia/Kolkata'
    end

    def show_date(date_time)
        return date_time.in_time_zone(timzone).strftime('%m/%d/%Y') unless date_time.nil?
    end
    def show_date_time(date_time)
    date_time.in_time_zone(timzone).strftime('%B %d, %Y %I:%M %p')
    end

end
