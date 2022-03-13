class User
    attr_accessor :first_name, :last_name, :email, :phone, :address_line_1, :city, :province, :country_name, :postcode, :date_added, :how_did_you_hear_about_us, :what_is_your_budget, :what_is_your_favourite_colo, :isValit
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
        @isValit = "TO DO"
    end

    # Validate user is properly populated 
    def validate()
        # TO DO
    end
    
end