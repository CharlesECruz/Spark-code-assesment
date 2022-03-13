require_relative  'Controller\FileHandlerController.rb'
require_relative  'Model\User.rb'

def importUserFromCSV(path)
    _fileHandler = FileHandlerController.new
    _contactCSV = _fileHandler.readCSV(path)
    if _contactCSV.empty?
        raise "CSV file empty"
    end
    _contacts = Array.new
    _contactCSV.each do |row|
        _contact = User.new(row)
        _contacts.push(_contact)
    end
    _contacts
end

@contacts = importUserFromCSV("userInput/contacts.csv")

puts(@contacts)
