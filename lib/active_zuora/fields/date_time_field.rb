module ActiveZuora
  class DateTimeField < Field

    def type_cast(value)
      return value if value.nil? || value.is_a?(Date)
      return value.to_datetime if value.is_a?(Time)
      value.to_datetime rescue default
    end

    def build_xml(xml, soap, value, options={})
      # Date format should be 2012-05-22T00:00:00-08:00 (if PST)
      value = value ? value.to_datetime.xmlschema : ''
      super(xml, soap, value, options)
    end

  end
end