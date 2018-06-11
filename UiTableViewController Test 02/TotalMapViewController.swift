import UIKit
import MapKit

class TotalMapViewController: UIViewController {
    

    @IBOutlet weak var totalMapView: MKMapView!
    //주소 배열 받는 곳
    var loctions = [String]()
    var names = [String]()
    var count = 0
    
    // pin 저장 배열
    var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //geocoding
        viewMap(addr: loctions, names: names)
    }
    
    
    
    func viewMap(addr: [String], names: [String]) {
        for addr in loctions {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(addr) {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let myError = error {
                    print(myError)
                    return
                }
                
                if let myPlacemarks = placemarks {
                    let myPlacemark = myPlacemarks[0]
                    let loc = myPlacemark.location?.coordinate
                    
                    let anno = MKPointAnnotation()
                    anno.coordinate = loc!
                    anno.title = names[self.count]
                    self.count = self.count + 1
                    anno.subtitle = addr
                    //self.self.myMapView.addAnnotation(anno)
                    self.annotations.append(anno)
                    self.totalMapView.addAnnotations(self.annotations)
                    
                    //여러개의 pin을 지도에 꽉채움
                    self.totalMapView.showAnnotations(self.annotations, animated: true)
                    
                    
                } else {
                    print("placemarks nil 발생")
                }
            }
        }
    }

}
