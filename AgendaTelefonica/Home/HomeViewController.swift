import UIKit

class HomeViewController: UITableViewController {
    private var contacts: [Contact] = []
    private let database: DatabaseProtocol
    
    init(database: DatabaseProtocol) {
        self.database = database
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupRightBarButtonItem()
        title = "Agenda"
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        contacts = database.loadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell else { fatalError("Cell with informed id not exists") }
        let contact = contacts[indexPath.row]
        cell.setup(name: contact.name, number: contact.number)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    private func setupRightBarButtonItem() {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapRightButton))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc
    private func didTapRightButton() {
        let addViewController = AddViewController()
        addViewController.delegate = self
        navigationController?.pushViewController(addViewController, animated: true)
    }
}

extension HomeViewController: AddViewControllerDelegate {
    func addButtonTapped(name: String, number: String) {
        let contact = database.makeContact()
        contact.name = name
        contact.number = number
        
        database.saveContext()
        contacts = database.loadData()
        tableView.reloadData()
    }
}
