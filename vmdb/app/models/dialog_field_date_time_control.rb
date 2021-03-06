class DialogFieldDateTimeControl < DialogFieldDateControl
  AUTOMATE_VALUE_FIELDS = %w(show_past_dates)

  def automate_output_value
    return nil unless @value
    with_current_user_timezone { Time.zone.parse(@value).utc.iso8601 }
  end

  def value
    if dynamic
      @value = values_from_automate
      Time.parse(@value).strftime("%m/%d/%Y %H:%M")
    else
      default_time
    end
  end

  def refresh_json_value
    date_time_value = with_current_user_timezone { Time.parse(value) }

    {
      :date => date_time_value.strftime("%m/%d/%Y"),
      :hour => date_time_value.strftime("%H"),
      :min  => date_time_value.strftime("%M")
    }
  end

  private

  def default_time
    with_current_user_timezone { Time.zone.now + 1.day }.strftime("%m/%d/%Y %H:%M")
  end
end
