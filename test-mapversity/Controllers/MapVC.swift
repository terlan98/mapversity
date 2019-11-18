//
//  ViewController.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 10/1/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    
    var welcomeVCShown = false
    
    let initialLocation = CLLocation(latitude: 11.360717, longitude: -176.680205)
    
    var initialLocationCL: CLLocationCoordinate2D { // this variable is a copy of initialLocation. The only difference is class.
        get {
          return CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myMap.delegate = self
        
        centerMapOnLocation(location: initialLocation)
        
//        let circle = MKCircle(center: CLLocationCoordinate2DMake(initialLocation.coordinate.latitude, initialLocation.coordinate.longitude), radius: 20)
//        myMap.addOverlay(circle)

        
        drawCampusOverlay(width: 1040, height: 800)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(false)//DEBUG ONLY: Change it to false if you do not want to see the welcome screen
        {
            showOnboarding()
            welcomeVCShown = true
        }
    }
    
    ///Draws the campus overlay given the width and height of the overlay image.
    func drawCampusOverlay(width: Double, height: Double) {
        
        let xCoordinate = MKMapPoint(initialLocationCL).x - width / 2
        let yCoordinate = MKMapPoint(initialLocationCL).y - height / 2
        let rect = MKMapRect(x: xCoordinate, y: yCoordinate, width: width, height: height)
        
        let overlay = CampusOverlay(coordinate: initialLocationCL, boundingMapRect: rect)
        myMap.addOverlay(overlay)
    }
    
    ///Centers the map on a given location.
    func centerMapOnLocation(location: CLLocation) {
    
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), latitudinalMeters: 80, longitudinalMeters: 80)
        
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))// Changing span argument affects zoom
        
        myMap.setRegion(region, animated: true)
        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location.coordinate
//        self.myMap.addAnnotation(annotation)
    }
    
    func showOnboarding(){
        performSegue(withIdentifier: "onboardingVC", sender: self)
    }
}

extension MapVC: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
//        if overlay.isKind(of: MKCircle.self){
//
//            let circleRenderer = MKCircleRenderer(overlay: overlay)
//            circleRenderer.fillColor = UIColor.blue.withAlphaComponent(0.1)
//            circleRenderer.strokeColor = UIColor.blue
//            circleRenderer.lineWidth = 1
//            return circleRenderer
//        }
        if overlay is CampusOverlay {
            return CampusOverlayView(overlay: overlay, overlayImage: #imageLiteral(resourceName: "mapImage"))
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
