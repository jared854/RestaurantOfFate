//
//  MapViewController.swift
//  Restaurant of Fate
//
//  Created by Christopher Gerencser and Jared Schwartz on 12/12/17.
//  Copyright © 2017 Jared Schwartz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

let restaurantNames = ["Tangent", "The Root", "The Oak House", "Acorn Coffee Shop", "Pandora's Pies", "Skid's Restaurant", "QDOBA","Subway","Tony's Pub-N-Subs", "Simply Thai and Sushi", "Freshii", "Einstein Bros. Bagels", "Tickle My Ribs BBQ", "Jack's Barbecue", "Sonic Drive-In",
                       "Mikes Deli West", " Cicis", "Taaza Bistro", "Golden Dragon", "Hong Kong Chinese Restaurant", "King Chef", "Harbor Inn Seafood", "Mykonos Grill", "Sal's Italian Restaurant", "Maria's Italian Restaurant", "Mellow Mushroom", "Mayflower Seafood", "La Cocina", "Stokely's BBQ", "Village Grill", "Arby's", "Umami Japanese Steakhouse", "Pandwar Fine Indian Cuisine", "Chick-fil-A", "Steak'n Shake", "Hooters", "IHOP", "San Marcos", "Red Robin", "Texas Roadhouse", "Buffalo Wind Wings", "Chili's Grill & Bar", "Burger King", "Moe's", "Hardee's", "Thai Blues", "Mixed Rice", "Wings To Go", "Harusaki", "Reno's Pizza", "Mimi's Pizza", "Prego's Trattoria", "The Tuscany Grill", "Peking House", "La Fiesta Express", "Chen's Cafe", "Shak's Grill", "Jack's Barbecue", "Fat Frogg Bar", "McDonalds", "Bojangles", "Jersy Mikes Subs", "Ciao Pizza", "Wholly Guacamole", "Taco Bell", "Pizza Hut", "Delancy's Restaurant", "Blue Ribbon Diner", "Wendy's", "Zacks' Hot Dogs", "Panera Bread", "Applebee's Neighborhood Grill"]



let rating = ["4.6","4.7","4.8","4.0","4.5", "4.4","5","4","4.4", "4.5", "3", "4.5", "4.5", "4.5", "3.4", "4.3", "4.2", "4.4","4.4", "4.4", "3.7", "4.5", "4.6", "3.9", "4.4","4.4","4.1", "4.3", "4.2", "3.9", "4.2", "4.3","4.4","3.7", "4.2", "3.7","4.3", "3.9", "4.4", "3.6", "4.1", "4.0", "4.0", "3.3", "4.1", "4.6", "4.4", "3.4", "4.5", "4.5", "4.7", "3.9", "3.7", "4.5", "4.2", "4.0", "4.5", "4.3", "3.1", "3.8", "4.0", "4.5", "4.1", "3.4", "3.0", "4.3", "4.2", "4.3", "4.4", "3.6", "3.8"]

