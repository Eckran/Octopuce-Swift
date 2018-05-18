import UIKit

class DetailConseilsViewController: UIViewController {

    @IBOutlet weak var DetailsTableView: UITableView!
    
    var detailsConseils = [DetailsConseilsItem(name: "Contrôler son poids"),
                           DetailsConseilsItem(name: "Renforcer la solidité des os"),
                           DetailsConseilsItem(name: "Entretenirson coeur, ses vaisseaux et ses poumons")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailsTableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
extension DetailConseilsViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsConseils.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DetailsTableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath)
        
        let details = detailsConseils[indexPath.row]
        cell.textLabel?.text = details.name
        
        return cell
    }
    
    
}
