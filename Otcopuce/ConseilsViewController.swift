import UIKit

class ConseilsViewController: UIViewController {

    var conseils = [ ConseilsItem(name:"Conseils d'activités physiques")]
    
    @IBOutlet weak var ConseilsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConseilsTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ConseilsViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conseils.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ConseilsTableView.dequeueReusableCell(withIdentifier: "ConseilsCell", for: indexPath)
        
        let conseil = conseils[indexPath.row]
        cell.textLabel?.text = conseil.name
        
        return cell
    }
    
    
    
}