var restaurantIndexWithinRadius = [Int]()

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    @IBAction func pickAgain(_ sender: Any) {
        rePick()
    }
    @IBOutlet weak var restaurantLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    //set default location to elon, update later in location manager
    var userLocation = CLLocation(latitude: 36.102718,  longitude: -79.502342)
    
    var index = 0
    
    let lManager = CLLocationManager()
    
    //span is measured in degree, 1 degree is about 69 miles
    var userSpan = Double(maxDistance) / 69.0 + 0.12
    
    //Coordinates of restaurants, restaurants are sorted by index across coordinates, names, and ratings
    let coordinates = [ CLLocation(latitude: 36.100896,  longitude: -79.507633),
    CLLocation(latitude: 36.100789, longitude: -79.507116),
    CLLocation(latitude: 36.101129, longitude: -79.506905),
    CLLocation(latitude: 36.101289, longitude: -79.506870),
    CLLocation(latitude: 36.101575, longitude: -79.506904),
    CLLocation(latitude: 36.103258, longitude: -79.507780),
    CLLocation(latitude: 36.107906, longitude: -79.497206),
    CLLocation(latitude: 36.100828, longitude: -79.507262),
    CLLocation(latitude: 36.101943, longitude: -79.512513),
    CLLocation(latitude: 36.102516, longitude: -79.514659),
    CLLocation(latitude: 36.105538, longitude: -79.505065),
    CLLocation(latitude: 36.107864, longitude: -79.497202),
    CLLocation(latitude: 36.080511, longitude: -79.529250),
    CLLocation(latitude: 36.108098, longitude: -79.542758),
    CLLocation(latitude: 36.082720, longitude: -79.511108),
    CLLocation(latitude: 36.080129, longitude: -79.508900),
    CLLocation(latitude: 36.080109, longitude: -79.510054),
    CLLocation(latitude: 36.080925, longitude: -79.505783),
    CLLocation(latitude: 36.079241, longitude: -79.513125),
    CLLocation(latitude: 36.081802, longitude: -79.485292),
    CLLocation(latitude: 36.080387, longitude: -79.490921),
    CLLocation(latitude: 36.080789, longitude: -79.476282),
    CLLocation(latitude: 36.082471, longitude: -79.472120),
    CLLocation(latitude: 36.075904, longitude: -79.488611),
    CLLocation(latitude: 36.077981, longitude: -79.483123),
    CLLocation(latitude: 36.071679, longitude: -79.494056),
    CLLocation(latitude: 36.078170, longitude: -79.487476),
    CLLocation(latitude: 36.077466, longitude: -79.486363),
    CLLocation(latitude: 36.073888, longitude: -79.490239),
    CLLocation(latitude: 36.070767, longitude: -79.495012),
    CLLocation(latitude: 36.071120, longitude: -79.496821),
    CLLocation(latitude: 36.070510, longitude: -79.499942),
    CLLocation(latitude: 36.069369, longitude: -79.496901),
    CLLocation(latitude: 36.068742, longitude: -79.498471),
    CLLocation(latitude: 36.068347, longitude: -79.500009),
    CLLocation(latitude: 36.066102, longitude: -79.498948),
    CLLocation(latitude: 36.068057, longitude: -79.507724),
    CLLocation(latitude: 36.067745, longitude: -79.508475),
    CLLocation(latitude: 36.068092, longitude: -79.515728),
    CLLocation(latitude: 36.068132, longitude: -79.510397),
    CLLocation(latitude: 36.068753, longitude: -79.521046),
    CLLocation(latitude: 36.067924, longitude: -79.513869),
    CLLocation(latitude: 36.068037, longitude: -79.521163),
    CLLocation(latitude: 36.063238, longitude: -79.469453),
    CLLocation(latitude: 36.081421, longitude: -79.507123),
    CLLocation(latitude: 36.081191, longitude: -79.510484),
    CLLocation(latitude: 36.105876, longitude: -79.541468),
    CLLocation(latitude: 36.082208, longitude: -79.540088),
    CLLocation(latitude: 36.080743, longitude: -79.484361),
    CLLocation(latitude: 36.081152, longitude: -79.515930),
    CLLocation(latitude: 36.069149, longitude: -79.522542),
    CLLocation(latitude: 36.070181, longitude: -79.523302),
    CLLocation(latitude: 36.078165, longitude: -79.529059),
    CLLocation(latitude: 36.132865, longitude: -79.494464),
    CLLocation(latitude: 36.106762, longitude: -79.543811),
    CLLocation(latitude: 36.102759, longitude: -79.514471),
    CLLocation(latitude: 36.063548, longitude: -79.608357),
    CLLocation(latitude: 36.063443, longitude: -79.607582),
    CLLocation(latitude: 36.064593, longitude: -79.607556),
    CLLocation(latitude: 36.063918, longitude: -79.606342),
    CLLocation(latitude: 36.064582, longitude: -79.607191),
    CLLocation(latitude: 36.062331, longitude: -79.606212),
    CLLocation(latitude: 36.062325, longitude: -79.606230),
    CLLocation(latitude: 36.079830, longitude: -79.478636),
    CLLocation(latitude: 36.081693, longitude: -79.478508),
    CLLocation(latitude: 36.081518, longitude: -79.476657),
    CLLocation(latitude: 36.094271, longitude: -79.438203),
    CLLocation(latitude: 36.094216, longitude: -79.438148),
    CLLocation(latitude: 36.074828, longitude: -79.490454),
    CLLocation(latitude: 36.069887, longitude: -79.496078)]
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        //comment this code to test on computer
        userLocation = location
        let span:MKCoordinateSpan = MKCoordinateSpanMake(userSpan, userSpan)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
    }
    
    func rePick(){
        let annotations = map.annotations
        for annotation in annotations{
            print("removed")
            map.removeAnnotation(annotation)
        }
        randomLocation()
    }
    
    func findRestaurantsInRadius (coordinates: [CLLocation]){
        print("print2")
        var count = 0
        //radius is in meters
        let radius = Double(maxDistance) * 1609.34
        print(radius)
        restaurantIndexWithinRadius.removeAll()
        for coor in coordinates{
            let coordinate = CLLocation(latitude: coor.coordinate.latitude, longitude: coor.coordinate.longitude)
            let distance = userLocation.distance(from: coordinate)
            if(distance <= radius){
                restaurantIndexWithinRadius.append(count)
            }
            count = count + 1
        }
    }
    
    func randomLocation() {
        let numRestaurants = restaurantIndexWithinRadius.count
        print(numRestaurants)
        let randomIndex = Int(arc4random_uniform(UInt32(numRestaurants)))
        index = randomIndex
        print(randomIndex)
        let coordinate = CLLocationCoordinate2DMake(coordinates[randomIndex].coordinate.latitude, coordinates[randomIndex].coordinate.longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        print(coordinate)
        annotation.title = restaurantNames[randomIndex]
        restaurantLabel.text = restaurantNames[randomIndex]
        annotation.subtitle = rating[randomIndex] + " Stars"
        ratingLabel.text = rating[randomIndex] + " Stars"
        map.addAnnotation(annotation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lManager.delegate = self
        lManager.desiredAccuracy = kCLLocationAccuracyBest
        lManager.requestWhenInUseAuthorization()
        lManager.startUpdatingLocation()
        findRestaurantsInRadius(coordinates: coordinates)
        randomLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

