class AfterDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    current_date = Time.zone.now
    if (value <= current_date)
      record.errors.add(attribute, options[:message] || "must be after date now")
    end
  end
end
