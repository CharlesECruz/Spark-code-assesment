class Contact
    attr_accessor(
        :first_name,
        :last_name,
        :email,
        :phone,
        :address_line_1,
        :city,
        :province,
        :country_name,
        :postcode,
        :date_added,
        :how_did_you_hear_about_us,
        :what_is_your_budget,
        :what_is_your_favourite_colo, :errorDescription
    )
    def initialize(hashUser)
        @first_name = hashUser[:first_name]
        @last_name = hashUser[:last_name]
        @email = hashUser[:email]
        @phone = hashUser[:phone]
        @address_line_1 = hashUser[:address_line_1]
        @city = hashUser[:city]
        @province = hashUser[:province]
        @country_name = hashUser[:country_name]
        @postcode = hashUser[:postcode]
        @date_added = hashUser[:date_added]
        @how_did_you_hear_about_us = hashUser[:how_did_you_hear_about_us]
        @what_is_your_budget = hashUser[:what_is_your_budget]
        @what_is_your_favourite_colo = hashUser[:what_is_your_favourite_color]
        @errorDescription = validate()
    end

    # Validate user is properly populated 
    # Return String: if Contact is incomplete return "Incomplete" and missing fields 
    def validate()
        _errorDescription = ""
        self.instance_variables.each do |attribute|
            _attributeValue =self.instance_variable_get attribute
            if (_attributeValue.nil? || _attributeValue.to_s.empty?) 
                _errorDescription += "#{attribute.to_s} "
            end
            _errorDescription = _errorDescription.size > 0 ? "Incomplete #{_errorDescription}" : ""
        end
        _errorDescription
    end
    # Object printed format
    # return: String
    def to_string
        _contactString = ""
        self.instance_variables.each do |attribute|
            _attributeValue =self.instance_variable_get attribute
            _contactString += "#{attribute} : #{_attributeValue}\n"
        end
        _contactString
    end
end