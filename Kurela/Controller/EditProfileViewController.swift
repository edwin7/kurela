//
//  ProfileViewController.swift
//  Kurela
//
//  Created by Feby Lailani on 19/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    //Profile Pic Control
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var uploadPicButton: UIButton!
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
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    //Background View
    @IBOutlet weak var backgroundView: UIView!
    //Store current text field
    var activeTextField : UITextField? = nil
    //Picker View
    var pickerView = UIPickerView()
    let birthdayPicker = UIDatePicker()
    let birthdayFormatter = DateFormatter()
    let genderPickerData: [String] = ["Female", "Male"]
    let bloodTypesPickerData: [String] = ["A", "B", "O", "AB"]
    let weightPickerData: [String] = ["20 kg", "45 kg"]
    let heightPickerData: [String] = ["150 cm", "160 cm"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
//        print(backgroundScrollView.description)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EditProfileViewController.backgroundTap))
        self.backgroundView.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(EditProfileViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(EditProfileViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //Texfield delegate
        pickerView.delegate = self
        birthdayTextField.inputView = birthdayPicker
        genderTextField.inputView = pickerView
        bloodTextField.inputView = pickerView
        weightTextField.inputView = pickerView
        heightTextField.inputView = pickerView
        //About View
//        nameTextField.delegate = self
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
    
    func prepareScreen(){
        setDefaultStyleExcept(type: "about")
        createBirthdayPicker()
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
    func setDefaultStyleExcept(type: String) {
           switch type {
           case "about":
            aboutButton.setImage(UIImage(named: "profileactive1"), for: .normal)
            aboutLabel.textColor = UIColor(named:"AppColor")
            medicalButton.setImage(UIImage(named: "profileinactive2"), for: .normal)
            medicalLabel.textColor = UIColor.black
            documentButton.setImage(UIImage(named: "profileinactive3"), for: .normal)
            documentLabel.textColor = UIColor.black
            emergencyButton.setImage(UIImage(named: "profileinactive4"), for: .normal)
            emergencyLabel.textColor = UIColor.black
               break
           case "medical":
            medicalButton.setImage(UIImage(named: "profileactive2"), for: .normal)
            medicalLabel.textColor = UIColor(named:"AppColor")
            aboutButton.setImage(UIImage(named: "profileinactive1"), for: .normal)
            aboutLabel.textColor = UIColor.black
            documentButton.setImage(UIImage(named: "profileinactive3"), for: .normal)
            documentLabel.textColor = UIColor.black
            emergencyButton.setImage(UIImage(named: "profileinactive4"), for: .normal)
            emergencyLabel.textColor = UIColor.black
               break
           case "document":
            documentButton.setImage(UIImage(named:"profileactive3"), for: .normal)
            documentLabel.textColor = UIColor(named:"AppColor")
            aboutButton.setImage(UIImage(named: "profileinactive1"), for: .normal)
            aboutLabel.textColor = UIColor.black
            medicalButton.setImage(UIImage(named: "profileinactive2"), for: .normal)
            medicalLabel.textColor = UIColor.black
            emergencyButton.setImage(UIImage(named: "profileinactive4"), for: .normal)
            emergencyLabel.textColor = UIColor.black
               break
           case "emergency":
            emergencyButton.setImage(UIImage(named: "profileactive4"), for: .normal)
            emergencyLabel.textColor = UIColor(named:"AppColor")
            aboutButton.setImage(UIImage(named: "profileinactive1"), for: .normal)
            aboutLabel.textColor = UIColor.black
            medicalButton.setImage(UIImage(named: "profileinactive2"), for: .normal)
            medicalLabel.textColor = UIColor.black
            documentButton.setImage(UIImage(named: "profileinactive3"), for: .normal)
            documentLabel.textColor = UIColor.black
               break
           default:
            break
           }
       }
    func doneKeyboardButton(){
        //Keyboard ToolBar
        let pickerToolBar = UIToolbar()
        pickerToolBar.sizeToFit()
        //Done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        pickerToolBar.setItems([doneButton],animated: true)
        //Assign Toolbar
        birthdayTextField.inputAccessoryView = pickerToolBar
        genderTextField.inputAccessoryView = pickerToolBar
        bloodTextField.inputAccessoryView = pickerToolBar
        weightTextField.inputAccessoryView = pickerToolBar
        heightTextField.inputAccessoryView = pickerToolBar
    }
    
    @objc func donePressed()  {
        //Display date format
        if birthdayTextField.isFirstResponder {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            birthdayTextField.text = formatter.string(from: birthdayPicker.date)
            self.view.endEditing(true)
        }
        else {
        //Direct to:
          self.view.endEditing(true)
        }
    }
    func createBirthdayPicker(){
        //Toolbar
        doneKeyboardButton()
        //Assign datepicker to textfield
        birthdayTextField.inputView = birthdayPicker
        //Date picker mode
        birthdayPicker.datePickerMode = .date
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
               return 1
           }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //jika gender textfield yang terpilih, maka keluarkan data gender textfield
        //jika blood type text field yang terpilih, maka keluarkan data blood type
        if genderTextField.isFirstResponder{
            return genderPickerData.count
        } else if bloodTextField.isFirstResponder{
            return bloodTypesPickerData.count
        } else if weightTextField.isFirstResponder{
            return weightPickerData.count
        } else {
            return heightPickerData.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if genderTextField.isFirstResponder{
            return genderPickerData[row]
        } else if bloodTextField.isFirstResponder{
            return bloodTypesPickerData[row]
        } else if weightTextField.isFirstResponder{
            return weightPickerData[row]
        } else {
            return heightPickerData[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if genderTextField.isFirstResponder{
            genderTextField.text = genderPickerData[row]
        } else if bloodTextField.isFirstResponder{
            bloodTextField.text = bloodTypesPickerData[row]
        } else if weightTextField.isFirstResponder{
            weightTextField.text = weightPickerData[row]
        } else {
            heightTextField.text = heightPickerData[row]
        }
    }
    @IBAction func aboutTapped(_ sender: UIButton) {
        setDefaultStyleExcept(type: "about")
        prepareAboutView()
    }
    @IBAction func medicalTapped(_ sender: UIButton) {
        setDefaultStyleExcept(type: "medical")
        prepareMedicalView()
    }
    @IBAction func documentTapped(_ sender: UIButton) {
        setDefaultStyleExcept(type: "document")
        prepareDocumentView()
    }
    @IBAction func emergencyTapped(_ sender: UIButton) {
        setDefaultStyleExcept(type: "emergency")
        prepareEmergencyView()
    }
    @IBAction func birthdayPicker(_ sender: UITextField) {
    }
    
    @IBAction func genderPicker(_ sender: UITextField) {
    }
    
    @IBAction func bloodTypePicker(_ sender: UITextField) {
    }
    
    @IBAction func weightPicker(_ sender: UITextField) {
    }
    
    @IBAction func heightPicker(_ sender: UITextField) {
    }
    //Keyboard functions
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            // if keyboard size is not available for some reason, dont do anything
            return
        }
//        var shouldMoveViewUp = false
//
//        if let activateTextField = activeTextField {
//            let bottomOfTextField = activateTextField.convert(activateTextField.bounds, to: self.backgroundView).maxY;
//            let topOfKeyboard = self.backgroundView.frame.height - keyboardSize.height
//            if bottomOfTextField > topOfKeyboard {
//                shouldMoveViewUp = true
//            }
//        }
//
//        if (shouldMoveViewUp) {
//            self.backgroundView.frame.origin.y = 0 - keyboardSize.height
//        }
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        
        print(backgroundScrollView.description)
        backgroundScrollView.contentInset = contentInsets
        backgroundScrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        backgroundScrollView.contentInset = contentInsets
        backgroundScrollView.contentInset = contentInsets
    }
    
    @objc func backgroundTap(_ sender: UITapGestureRecognizer) {
        // go through all of the textfield inside the view, and end editing thus resigning first responder
        // ie. it will trigger a keyboardWillHide notification
        self.backgroundView.endEditing(true)
        }
}
extension EditProfileViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
}
