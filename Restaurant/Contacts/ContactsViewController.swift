//
//  ContactsViewController.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit
import MapKit

protocol ContactsViewControllerProtocol: class {
    func setDescription(with text: String)
    func setupAddress(with text: String)
    func setupPlacemark(name: String, location: String)
}

class ContactsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var presenter: ContactsPresenterProtocol!
    private let configurator: ContactsConfiguratorProtocol = ContactsConfigurator()
    
    let annotationIdentifier = "annotationIdentifier" // delete this line
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.showContacts()
    }
    @IBAction func callButtonAction(_ sender: UIButton) {
        presenter.phoneCall()
    }
    @IBAction func instagramButtonAction(_ sender: UIButton) {
        presenter.showInstagram()
    }
    @IBAction func vkButtonAction(_ sender: UIButton) {
        presenter.showVK()
    }
}

//MARK: - ContactsViewControllerProtocol
extension ContactsViewController: ContactsViewControllerProtocol {
    
    func setDescription(with text: String) {
        descriptionLabel.text = text
    }
    
    func setupAddress(with text: String) {
        addressLabel.text = text
    }
    
    func setupPlacemark(name: String, location: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let placemarks = placemarks else { return }
            let placemark = placemarks.first
            let annotation = MKPointAnnotation()
            annotation.title = name
            annotation.subtitle = location
            
            guard let placemarkLocation = placemark?.location else { return }
            annotation.coordinate = placemarkLocation.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
        }
    }
    
}

//MARK: - MKMapViewDelegate
extension ContactsViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil}
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = #colorLiteral(red: 0.03141137213, green: 0.8178852201, blue: 0.902800858, alpha: 1)
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "love") 
        annotationView?.rightCalloutAccessoryView = imageView
        return annotationView
    }
}


