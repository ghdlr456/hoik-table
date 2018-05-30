
import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    
    var cellImage = ""
    var telNum: String = ""
    var locationName: String = ""
    var menu: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate connection
        detailTableView.delegate = self
        detailTableView.dataSource = self

        cellImageView.image = UIImage(named: cellImage)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = " 주소 : " + locationName
            return cell
        } else if indexPath.row == 1 {
            cell.textLabel?.text = " 전화번호 : " + telNum
            return cell
        } else {
            cell.textLabel?.text = " 메뉴 : " + menu
            return cell
        }
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
