/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController {
  
  @IBOutlet weak var sourceField: UITextField!
  @IBOutlet weak var destinationField1: UITextField!
  @IBOutlet weak var destinationField2: UITextField!
  @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
  @IBOutlet var enterButtonArray: [UIButton]!
  
  var originalTopMargin: CGFloat!
    //5 use the array with tupples in place of the MKMapItem
    var locationTuples:[(textField:UITextField!,mapItem:MKMapItem?)]!
  
    //1 declare locationManager as a global instance strong reference (difference between strong weak)
    let locationManager = CLLocationManager()
    
    var locationsArray: [(textField: UITextField!, mapItem: MKMapItem?)] {
        var filtered = locationTuples.filter({ $0.mapItem != nil })
        filtered += [filtered.first!]
        return filtered
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // 6
    locationTuples = [(sourceField,nil),(destinationField1,nil),(destinationField2,nil)]
    originalTopMargin = topMarginConstraint.constant
    //2 set delegate ask for authorization when the app is in use. This alert will no longer appear upon subsequent app launches once the user’s selected a response.
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    //3 set the desired accuracy of CLLocationManager's location
    if CLLocationManager.locationServicesEnabled(){
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        if #available(iOS 9.0, *) {
            locationManager.requestLocation()
        } else {
            // Fallback on earlier versions
        }
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    navigationController?.navigationBarHidden = true
  }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var directionsViewController = segue.destinationViewController as! DirectionsViewController
        directionsViewController.locationArray = locationsArray
    }
    
  @IBAction func getDirections(sender: AnyObject) {
    view.endEditing(true)
    performSegueWithIdentifier("show_directions", sender: self)
  }
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if locationTuples[0].mapItem == nil || (locationTuples[1].mapItem == nil && locationTuples[2].mapItem == nil){
            showAlert("Please enter a valid starting point and at least one destination.")
            return  false
        }else{
            return true
        }
    }

  @IBAction func addressEntered(sender: UIButton) {
    view.endEditing(true)
    // 2.1 In the interface builder, each Enter button has been given a tag corresponding to its order from top to bottom: 1, 2 and 3, respectively. You use sender.tag to find the corresponding text field.
      let currentTextField = locationTuples[sender.tag-1].textField
    // 2.2 Forward geocode the address using CLGeocoder's geocodeAddressString(_:completionHandler:).
    CLGeocoder().geocodeAddressString(currentTextField.text!) { (placemarks:[CLPlacemark]?, error:NSError?) -> Void in
        if let placemarks = placemarks{
            var addresses = [String]()
            for placemark in placemarks{
                addresses.append(self.formatAddressFromPlacemark(placemark))
            }
            // 2.xxx
            self.showAddressTable(addresses,textField:currentTextField,placemarks:placemarks,sender:sender)
        }else{
            self.showAlert("Addresses not found")
        }
    }
  }

  @IBAction func swapFields(sender: AnyObject) {
    swap(&destinationField1.text,&destinationField2.text)
    swap(&locationTuples[1].mapItem, &locationTuples[2].mapItem)
    swap(&self.enterButtonArray.filter{$0.tag == 2}.first!.selected, &self.enterButtonArray.filter{$0.tag == 3}.first!.selected)
  }
  
  func showAlert(alertString: String) {
    let alert = UIAlertController(title: nil, message: alertString, preferredStyle: .Alert)
    let okButton = UIAlertAction(title: "OK",
      style: .Cancel) { (alert) -> Void in
    }
    alert.addAction(okButton)
    presentViewController(alert, animated: true, completion: nil)
  }
  
  // The remaining methods handle the keyboard resignation/
  // move the view so that the first responders aren't hidden
  
  func moveViewUp() {
    if topMarginConstraint.constant != originalTopMargin {
      return
    }
    
    topMarginConstraint.constant -= 165
    UIView.animateWithDuration(0.3, animations: { () -> Void in
      self.view.layoutIfNeeded()
    })
  }
  
  func moveViewDown() {
    if topMarginConstraint.constant == originalTopMargin {
      return
    }
    
    topMarginConstraint.constant = originalTopMargin
    UIView.animateWithDuration(0.3, animations: { () -> Void in
      self.view.layoutIfNeeded()
    })
  }
    
    // 8 conver the location data into a readable address
    // Notes: tutorial use the method joinWithSeparator which was not found
    func formatAddressFromPlacemark(placemark:CLPlacemark) ->String{
        var feedback = placemark.addressDictionary!["FormattedAddressLines"] as![String]
        return (", ".join(feedback))
        // just was a test
//        var att = [1,3,4]
//        var s = ", ".join(att.map{ $0.description})
    }
    
    // 2.3 create an AddressTable and set its addresses array using the CLPlacemarks returned by geocodeAddressString(_:completionHandler:)
    func showAddressTable(addresses:[String],textField:UITextField,placemarks:[CLPlacemark],sender:UIButton){
        let addressTableView = AddressTableView(frame: UIScreen.mainScreen().bounds,style:UITableViewStyle.Plain)
        addressTableView.addresses = addresses
        // pass the AddressTableView the current text filed ,the placemarks, a pointer to the current instance of ViewController.swift
        addressTableView.currentTextField = textField
        addressTableView.placemarkArray = placemarks
        addressTableView.mainViewController = self
        addressTableView.sender = sender

        addressTableView.delegate = addressTableView
        addressTableView.dataSource = addressTableView
        view.addSubview(addressTableView)
    }
}

extension ViewController: UITextFieldDelegate {
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    enterButtonArray.filter{$0.tag == textField.tag}.first!.selected = false
    locationTuples[textField.tag-1].mapItem = nil
    return true
  }
  
  func textFieldDidBeginEditing(textField: UITextField) {
    moveViewUp()
  }

  func textFieldDidEndEditing(textField: UITextField) {
    moveViewDown()
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    view.endEditing(true)
    moveViewDown()
    return true
  }
}

extension ViewController: CLLocationManagerDelegate {
  
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    // 4 for most geocoding results [CLPlacemarks] array only contain one element
    CLGeocoder().reverseGeocodeLocation(locations.last!) { (placemarks:[CLPlacemark]?, error:NSError?) -> Void in
        if let placemarks = placemarks{
            let placemark = placemarks[0]
            // 7 add an MAMapItem representation of the user's current location to the first tuple in locationTuples
            self.locationTuples[0].mapItem = MKMapItem(placemark: MKPlacemark(coordinate: placemark.location!.coordinate, addressDictionary: placemark.addressDictionary as! [String:AnyObject]?))
            // 9 set the source UITextField with the new address
            self.sourceField.text = self.formatAddressFromPlacemark(placemark)
            self.enterButtonArray.filter{$0.tag == 1}.first!.selected = true
        }
    }
  }
  
  func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print(error)
  }
}