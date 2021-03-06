require_relative  'Controller\FileHandlerController.rb'
require_relative  'Model\Contact.rb'

# Import User 
def importUserFromCSV(path)
    _fileHandler = FileHandlerController.new
    _contactCSV = _fileHandler.readCSV(path)
    if _contactCSV.empty?
        raise "CSV file empty"
    end
    _contacts = Array.new
    _contactCSV.each do |row|
        _contacts.push(Contact.new(row))
    end
    
    # Mark duplicate contacts as not valid user
    duplicates = _contacts.group_by{ |row| [row.first_name,row.last_name] }.select { |first_name, last_name| last_name.size > 1 }.map(&:first)
    duplicates.each do |duplicate|
        _contacts.each do |contact| 
            contact.errorDescription = contact.first_name == duplicate[0] && contact.last_name == duplicate[1] ? "Duplicate" : contact.errorDescription
        end
    end
    _contacts
end

#  Valid contacts: contacts completely populated and no duplicated
def printValidContact(contacts)
    _validContacts = contacts.find_all{|_contact| _contact.errorDescription.empty?}

    _validContacts.each {|contact| puts("----------------\n#{contact.to_string}") }
    puts("\nThere are #{_validContacts.size} valid contacts")
end

def report(contacts)
    puts("Total contacts: #{contacts.size}")
    duplicatesContacts = contacts.find_all{|_contact| _contact.errorDescription == "Duplicate"}
    puts("Total duplicate contacts: #{duplicatesContacts.size}")
    incompleteContacts = contacts.find_all{|_contact| !["", "Duplicate"].include?(_contact.errorDescription.to_s) }
    puts("Total incomplete contacts: #{incompleteContacts.size}")
end
def mapQuestions(contacts)
    puts("Who replied to ""How did you hear about us?""")
    contacts.select{|row| row.how_did_you_hear_about_us && row.errorDescription.empty?}.each{|contact| puts("\t- #{contact.get_fullName}")}
    puts("Who replied to ""what is your budget?""")
    contacts.select{|row| row.what_is_your_budget && row.errorDescription.empty?}.each{|contact| puts("\t- #{contact.get_fullName}")}
    puts("Who replied to ""what is your favourite color?""")
    contacts.select{|row| row.what_is_your_favourite_colo && row.errorDescription.empty?}.each{|contact| puts("\t- #{contact.get_fullName}")}
end
def invalidContact(contacts)
    _invalitContacts = contacts.find_all{|_contact| ![""].include?(_contact.errorDescription.to_s) }
    _invalitContacts.each{ |contact| puts("----------------\n#{contact.get_fullName} rejected: #{contact.errorDescription}")}
end
# 1. Import the contacts CSV (included). This can be in-memory, you do not need to create a database.
@contacts = importUserFromCSV("userInput/contacts.csv")
# 2. List only the valid contact records (not duplicate or incomplete), with each 
# contact appearing only once along with the answers they have most recently
# added (if they have any answers at all).
puts("\nVALID CONTACTS")
printValidContact(@contacts)
# 3. Report
#   - total contacts
#   - duplicate contacts
#   - incomplete contacts (rows for which there is no value for one or more
#     headers, excluding Q&A columns)
puts("\nREPORT")
report(@contacts)
# 4. Map the questions in a way that each question can be associated with the
#    contacts who have answered it.
puts("\nMap question with contact")
mapQuestions(@contacts)


# 5. Return each invalid record with an error message stating why it was rejected.
puts("\nInvalid record")
invalidContact(@contacts)