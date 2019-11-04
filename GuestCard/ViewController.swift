//
//  ViewController.swift
//  GuestCard
//
//  Created by Adithya RB on 30/10/19.
//  Copyright © 2019 Adithya RB. All rights reserved.
//

import UIKit
import CoreData
import DropDown

class ViewController: UIViewController,UITextFieldDelegate
{
    let dropdown1 = DropDown()
    let dropdown2 = DropDown()
    
    @IBOutlet weak var stateInsideViw: UIView!
    
    @IBOutlet weak var priceRangeInsideViw: UIView!
    
    @IBOutlet weak var dateInsideViw: UIView!
    
    
    @IBOutlet weak var pickerBackViw: UIView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dogStackViw: UIStackView!
    
    @IBOutlet weak var catStackViw: UIStackView!
    
    @IBOutlet weak var petSwitch: UISwitch!
    
    
    @IBOutlet weak var firstNameFld: MyTextField!
    @IBOutlet weak var lastNameFld: MyTextField!
    
    @IBOutlet weak var phoneNumberFld: MyTextField!
    
    @IBOutlet weak var emailFld: MyTextField!
    
    @IBOutlet weak var currentAddressFld: MyTextField!
    
    @IBOutlet weak var cityFld: MyTextField!
    
    @IBOutlet weak var stateFld: MyTextField!
    
    @IBOutlet weak var zipcodeFld: MyTextField!
    
    @IBOutlet weak var employerFld: MyTextField!
    
    @IBOutlet weak var occupationFld: MyTextField!
    
    @IBOutlet weak var aboutFld: MyTextField!
    
    @IBOutlet weak var moveFld: MyTextField!
    
    @IBOutlet weak var leaseTermFld: MyTextField!
    
    @IBOutlet weak var whyMoveFld: MyTextField!
    
    @IBOutlet weak var numberOfOccupantsFld: MyTextField!
    
    @IBOutlet weak var numberOfBedrromsFld: MyTextField!
    
    @IBOutlet weak var numberOfBathsFld: MyTextField!
    
    @IBOutlet weak var priceRangeFld: MyTextField!
    
    @IBOutlet weak var areasInterestedFld: MyTextField!
    
    @IBOutlet weak var communitiesTouredFld: MyTextField!
    
    @IBOutlet weak var specialFeaturesFld: MyTextField!
    
    @IBOutlet weak var numberOfDogsFld: MyTextField!
    
    @IBOutlet weak var dogWeightFld: MyTextField!
    
    @IBOutlet weak var dogBreedFld: MyTextField!
    
    @IBOutlet weak var numberOfCatsFld: MyTextField!
    
    @IBOutlet weak var catWeightFld: MyTextField!
    
    @IBOutlet weak var catOtherFld: MyTextField!
    
    @IBOutlet weak var signatureFld: MyTextField!
    
    @IBOutlet weak var dateFld: MyTextField!
    
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var petSwitchHeightConstraint: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        pickerBackViw.isHidden = true
        
        modTextFld(fld: firstNameFld)
        modTextFld(fld: lastNameFld)
        modTextFld(fld: phoneNumberFld)
        modTextFld(fld: emailFld)
        modTextFld(fld: currentAddressFld)
        modTextFld(fld: cityFld)
        modTextFld(fld: stateFld)
        modTextFld(fld: zipcodeFld)
        modTextFld(fld: employerFld)
        modTextFld(fld: occupationFld)
        modTextFld(fld: aboutFld)
        modTextFld(fld: moveFld)
        modTextFld(fld: leaseTermFld)
        modTextFld(fld: whyMoveFld)
        modTextFld(fld: numberOfOccupantsFld)
        modTextFld(fld: numberOfBedrromsFld)
        modTextFld(fld: numberOfBathsFld)
        modTextFld(fld: priceRangeFld)
        modTextFld(fld: areasInterestedFld)
        modTextFld(fld: communitiesTouredFld)
        modTextFld(fld: specialFeaturesFld)
        modTextFld(fld: numberOfDogsFld)
        modTextFld(fld: dogWeightFld)
        modTextFld(fld: dogBreedFld)
        modTextFld(fld: numberOfCatsFld)
        modTextFld(fld: catWeightFld)
        modTextFld(fld: catOtherFld)
        modTextFld(fld: signatureFld)
        modTextFld(fld: dateFld)
        
        
        firstNameFld.delegate = self
        lastNameFld.delegate = self
        phoneNumberFld.delegate = self
        emailFld.delegate = self
        currentAddressFld.delegate = self
        cityFld.delegate  = self
        stateFld.delegate  = self
        zipcodeFld.delegate = self
        employerFld.delegate = self
        occupationFld.delegate = self
        aboutFld.delegate = self
        moveFld.delegate = self
        leaseTermFld.delegate = self
        whyMoveFld.delegate = self
        numberOfOccupantsFld.delegate = self
        numberOfBedrromsFld.delegate = self
        numberOfBathsFld.delegate = self
        priceRangeFld.delegate = self
        areasInterestedFld.delegate = self
        communitiesTouredFld.delegate = self
        specialFeaturesFld.delegate = self
        numberOfDogsFld.delegate = self
        dogWeightFld.delegate = self
        dogBreedFld.delegate = self
        numberOfCatsFld.delegate = self
        catWeightFld.delegate = self
        catOtherFld.delegate = self
        signatureFld.delegate = self
        dateFld.delegate = self
        
        
        
