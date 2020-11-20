//
//  CurrentLocationViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

import UIKit
import CoreLocation

class CurrentLocationViewController: UIViewController {

    @IBOutlet weak var imgPinBounce: UIImageView!
    @IBOutlet weak var imgPin: UIImageView!
    @IBOutlet weak var lblLocationName: UILabel!

    private let locationManager = CLLocationManager()
    private var locationName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLocationManager()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatePin()
    }

    private func setupUI() {
        lblLocationName.text = "Searching..."
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    private func animatePin() {
        UIView.animate(withDuration: 1, animations: {
            self.imgPinBounce.frame.origin.y += 50
        }, completion: { (_) in
            UIView.animateKeyframes(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                self.imgPinBounce.frame.origin.y -= 50
            })
        })
    }
}

extension CurrentLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else {return}
        manager.stopUpdatingLocation()

        CLGeocoder().reverseGeocodeLocation(location) { placemark, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let placemark = placemark?.first else {
                print("Placemark not found!")
                return
            }

            self.locationName = "\(placemark.locality ?? "") - \(placemark.subLocality ?? "")"
            self.lblLocationName.text = self.locationName

            let userDefaults = UserDefaults.standard
            userDefaults.setValue(self.locationName, forKey: "locationName")

            let tabBarVC = TabBar.viewController()
            tabBarVC.modalPresentationStyle = .fullScreen
            self.present(tabBarVC, animated: true)
        }
    }
}
