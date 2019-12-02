//
//  ViewController.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 10/1/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController, LocationSelectorDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var searchBarView: SearchBarView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var welcomeVCShown = false
    
    let initialLocation = CLLocation(latitude: 11.360717, longitude: -176.680205)
    
    var initialLocationCL: CLLocationCoordinate2D { // this variable is a copy of initialLocation. The only difference is its class.
        get {
          return CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        }
    }
    
    var map = Map(mapImage: UIImage(), connectables: [])
    
    var focusIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMap.delegate = self
        
        map = DataBaseHandler.instance.getMap()
        
        centerMapOnLocation(location: initialLocation)
        
        drawCampusOverlay(width: 4371.5, height: 2461.5)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(welcomeVCShown)//DEBUG ONLY: Change it to false if you do not want to see the welcome screen
        {
            showOnboarding()
            welcomeVCShown = true
            
            centerMapOnLocation(location: initialLocation)
        }
    }
    
    ///Handles UI changes that are needed for switching to a navigation
    func switchToNavigationMode() {
        
        searchBarView.isHidden = true
        nextBtn.isHidden = false
        cancelBtn.isHidden = false
        
        drawPath()
        addAnnotation(for: map.connectables[0] as! Location)
        addAnnotation(for: map.connectables[map.connectables.count - 1] as! Location)
        
        centerMapOnLocation(location: CLLocation(latitude: (map.connectables[0] as! Location).coordinate.0 , longitude: (map.connectables[0] as! Location).coordinate.1))
    }
    
    ///Handles UI changes that are needed for returning from to a navigation
    func returnFromNavigationMode() {
        
        searchBarView.isHidden = false
        nextBtn.isHidden = true
        cancelBtn.isHidden = true
        
        self.myMap.removeAnnotations(myMap.annotations)
        self.myMap.removeOverlay(myMap.overlays.last!)
        
        centerMapOnLocation(location: initialLocation)
    }
    
    ///Zooms in to the next check point of path. If no points are left, does nothing.
    func setFocusOnNextCheckPoint() {
        
        if(map.connectables.count == focusIndex) {
            returnFromNavigationMode()
            focusIndex = 1
            return
        }
        
        centerMapOnLocation(location: CLLocation(latitude: (map.connectables[focusIndex] as! Location).coordinate.0 , longitude: (map.connectables[focusIndex] as! Location).coordinate.1))
        focusIndex += 1
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
    
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), latitudinalMeters: 220, longitudinalMeters: 220)
        
        myMap.setRegion(region, animated: true)
    }
    
    func drawPath() {
        var points = [CLLocationCoordinate2D]()
        
        for connectable in map.connectables {
            if let location = connectable as? Location {
                
                points.append(CLLocationCoordinate2D(latitude: location.coordinate.0, longitude: location.coordinate.1))
            }
        }
        
        let polyline = MKPolyline(coordinates: points, count: points.count)

        self.myMap.addOverlay(polyline)
    }
    
    ///Adds annotation to the map for a given Location object
    func addAnnotation(for location: Location) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.0, longitude: location.coordinate.1)
        
        self.myMap.addAnnotation(annotation)
    }
    
    func showOnboarding(){
        performSegue(withIdentifier: "onboardingVC", sender: self)
    }
    
    func didSelectLocation() {
        switchToNavigationMode()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? LocationSelectionVC {
            nextVC.delegate = self
        }
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        setFocusOnNextCheckPoint()
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        returnFromNavigationMode()
    }
    
}

extension MapVC: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is CampusOverlay {
            
            return CampusOverlayView(overlay: overlay, overlayImage: map.mapImage)
        }
        else if(overlay is MKPolyline) {
            
            let polyLineRender = MKPolylineRenderer(overlay: overlay)
            polyLineRender.strokeColor = #colorLiteral(red: 0, green: 0.05882352941, blue: 0.5137254902, alpha: 1)
            polyLineRender.lineWidth = 6
            
            return polyLineRender
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
}