        petSwitch.isOn = false
//        petSwitchHeightConstraint.constant = 10
        //self.view.addSubview(zicbDesignTop())
        //self.view.addSubview(zicbDesignBottom()
//        
//        self.view.addSubview(zicbDesignTop1())
//        self.view.addSubview(zicbDesignBottom1())
        
        submitBtn.layer.cornerRadius =  25.0
        submitBtn.clipsToBounds = true
        submitBtn.backgroundColor = UIColor.purple//UIColor(red:0.19, green:0.27, blue:0.55, alpha:1)
        
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        
        stateInsideViw.isUserInteractionEnabled = true
        stateInsideViw.addGestureRecognizer(tapGestureRecognizer1)
        
        dropdown1.anchorView = stateInsideViw
        dropdown1.dismissMode = .onTap
        dropdown1.direction = .any
        dropdown1.dataSource = ["Alaska","California","Florida","Indiana","Nevada","New York","Texas","Washington"]
        dropdown1.selectionAction = { [unowned self] (index, item) in
            
            self.stateFld.text = item
            
        }
        
        priceRangeInsideViw.isUserInteractionEnabled = true
        priceRangeInsideViw.addGestureRecognizer(tapGestureRecognizer2)
        
        dropdown2.anchorView = priceRangeInsideViw
        dropdown2.dismissMode = .onTap
        dropdown2.direction = .any
        dropdown2.dataSource = ["100$ - 200$","201$ - 350$","351$ - 500$","501$ - 1000$"]
        dropdown2.selectionAction = { [unowned self] (index, item) in
            
            self.priceRangeFld.text = item
            
        }
        
        dateInsideViw.isUserInteractionEnabled = true
        dateInsideViw.addGestureRecognizer(tapGestureRecognizer3)
        
        datePicker.date = Date()
        
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        
        if(tapGestureRecognizer.view == stateInsideViw)
        {
            dropdown1.show()
        }
        else if(tapGestureRecognizer.view == priceRangeInsideViw)
        {
            dropdown2.show()
        }
        else if(tapGestureRecognizer.view == dateInsideViw)
        {
            self.view.endEditing(true)
            pickerBackViw.isHidden = false
        }
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        
        if(textField != dateFld)
        {
            pickerBackViw.isHidden = true
        
            
        }
        
