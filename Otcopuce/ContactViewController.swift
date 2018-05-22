import UIKit

class ContactViewController: UIViewController {

    var contactManager = ContactManager()
    
    @IBOutlet weak var ContactTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ContactTable.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddContact" {
            if let dest = segue.destination as? UINavigationController,
                let ContactDetails = dest.viewControllers.first as? AddContactViewController {
                ContactDetails.contactManager = contactManager
                ContactDetails.cListController = self
            }
        }
    }

}

extension ContactViewController: UITableViewDataSource {
    
    func tableView(_ ContactTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactManager.contacts.count
    }
    
    func tableView(_ ContactTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ContactTable.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        //Customize the cell
        let contact = contactManager.contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.firstName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
            contactManager.contacts.remove(at: indexPath.row)
            ContactTable.reloadData()
        }
    }
}
