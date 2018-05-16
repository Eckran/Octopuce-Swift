import UIKit

class RappelViewController: UIViewController {

    @IBOutlet weak var RappelTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RappelTable.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RappelViewController: UITableViewDataSource {
    
    func numberOfSections(in RappelTable: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ RappelTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ RappelTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = RappelTable.dequeueReusableCell(withIdentifier: "RappelCell", for: indexPath)
        
        //Customize the cell
        cell.textLabel?.text = "name"
        cell.detailTextLabel?.text = "Hour"
        
        return cell
    }
}
