import UIKit
import MobileCoreServices

class AddOrdonanceVC: UIViewController,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
UITextFieldDelegate
{
    

    @IBOutlet weak var addOrdo: UIBarButtonItem!
    
    @IBOutlet weak var doctorName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var photoPicked: UIImageView!
    @IBOutlet weak var takePhotoButton: UIButton!
    
    var newMedia : Bool?
    var ordonnance : OrdoItem?
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doctorName.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveOrdo(_ sender: Any) {
        
        let dName = doctorName.text

        datePicker.datePickerMode = UIDatePickerMode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        
        //let mediaOrdo = image
        
        do {
            let OrdoAdd : [String: Any] = [ "docteur": dName, "date": selectedDate, ]
        let jsonData = try JSONSerialization.data(withJSONObject: OrdoAdd, options: [])
        let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
        print (jsonString)
        } catch {
            print("error json")
        }
        
        /*print(dName ?? " ")
        print(selectedDate)
        print(mediaOrdo ?? " ")*/
    }

    @IBAction func OpenCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            newMedia = true
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        
        self.dismiss(animated: true, completion: nil)
        
        if mediaType.isEqual(to: kUTTypeImage as String) {
            image = info[UIImagePickerControllerOriginalImage] as? UIImage
            photoPicked.image = image
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Hide keyboard touching outside keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hide keyboard pressing return
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        doctorName.resignFirstResponder()
        return true
    }
    
}