        return true
    }

    
    @IBAction func pickerDoneActn(_ sender: Any) {
        
        pickerBackViw.isHidden = true
    }
    
    @IBAction func datePickerActn(_ sender: Any)
    {
        
        let dateFormatter = DateFormatter()
        
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: datePicker.date)
        
        
        
        dateFld.text = "\(strDate)"
        
        
        
    }
    
    
    /*
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape
        {
//            for view in subviews {
//                if view is Triangle {
//                    view.removeFromSuperview()
//                }
//            }
            
            view.subviews.forEach {_ in
//            $0.removeFromSuperview()
                if view is Triangle {
                    view.removeFromSuperview()
                }
        }
            
            print("Landscape")
        }
        else
        {
            
            print("Portrait")
        }
    }
    */

    @IBAction func petActn(_ sender: Any)
    {
//        if(petSwitch.isOn)
//        {
//            petSwitch.isOn = false
//            petSwitchHeightConstraint.constant = 10
//        }
//        else
//        {
//            petSwitch.isOn = true
//            petSwitchHeightConstraint.constant = 210
//        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == firstNameFld || textField == lastNameFld || textField == cityFld || textField == occupationFld || textField == aboutFld || textField == whyMoveFld || textField == signatureFld{
            
            let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
            if string.rangeOfCharacter(from: characterset.inverted) != nil {
                return false
            }
            
            let maxLength = 35
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        
        if textField == phoneNumberFld || textField == zipcodeFld || textField == leaseTermFld || textField == numberOfOccupantsFld || textField == numberOfBedrromsFld || textField == numberOfBathsFld || textField == numberOfDogsFld || textField == numberOfCatsFld || textField == dogWeightFld || textField == catWeightFld{
            
            let characterset = CharacterSet(charactersIn: "0123456789")
            if string.rangeOfCharacter(from: characterset.inverted) != nil {
                return false
            }
            
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        
        return true
    }

    func zicbDesignTop() -> Triangle
    {
        let topview = Triangle(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        topview.backgroundColor = UIColor.clear
        topview.color = UIColor.blue//UIColor(red:0.19, green:0.27, blue:0.55, alpha:1)
        topview.firstPointX = 0
        topview.firstPointY = 0
        topview.secondPointX = 1
        topview.secondPointY = 0
        topview.thirdPointX = 0
        topview.thirdPointY = 1
        return topview
    }
    
    func zicbDesignTop1() -> Triangle
    {
        let topview = Triangle(frame: CGRect(x: UIScreen.main.bounds.width - 150, y: 0, width: 150, height: 150))
        topview.backgroundColor = UIColor.clear
        topview.color = UIColor.blue//UIColor(red:0.19, green:0.27, blue:0.55, alpha:1)
        topview.firstPointX = 1
        topview.firstPointY = 0
        topview.secondPointX = 0
        topview.secondPointY = 0
        topview.thirdPointX = 1
        topview.thirdPointY = 1
        return topview
    }
    
    func zicbDesignBottom() -> Triangle
    {
        let topview = Triangle(frame: CGRect(x: UIScreen.main.bounds.width - 150, y: UIScreen.main.bounds.height - 150, width: 150, height: 150))
        topview.backgroundColor = UIColor.clear
        topview.color = UIColor.green//UIColor(red:0.93, green:0.53, blue:0, alpha:1)
        topview.firstPointX = 1
        topview.firstPointY = 0
        topview.secondPointX = 0
        topview.secondPointY = 1
        topview.thirdPointX = 1
        topview.thirdPointY = 1
        return topview
    }
    
    func zicbDesignBottom1() -> Triangle
    {
        let topview = Triangle(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 150, width: 150, height: 150))
        topview.backgroundColor = UIColor.clear
        topview.color = UIColor.green//UIColor(red:0.93, green:0.53, blue:0, alpha:1)
        topview.firstPointX = 1
        topview.firstPointY = 1
        topview.secondPointX = 0
        topview.secondPointY = 0
        topview.thirdPointX = 0
        topview.thirdPointY = 1
        return topview
    }
    
    
    func modTextFld(fld:MyTextField)
    {
        fld.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        fld.layer.borderWidth = 2.0
        fld.layer.cornerRadius = 30.0
    }
    
    
    @IBAction func submitActn(_ sender: Any)
    {
        
        let firstname = firstNameFld.text ?? ""
        let lastname = lastNameFld.text ?? ""
        let phonenumber = phoneNumberFld.text ?? ""
        let email = emailFld.text ?? ""
        let currentaddress = currentAddressFld.text ?? ""
        let city = cityFld.text ?? ""
        let state = stateFld.text ?? ""
        let zipcode = zipcodeFld.text ?? ""
        let employer = employerFld.text ?? ""
        let occupation = occupationFld.text ?? ""
        let about = aboutFld.text ?? ""
        let move = moveFld.text ?? ""
        let lease = leaseTermFld.text ?? ""
        let whymove = whyMoveFld.text ?? ""
        let numberofoccupants  = numberOfOccupantsFld.text ?? ""
        let numberofbedrooms = numberOfBedrromsFld.text ?? ""
        let numberofbaths = numberOfBathsFld.text ?? ""
        let pricerange = priceRangeFld.text  ?? ""
        let areasinterested = areasInterestedFld.text ?? ""
        let communities = communitiesTouredFld.text ?? ""
        let specialfeatures = specialFeaturesFld.text ?? ""
        let numberofdogs = numberOfDogsFld.text ?? ""
        let dogweight = dogWeightFld.text ?? ""
        let dogbreed = dogBreedFld.text ?? ""
        let numberofcats = numberOfCatsFld.text ?? ""
        let catweight = catWeightFld.text ?? ""
        let catother = catOtherFld.text ?? ""
        let signature = signatureFld.text  ?? ""
        let date = dateFld.text ?? ""
        
        checkErrors(labelname: firstname, fieldname: firstNameFld)
        checkErrors(labelname: lastname, fieldname: lastNameFld)
        checkErrors(labelname: phonenumber, fieldname: phoneNumberFld)
        checkErrors(labelname: email, fieldname: emailFld)
        checkErrors(labelname: currentaddress, fieldname: currentAddressFld)
        checkErrors(labelname: city, fieldname: cityFld)
        checkErrors(labelname: state, fieldname: stateFld)
        checkErrors(labelname: zipcode, fieldname: zipcodeFld)
        checkErrors(labelname: employer, fieldname: employerFld)
        checkErrors(labelname: occupation, fieldname: occupationFld)
        checkErrors(labelname: about, fieldname: aboutFld)
        checkErrors(labelname: move, fieldname: moveFld)
        checkErrors(labelname: lease, fieldname: leaseTermFld)
        checkErrors(labelname: whymove, fieldname: whyMoveFld)
        checkErrors(labelname: numberofoccupants, fieldname: numberOfOccupantsFld)
        checkErrors(labelname: numberofbedrooms, fieldname: numberOfBedrromsFld)
        checkErrors(labelname: numberofbaths, fieldname: numberOfBathsFld)
        checkErrors(labelname: pricerange, fieldname: priceRangeFld)
        checkErrors(labelname: areasinterested, fieldname: areasInterestedFld)
        checkErrors(labelname: communities, fieldname: communitiesTouredFld)
        checkErrors(labelname: specialfeatures, fieldname: specialFeaturesFld)
        checkErrors(labelname: signature, fieldname: signatureFld)
        checkErrors(labelname: date, fieldname: dateFld)
        
        if petSwitch.isOn
        {
            checkErrors(labelname: numberofdogs, fieldname: numberOfDogsFld)
            checkErrors(labelname: dogweight, fieldname: dogWeightFld)
            checkErrors(labelname: dogbreed, fieldname: dogBreedFld)
            checkErrors(labelname: numberofcats, fieldname: numberOfCatsFld)
            checkErrors(labelname: catweight, fieldname: catWeightFld)
            checkErrors(labelname: catother, fieldname: catOtherFld)
        }
        else
        {
            numberOfDogsFld.hasError = false
            dogWeightFld.hasError = false
            dogBreedFld.hasError = false
            numberOfCatsFld.hasError = false
            catWeightFld.hasError = false
            catOtherFld.hasError = false
        }
        
        if firstNameFld.hasError == false && lastNameFld.hasError == false && phoneNumberFld.hasError == false && currentAddressFld.hasError == false && cityFld.hasError == false && stateFld.hasError == false && zipcodeFld.hasError == false && employerFld.hasError == false && occupationFld.hasError == false && aboutFld.hasError == false && moveFld.hasError == false && leaseTermFld.hasError == false && whyMoveFld.hasError == false && numberOfOccupantsFld.hasError == false && numberOfBedrromsFld.hasError == false && numberOfBathsFld.hasError == false && priceRangeFld.hasError == false && areasInterestedFld.hasError == false && communitiesTouredFld.hasError == false && specialFeaturesFld.hasError == false && signatureFld.hasError == false && dateFld.hasError == false && numberOfDogsFld.hasError == false && dogWeightFld.hasError == false && dogBreedFld.hasError == false && numberOfCatsFld.hasError == false && catWeightFld.hasError == false && catOtherFld.hasError == false
        {
            let isEmailAddressValid = isValidEmailAddress(emailAddressString: email)
            
            if isEmailAddressValid
            {
                emailFld.hasError = false
                getGuestCard()
            }
                
            else
            {
                emailFld.hasError = true
                emailFld.errorMessage = "Please enter a valid email Id"
            }
            
        }
        
 
    }
    
    func checkErrors(labelname:String,fieldname:MyTextField)
    {
        if labelname.count < 1
        {
            fieldname.hasError = true
            fieldname.errorMessage = "Please enter a value"
        }
        else
        {
            fieldname.hasError = false
        }
    }
    
    func getGuestCard()
    {
        self.showLoading()
        
        if(Reachability.isConnectedToNetwork())
        {
            let firstname = firstNameFld.text ?? ""
            let lastname = lastNameFld.text ?? ""
            let phonenumber = phoneNumberFld.text ?? ""
            let email = emailFld.text ?? ""
            let currentaddress = currentAddressFld.text ?? ""
            let city = cityFld.text ?? ""
            let state = stateFld.text ?? ""
            let zipcode = zipcodeFld.text ?? ""
            let employer = employerFld.text ?? ""
            let occupation = occupationFld.text ?? ""
            let about = aboutFld.text ?? ""
            let move = moveFld.text ?? ""
//            let lease = leaseTermFld.text ?? ""
            let whymove = whyMoveFld.text ?? ""
            let numberofoccupants  = numberOfOccupantsFld.text ?? ""
            let numberofbedrooms = numberOfBedrromsFld.text ?? ""
            let numberofbaths = numberOfBathsFld.text ?? ""
            let pricerange = priceRangeFld.text  ?? ""
            let areasinterested = areasInterestedFld.text ?? ""
            let communities = communitiesTouredFld.text ?? ""
            let specialfeatures = specialFeaturesFld.text ?? ""
            let numberofdogs = numberOfDogsFld.text ?? ""
            let dogweight = dogWeightFld.text ?? ""
            let dogbreed = dogBreedFld.text ?? ""
            let numberofcats = numberOfCatsFld.text ?? ""
            let catweight = catWeightFld.text ?? ""
            let catother = catOtherFld.text ?? ""
            let signature = signatureFld.text  ?? ""
            let date = dateFld.text ?? ""
            
            let occupantsint = Int(numberofoccupants)
            let bedroomsint = Int(numberofbedrooms)
            let bathroomsint = Int(numberofbaths)
            
            var petsexist:Bool = false
            var petlist:[NSDictionary] = []
            if petSwitch.isOn
            {
                petsexist = true
                let doglist = ["pet_type":"dog","description":dogbreed,"count":numberofdogs,"weight":dogweight] as NSDictionary
                let catlist = ["pet_type":"cat","description":catother,"count":numberofcats,"weight":catweight] as NSDictionary
                petlist.append(doglist)
                petlist.append(catlist)
            }
            
            let allAccDetailDict:Dictionary = ["firstName":firstname as Any,"lastName":lastname as Any,"phone":phonenumber as Any,"email":email as Any,"current_address":currentaddress as Any,"city":city as Any,"state":state as Any,"zip":zipcode as Any,"employer":employer as Any,"occupation":occupation as Any,"find_us":about as Any,"move_location":move as Any,"movein_date":date as Any,"budget":pricerange as Any,"desired_area":areasinterested as Any,"move_reason":whymove as Any,"main_amenities":specialfeatures as Any,"communities_toured":communities as Any,"credit":"" as Any,"signature":signature as Any,"date":date as Any,"comments":"" as Any,"invoke_dialer":false as Any,"created_via":"locator" as Any,"marketing_campaign_enabled":false as Any,"occupants":occupantsint as Any,"bedrooms":bedroomsint as Any,"bathrooms":bathroomsint as Any,"pets":petsexist as Any,"pet_list":petlist as Any] as [String : Any]
            
            
            NBSServiceManager.sharedInstance.guestcardapi(parameterDict: allAccDetailDict as NSDictionary, block:
                { (response, error,statuscode) in
                    let response_ = response
                    self.hideLoading()
                    
                    if(statuscode == 200)
                    {
                        if let result = response_?.object(forKey: "result") as? Int
                        {
                            if result == 1
                            {
                                if let lead_creation_msg = response_?.object(forKey: "lead_creation_msg") as? String
                                {
                                    self.showAlert(title: "", message: lead_creation_msg)
                                }
                            }
                            
                        }
                    }
                    else
                    {
                        if let error = response_?.object(forKey: "error") as? NSDictionary
                        {
                            if let message = error.object(forKey: "message") as? String
                            {
                                self.showAlert(title: "", message: message)
                            }
                            
                        }
//                        let response_ = response
//                        if((response_) != nil)
//                        {
//
//
//                            if let message = response_?.object(forKey: "message") as? String
//                            {
//                                self.showAlert(title: "", message: message)
//
//                            }
//                        }
                        
                    }
                    
                    
                    
                    
            })
        }
        else
        {
            self.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to the internet.")
            self.hideLoading()
        }
        
    }
    
    
    func showLoading(){
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoading(){
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    
    
    
    func showAlert(title:String,message:String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
}

