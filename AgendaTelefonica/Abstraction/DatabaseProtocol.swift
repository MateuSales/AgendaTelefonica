protocol DatabaseProtocol {
    func loadData() -> [Contact]
    func saveContext()
    func makeContact() -> Contact
}
