import CoreData

final class DatabaseCoreData: DatabaseProtocol {
    private let container: NSPersistentContainer
    
    init?(container: NSPersistentContainer) {
        self.container = container
        
        var error: Error?
        container.loadPersistentStores { error = $1 }
        
        if let error = error {
            print("Error in loadPersistentStores: \(error)")
            return nil
        }
    }
    
    func loadData() -> [Contact] {
        let request = Contact.createFetchRequest()
        let sort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sort]
        
        do {
            return try container.viewContext.fetch(request)
        } catch {
            print("Load Failed")
        }

        return []
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error ocurred while saving: \(error)")
            }
        }
    }
    
    func makeContact() -> Contact {
        Contact(context: container.viewContext)
    }
    
}
