import UIKit

class AddContactViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactFirstname: UITextField!
    @IBOutlet weak var contactPhone: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    let contact : ContactItem? = nil
    
    var contactManager : ContactManager!
    weak var cListController: ContactViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard contactManager != nil else {
            fatalError("No passed ordoManager")
        }
        
        self.contactName.delegate = self
        self.contactFirstname.delegate = self
        self.contactPhone.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CancelPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addContact(_ sender: Any) {
        
        let cName = contactName.text
        let cFirstname = contactFirstname.text
        let cPhone = contactPhone.text
        
        let conta = ContactItem(name: cName!, firstName: cFirstname!, phone: cPhone!)
        
        contactManager?.add(conta)
        cListController.ContactTable.reloadData()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    //Hide keyboard pressing screen
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hide keyboard pressing return
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        contactName.resignFirstResponder()
        contactFirstname.resignFirstResponder()
        contactPhone.resignFirstResponder()
        return true
    }

}
