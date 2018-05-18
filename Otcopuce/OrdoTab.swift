import Foundation

class OrdoManager {
    
    var ordonnances : [OrdoItem]
    
    init() {
        ordonnances = []
        read()
    }
    
    func add(_ ordo: OrdoItem) {
        ordonnances.append(ordo)
        save()
    }
    
    func save() {
        //recu l'url d'enregistrement
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentDirectory.appendingPathComponent("ordo").appendingPathExtension("json")
        
        let encoder = JSONEncoder()
        let data = try? encoder.encode(ordonnances)
        let OrdoString = String(data: data!, encoding: String.Encoding.utf8)!
        
        try? data?.write(to: archiveURL)
    }
    
    func read() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveUrl = documentDirectory.appendingPathComponent("ordo").appendingPathExtension("json")
        
        let decoder = JSONDecoder()
        if let retrieveOrdoData = try? Data(contentsOf: archiveUrl),
            let decodedOrdo = try? decoder.decode(Array<OrdoItem>.self, from: retrieveOrdoData){
            ordonnances = decodedOrdo
        }
    }
    
}
