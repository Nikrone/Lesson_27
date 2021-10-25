//
//  ViewController.swift
//  Lesson_27
//
//  Created by Evgeniy Nosko on 25.10.21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet private weak var mapView: MKMapView!

    override func viewDidLoad() {
            super.viewDidLoad()
            mapView.register(ImageAnnotation.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            mapView.delegate = self
        }
    
    override func viewWillAppear(_ animated: Bool) {
            mapView.showsUserLocation = true
            
            let center = CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417)
            let camera = MKMapCamera(lookingAtCenter: center, fromDistance: CLLocationDistance(15), pitch: 10, heading: CLLocationDirection(1))
            mapView.setCamera(camera, animated: false)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = center
            annotation.title = "T-Mobile"
            mapView.addAnnotation(annotation)
        
            
        }
    
//    изменение на кастомный pin
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = ImageAnnotation(
                annotation: annotation,
                reuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier
            )
            annotationView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            return annotationView
        }
    }

class ImageAnnotation: MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        image = UIImage(named: "ozero_5")
        
        let label = UILabel()
        label.text = "123"
        detailCalloutAccessoryView = label
        canShowCallout = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
