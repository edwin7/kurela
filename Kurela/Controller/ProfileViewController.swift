//
//  ProfileViewController.swift
//  Kurela
//
//  Created by Feby Lailani on 19/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    //Profile Pic Control
    
    
    //Segment Button control
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var medicalButton: UIButton!
    @IBOutlet weak var medicalLabel: UILabel!
    @IBOutlet weak var documentButton: UIButton!
    @IBOutlet weak var documentLabel: UILabel!
    @IBOutlet weak var emergencyButton: UIButton!
    @IBOutlet weak var emergencyLabel: UILabel!
    
    //View Button control
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var medicalView: UIView!
    @IBOutlet weak var documentView: UIView!
    @IBOutlet weak var emergencyView: UIView!
    
    //Textfield control
    //About View
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    //Medical View
    @IBOutlet weak var bloodTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var insuranceTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var allergyTextField: UITextField!
    @IBOutlet weak var medsheetTextField: UITextField!
    
    //Document View
    @IBOutlet weak var cvTextField: UITextField!
    @IBOutlet weak var portfolioTextField: UITextField!
    
    //Emergency View
    @IBOutlet weak var nameEmergencyTextField: UITextField!
    @IBOutlet weak var relationshipTextField: UITextField!
    @IBOutlet weak var addressEmergencyTextField: UITextField!
    @IBOutlet weak var phoneEmergencyTextField: UITextField!
    
    
    //Scroll View
    @IBOutlet weak var scrollView: UIScrollView!
    
    //background View
    @IBOutlet weak var backgroundView: UIView!
    
    //Store current text field
    var activeTextField : UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.backgroundTap))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(ProfileViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ProfileViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //Texfield delegate
        //About View
//        nameTextField.delegate = self
//        emailTextField.delegate = self
//        phoneTextField.delegate = self
//        birthdayTextField.delegate = self
//        genderTextField.delegate = self
//        addressTextField.delegate = self
//
//        //Medical View
//        bloodTextField.delegate = self
//        weightTextField.delegate = self
//        insuranceTextField.delegate = self
//        heightTextField.delegate = self
//        allergyTextField.delegate = self
//        medsheetTextField.delegate = self
//
//        //Document View
//        cvTextField.delegate = self
//        portfolioTextField.delegate = self
//
//        //Emergency View
//        nameEmergencyTextField.delegate = self
//        relationshipTextField.delegate = self
//        addressEmergencyTextField.delegate = self
//        phoneEmergencyTextField.delegate = self
    }
    
    
    func prepareAboutView () {
        aboutView.isHidden = false
        medicalView.isHidden = true
        documentView.isHidden = true
        emergencyView.isHidden = true
    }
    
    func prepareMedicalView () {
        aboutView.isHidden = true
        medicalView.isHidden = false
        documentView.isHidden = true
        emergencyView.isHidden = true
    }
    
    func prepareDocumentView() {
        aboutView.isHidden = true
        medicalView.isHidden = true
        documentView.isHidden = false
        emergencyView.isHidden = true
    }
    
    func prepareEmergencyView() {
        aboutView.isHidden = true
        medicalView.isHidden = true
        documentView.isHidden = true
        emergencyView.isHidden = false
    }
    
    @IBAction func aboutTapped(_ sender: Any) {
        prepareAboutView()
        
    }
    
    @IBAction func medicalTapped(_ sender: Any) {
        prepareMedicalView()
        
    }
    
    @IBAction func documentTapped(_ sender: UIButton) {
        prepareDocumentView()
    }
    
    @IBAction func emergencyTapped(_ sender: UIButton) {
        prepareEmergencyView()
    }
    
    //Keyboard functions
    
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            // if keyboard size is not available for some reason, dont do anything
            return
        }
        var shouldMoveViewUp = false
        
        if let activateTextField = activeTextField {
            let bottomOfTextField = activateTextField.convert(activateTextField.bounds, to: self.backgroundView).maxY;
            let topOfKeyboard = self.backgroundView.frame.height - keyboardSize.height
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
            
        }
        
        if (shouldMoveViewUp) {
            self.backgroundView.frame.origin.y = 0 - keyboardSize.height
        }
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        self.backgroundView.frame.origin.y = 0
    }
    
    @objc func backgroundTap(_ sender: UITapGestureRecognizer) {
        // go through all of the textfield inside the view, and end editing thus resigning first responder
        // ie. it will trigger a keyboardWillHide notification
        self.backgroundView.endEditing(true)
    }
    
    
    
}
extension ProfileViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
}

//    func configure(picture: UIImage, date: String, title: String, location: String, tags: UIImage, duedate: String, logos: UIImage){
   //        pictureView.image = picture
   //        dateLabel.text = date
   //        titleLabel.text = title
   //        locationLabel.text = location
   //        flagView.image = tags
   //        tagLabel.text = duedate
   //        logoView.image = logos
   //
   //        cardView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
   //        cardView.layer.shadowOpacity = 1
   //        cardView.layer.shadowRadius = 10
   //        titleView.clipsToBounds = true
   //        titleView.layer.cornerRadius = 10
   //        titleView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
   //
   //    }
   //
