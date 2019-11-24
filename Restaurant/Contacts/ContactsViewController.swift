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
}

class ContactsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var presenter: ContactsPresenterProtocol!
    private let configurator: ContactsConfiguratorProtocol = ContactsConfigurator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        configurator.configure(with: self)
        presenter.showContacts()
        
        imageView.image = UIImage(named: "log")
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
}

