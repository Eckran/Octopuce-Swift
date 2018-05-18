import UIKit

class OrdonnanceVC: UIViewController {
    
    let ordoManager = OrdoManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addOrdo" {
            if let dest = segue.destination as? UINavigationController,
                let ordoDetails = dest.viewControllers.first as? AddOrdonanceVC {
                ordoDetails.ordoManager = ordoManager
                ordoDetails.listController = self
            }
        }
    }
}

extension OrdonnanceVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordoManager.ordonnances.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdoCell", for: indexPath)
        
        //Customize the cell
        let ordonnance = ordoManager.ordonnances[indexPath.row]
        cell.textLabel?.text = ordonnance.doctor
        cell.detailTextLabel?.text = ordonnance.date
        
        return cell
    }
}
