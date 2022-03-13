# Represent a contact with their information. A valid contact is a contact complete (all fields) and not duplicate
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
        :what_is_your_favourite_colo, 
        :errorDescription
    )
    def initialize(hashUser)
        begin
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
        rescue => exception
            puts("Contact/initialize method: #{exception}")
        end
    end

    # Validate user is properly populated 
    # Return String: if Contact is incomplete return "Incomplete" and missing fields 
    def validate()
        begin
            _errorDescription = ""
            self.instance_variables.each do |attribute|
                _attributeValue =self.instance_variable_get attribute
                if (_attributeValue.nil? || _attributeValue.to_s.empty?) 
                    _errorDescription += "#{attribute.to_s} "
                end
            end
            _errorDescription = _errorDescription.size > 0 ? "Incomplete #{_errorDescription}" : ""
            _errorDescription
        rescue => exception
            puts("Contact/validate method: #{exception}")
        end

    end

    def get_fullName
        begin
            "#{self.first_name} #{self.last_name}"
        rescue => exception
            puts("Contact/get_fullName method: #{exception}")
        end
    end
    
    # Class printed format
    # return: String
    def to_string
        begin
            _contactString = ""
            self.instance_variables.each do |attribute|
                _attributeValue =self.instance_variable_get attribute
                _contactString += "#{attribute} : #{_attributeValue}\n"
            end
            _contactString
        rescue => exception
            puts("Contact/to_string method: #{exception}")
        end
    end
end