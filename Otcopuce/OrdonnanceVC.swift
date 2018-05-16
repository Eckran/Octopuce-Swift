import UIKit

class OrdonnanceVC: UIViewController {
    
    var ordonances = [OrdoItem(doctor: "Pierre", date: "12 Fevrier"),
                      OrdoItem(doctor: "Bertrand", date: "15 Fevrier")
                      ]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }

}

extension OrdonnanceVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordonances.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdoCell", for: indexPath)
        
        //Customize the cell
        let ordonnance = ordonances[indexPath.row]
        cell.textLabel?.text = ordonnance.doctor
        cell.detailTextLabel?.text = ordonnance.date
        
        return cell
    }
}
