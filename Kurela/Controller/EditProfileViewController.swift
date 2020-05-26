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
    
    var profileAbout: ProfileAbout = ProfileAbout()
    var profileMedical: ProfileMedical = ProfileMedical()
    var profileDocument: ProfileDocument = ProfileDocument()
    var profileEmergency: ProfileEmergency = ProfileEmergency()
    
    var profileData: UsersProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScreen()
        backgroundScrollView.adjustedContentInsetDidChange()
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
       
    }
    
    
    
    func prepareScreen(){
        // this code to get value of UsersProfile in coreData
        profileData = UsersProfile.fetchData(viewContext: getViewContext())
//        print(profileData)
        setDefaultStyleExcept(type: "about")
        createBirthdayPicker()
        
        // Opsi macam-macam unwrap
//        if (profileData?.name != nil) {
//            nameTextField.text = profileData?.name!
//        }
//
//        if let name = profileData?.name  {
//            nameTextField.text = name
//        }
        
        // Bikin default gender kosong
        var genderValue = ""
        
        if let gender = profileData?.genderIsMale {
            if (gender) {
                genderValue = "Male"
            } else {
                genderValue = "Female"
            }
        }
            print(genderValue)
        nameTextField.text = profileData?.name ?? ""
        emailTextField.text = profileData?.email ?? ""
        birthdayPicker.date = profileData?.birthDay ?? Date()
        phoneTextField.text = profileData?.phone ?? ""
        genderTextField.text = genderValue
        addressTextField.text = profileData?.address ?? ""
        bloodTextField.text = profileData?.bloodType
        weightTextField.text = profileData?.weight
        heightTextField.text = profileData?.height
        insuranceTextField.text = profileData?.insurance ?? ""
        allergyTextField.text = profileData?.allergy ?? ""
        medsheetTextField.text = profileData?.medicalSheet ?? ""
        cvTextField.text = profileData?.curriculumVitae ?? ""
        portfolioTextField.text = profileData?.portfolio ?? ""
        nameEmergencyTextField.text = profileData?.emergencyName ?? ""
        relationshipTextField.text = profileData?.relative ?? ""
        phoneEmergencyTextField.text = profileData?.emergencyPhone ?? ""
        addressEmergencyTextField.text = profileData?.emergencyAddress ?? ""
        
        
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
        }
        if genderTextField.isFirstResponder {
            genderTextField.text = genderPickerData[pickerView.selectedRow(inComponent: 0)]
        }
        if bloodTextField.isFirstResponder {
            bloodTextField.text = bloodTypesPickerData[pickerView.selectedRow(inComponent: 0)]
        }
        if weightTextField.isFirstResponder {
            weightTextField.text = weightPickerData[pickerView.selectedRow(inComponent: 0)]
        }
        if heightTextField.isFirstResponder {
            heightTextField.text = heightPickerData[pickerView.selectedRow(inComponent: 0)]
        }
        
        
        self.view.endEditing(true)
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
        let row = pickerView.selectedRow(inComponent: 0)
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
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        UsersProfile.saveProfile(viewContext: getViewContext(), profileAbout: profileAbout, profileMedical: profileMedical, profileDocument: profileDocument, profileEmergency: profileEmergency)
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
    @IBAction func onChangeInput(_ sender: UITextField) {
        switch sender {
        case nameTextField:
            profileAbout.nameAbout = nameTextField.text ?? ""
            break
        case emailTextField:
            profileAbout.emailAbout = emailTextField.text ?? ""
            break
        case phoneTextField:
            profileAbout.phoneAbout = phoneTextField.text ?? ""
            break
        case addressTextField:
            profileAbout.addressAbout = addressTextField.text ?? ""
            break
        case insuranceTextField:
            profileMedical.insuranceMed = insuranceTextField.text ?? ""
            break
        case allergyTextField:
            profileMedical.allergyMed = allergyTextField.text ?? ""
            break
        case medsheetTextField:
            profileMedical.medicalSheetMed = medsheetTextField.text ?? ""
            break
        case cvTextField:
            profileDocument.curriculumVitaeDoc = cvTextField.text ?? ""
            break
        case portfolioTextField:
            profileDocument.portfolioDoc = portfolioTextField.text ?? ""
            break
        case nameEmergencyTextField:
            profileEmergency.nameEmergency = nameEmergencyTextField.text ?? ""
            break
        case relationshipTextField:
            profileEmergency.relativeEmergency = relationshipTextField.text ?? ""
            break
        case addressEmergencyTextField:
            profileEmergency.addressEmergency = addressEmergencyTextField.text ?? ""
            break
        case phoneEmergencyTextField:
            profileEmergency.phoneEmergency = phoneEmergencyTextField.text ?? ""
            break
        default:
            break
        }
    }
    @IBAction func pickerDidEnd (_ sender: UITextField) {
//        profileAbout.nameAbout = nameTextField.text ?? ""
        switch sender {
        case birthdayTextField:
            profileAbout.birthdayAbout = birthdayPicker.date
            break
        case genderTextField:
            profileAbout.genderAbout = genderTextField.text! == "Male"
            break
        case bloodTextField:
            profileMedical.bloodTypesMed = bloodTextField.text ?? ""
            break
        case weightTextField:
            profileMedical.weightMed = weightTextField.text ?? ""
            break
        case heightTextField:
            profileMedical.heightMed = heightTextField.text ?? ""
            break
        default:
            break
        }
    }
    //Keyboard functions
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            // if keyboard size is not available for some reason, dont do anything
            return
        }
        
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

//extension EditProfileViewController : UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.activeTextField = textField
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.activeTextField = nil
//    }
//}
