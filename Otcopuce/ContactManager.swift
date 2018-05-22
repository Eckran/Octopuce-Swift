import Foundation

class ContactManager {
    var contacts : [ContactItem]
    
    init() {
        contacts = []
        read()
    }
    
    func add(_ cont: ContactItem) {
        contacts.append(cont)
        save()
    }
    
    func save() {
        //recu l'url d'enregistrement
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentDirectory.appendingPathComponent("contact").appendingPathExtension("json")
        
        let encoder = JSONEncoder()
        let data = try? encoder.encode(contacts)
        
        try? data?.write(to: archiveURL)
    }
    
    func read() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveUrl = documentDirectory.appendingPathComponent("contact").appendingPathExtension("json")
        
        let decoder = JSONDecoder()
        if let retrieveContactData = try? Data(contentsOf: archiveUrl),
            let decodedContact = try? decoder.decode(Array<ContactItem>.self, from: retrieveContactData){
            contacts = decodedContact
        }
    }
}
