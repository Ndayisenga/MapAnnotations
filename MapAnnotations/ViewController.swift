//
//  ViewController.swift
//  MapAnnotations
//
//  Created by Ndayisenga Jean Claude on 26/04/2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(
        latitude: 31.2001,
        longitude: 29.9187
    
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        map.frame = view.bounds
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        ),
        animated: false)
        
        map.delegate = self
        
        addCustomPin()
    }
    
    private func addCustomPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Pokeman Here To Navigate With You"
        pin.subtitle = "Go and catch them all"
        map.addAnnotation(pin)
    }

    // Map
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            // Create the View
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
            
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "ball")
        
        return annotationView
    }
}

