require 'csv'

# FileHandlerController is encharge of read different type of files and return specific exception incase file contains error
class FileHandlerController

    # readCSV read a CSV file
    # Params:
    #   path: location of the file. Set as defult to contact.csv to this assesment
    # Return:
    #   Array: contains line by line of the CSV
    def readCSV(path = "userInput/contacts.csv")
        begin
            data = CSV.read(path, headers: true, header_converters: :symbol, converters: :all)
            hashed_data = data.map { |d| d.to_hash }
        rescue => exception
            puts(exception)
        end
    end 

    
end