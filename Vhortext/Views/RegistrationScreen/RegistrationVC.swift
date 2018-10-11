//
//  ViewController.swift
//  Vhortext
//
//  Created by LNSEL on 11/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit
import CountryList
import Alamofire
import Toast_Swift

class RegistrationVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    
    //MARK:- ---------------------UIComponents Outlets for RegistrationVC------------------------
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var viewUserName: UIView!
    @IBOutlet weak var viewMobileNumber: UIView!
    @IBOutlet weak var btnAgree: UIButton!
    @IBOutlet weak var txtFieldUserName: UITextField!
    @IBOutlet weak var txtFieldMobileNum: UITextField!
    @IBOutlet weak var viewBoarder: UIView!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var txtFldCountryCode: UITextField!
    @IBOutlet weak var txtViewTermsPrivacy: UITextView!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    //MARK:- ---------------------Declaration of variables----------------------------------------
    var countryList = CountryList()
    /*
    var countryName = String()
    var currentCode = String()
    var selectedCode = String()
    var code = String()*/
    var style = ToastStyle()
    
    var usrCountryCode = String()
    var usrCountryName = String()
    var usrCountryShortName = String()
    var usrMobileNo = String()
    var usrDeviceId = String()
    var usrAppVersion = String()
    var usrAppType = String()
    
    
    //MARK:- ------------------------To change the status bar tint color--------------------------
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
    
    
    
    
    
    //MARK:- --------------------------Life Cycle (start)------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        txtFieldUserName.text = "test"
        txtFieldMobileNum.text = "9876543211"
        
        txtFieldUserName.autocorrectionType = .no
        txtFieldMobileNum.autocorrectionType = .no
        txtFieldUserName.keyboardType = UIKeyboardType.asciiCapable
        countryList.delegate = self
        
        activityLoader.color = UIColor.black
        activityLoader.hidesWhenStopped = true
        
        topView.isHidden = true
        lblError.isHidden = true
        txtFieldUserName.delegate = self
        txtFieldMobileNum.delegate = self
        
        CountryInfo()
        createViews()
        
        //To get the device id --------------------------------------
        usrDeviceId = UIDevice.current.identifierForVendor!.uuidString
        usrAppType = "ios"
        usrAppVersion =  Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String

     
        Constants.Values.usrDeviceId = usrDeviceId
        
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
     //MARK:- --------------------------Life Cycle (end)------------------------------------------
    
     //MARK:- ------------------Hide the keyboard when touch on view------------------------------
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
 
    //MARK:- --------To get the current country code and country name (start)---------------------
    func CountryInfo() {
        
        // MARK:- To get current Contry code
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            
            usrCountryShortName = countryCode
            
            usrCountryCode = Constants.Values.countryDictionary[countryCode]!
            print("current country code ----> \("+"+usrCountryCode)")
            
            let currentCountryFlag = flag(country:countryCode)
            print("currentCountryFlag---->\(currentCountryFlag)")
            
            txtFldCountryCode.text = currentCountryFlag+" +"+usrCountryCode+" ▿"
            
        }
        
        //MARK: - To get current Contry name
        let localIdentifier = Locale.current.identifier
        let locale = NSLocale(localeIdentifier: localIdentifier)
        
        if let countryCodeForName = locale.object(forKey: .countryCode) as? String {
            
            if let country:String = locale.displayName(forKey: .countryCode, value: countryCodeForName) {
                print("countryName ----> \(country)")
                usrCountryName = country
            }
        }
    }
    //MARK:- --------To get the current country code and country name (end)---------------------
    
    //MARK: - ---------terms of use and privacy policy text and its color (start)-----------------
    func createViews() {
        
        //To hide navigation bar.
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        btnAgree.backgroundColor = UIColor(red: 48/255, green: 47/255, blue: 46/255, alpha: 1)
        
        txtFldCountryCode.addTarget(self, action: #selector(countryCodesList), for: .touchDown)
        viewBoarderColor()
        textFieldPlaceholder()
        dismissKeyBoard()
      
        txtViewTermsPrivacy.linkTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.green]
        let attributedString = NSMutableAttributedString(string: "Terms of Use & Privacy Policy")
        
        attributedString.addAttribute(NSAttributedStringKey.link, value: UIColor.red, range: NSRange(location:1,length:4))
        let termsOfUseRange = (attributedString.string as NSString).range(of: "Terms of Use")
        let linkPrivacy = (attributedString.string as NSString).range(of: "Privacy Policy")
        let separator = (attributedString.string as NSString).range(of: "&")
        
        attributedString.addAttribute(NSAttributedStringKey.link, value: "TermsOfUse", range: termsOfUseRange)
        
        attributedString.addAttribute(NSAttributedStringKey.link, value: "PrivacyPolicy", range: linkPrivacy)
        
        attributedString.addAttribute(NSAttributedStringKey.link, value: "&", range: separator)
        let linkAttributes1: [String : Any] = [
            NSAttributedStringKey.foregroundColor.rawValue: UIColor.red]
        
        txtViewTermsPrivacy.linkTextAttributes = linkAttributes1
        txtViewTermsPrivacy.attributedText = attributedString
        
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location:1,length:3))
        
        let linkAttributes: [String : Any] = [
            NSAttributedStringKey.underlineColor.rawValue: UIColor(red: 112/255, green: 191/255, blue: 185/255, alpha: 1),
            NSAttributedStringKey.underlineStyle.rawValue: NSUnderlineStyle.styleSingle.rawValue]
        
        txtViewTermsPrivacy.linkTextAttributes = linkAttributes
        txtViewTermsPrivacy.attributedText = attributedString
        txtViewTermsPrivacy.textColor = UIColor(red: 112/255, green: 191/255, blue: 185/255, alpha: 1)
        
        txtViewTermsPrivacy.textAlignment = .center
        txtViewTermsPrivacy.delegate = self
        
        
    }
    
    @objc func countryCodesList() {
        
        let navController = UINavigationController(rootViewController: countryList)
        self.present(navController, animated: true, completion: nil)
        
    }
    //MARK: - ---------terms of use and privacy policy text and its color (end)-----------------
    
    
    //MARK:- ------------terms of use and privacy policy action (start)----------------------------
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        
        if URL.absoluteString == "TermsOfUse" {
            print("success terms of use")
            
            
            
//            let obj: TermsOfUseVC = self.storyboard?.instantiateViewController(withIdentifier: "TermsOfUseVC") as! TermsOfUseVC
//
//            obj.termsAndPrivacy = "Terms Of Use"
//
//
//            self.navigationController?.pushViewController(obj, animated: true)
            
            
            
            
            return true
        } else if URL.absoluteString == "PrivacyPolicy" {
            
            print("success privacy policy")
            
//            let obj: TermsOfUseVC = self.storyboard?.instantiateViewController(withIdentifier: "TermsOfUseVC") as! TermsOfUseVC
//
//            obj.termsAndPrivacy = "Privacy Policy"
//
//
//            self.navigationController?.pushViewController(obj, animated: true)
            
            
            return true
        }
        
        return false
    }
    //MARK:- ------------terms of use and privacy policy action (end)----------------------------
    
    
    //MARK: - ------------------------UIViews boarder colors (start)---------------------
    func viewBoarderColor(){
        
        // 237,187,127
        self.viewUserName.layer.borderWidth = 2
        self.viewUserName.layer.borderColor = UIColor(red:242/255, green:188/255, blue:130/255, alpha: 1).cgColor
        
        self.viewMobileNumber.layer.borderWidth = 2
        self.viewMobileNumber.layer.borderColor = UIColor(red:242/255, green:188/255, blue:130/255, alpha: 1).cgColor
        
        
        self.viewBoarder.layer.borderWidth = 4
        self.viewBoarder.layer.borderColor = UIColor.gray.cgColor
    }
    //MARK: - ------------------------UIViews boarder colors (end)---------------------
    
    
    //MARK: - ------------------------textField placeholder (start)--------------------
    func textFieldPlaceholder() {
        
        txtFieldUserName.placeholder = "Enter your name"
        txtFieldUserName.attributedPlaceholder = NSAttributedString(string: "Enter your name",attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        
        txtFieldMobileNum.placeholder = "Enter mobile number"
        txtFieldMobileNum.attributedPlaceholder = NSAttributedString(string: "Enter mobile number",attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
    }
    
    //MARK: - ------------------------textField placeholder (end)---------------------
    
    //MARK: - -----------------add button to keyboard and its action (start)---------------------
    func dismissKeyBoard(){
        
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        //setting toolbar as inputAccessoryView
        self.txtFieldMobileNum.inputAccessoryView = toolbar
        
    }
    
    @objc func doneButtonAction() {
        
        self.view.endEditing(true)
        
    }
    //MARK: - -----------------add button to keyboard and its action (end)---------------------
    
    
    //MARK: - -----------------Registration button action for signup---------------------
    @IBAction func btnRegistration(_ sender: Any) {
        
        self.view.endEditing(true)
        
        if txtFieldUserName.text!.isEmpty || txtFieldMobileNum.text!.isEmpty {
            
            
            
            self.style.messageColor = .white
            self.view.makeToast("Please enter details", duration: 2.0, position: .center, style: self.style)
            
            
            
        } else {
            
            if txtFieldMobileNum.text!.characters.count >= 5 {
                
                let countryCode = txtFldCountryCode.text!.dropFirst()
                
                let alert = UIAlertController(title: "Message", message: "Do you want to register with" + " " + "+" + usrCountryCode + " " + txtFieldMobileNum.text!, preferredStyle: UIAlertControllerStyle.alert)
                
                
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
                
                alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
                    
                    
                    
                    //--------------------------call the service from Presenter--------------------
                    let regPresenter = RegistrationPresenter(registrationService: RegistrationService())
                    regPresenter.attachView(view: self)
                    
                    var url = String()
                    url = UrlConstants.apiRegistration
                    Log.i("getRegistration() called")
                    regPresenter.getRegistration(
                        url: url,
                        usrUserName: self.txtFieldUserName.text!,
                        usrMobileNo: self.txtFieldMobileNum.text!,
                        usrDeviceId: self.usrDeviceId,
                        usrTokenId: "tftyff",
                        usrCountryCode: "+" + self.usrCountryCode,
                        usrAppType: self.usrAppType,
                        usrAppVersion: self.usrAppVersion,
                        usrCountryName: self.usrCountryName,
                        usrCountryShortName: self.usrCountryShortName
                    )
                    

                    
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    //MARK: - ------------------To move View up while entering text (start)----------------------
    func animate(_ textField: UITextField, up: Bool) {
        
        let movementDistance: Int = 80
        let movementDuration: Float = 0.5

        // It will animate the middle view based on the Int value.
        let movement: Int = (up ? -movementDistance : movementDistance)
        UIView.beginAnimations("anim", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(TimeInterval(movementDuration))
        view.frame = view.frame.offsetBy(dx: CGFloat(0), dy: CGFloat(movement))
        UIView.commitAnimations()
        
        
    }
    //MARK: - ------------------To move View up while entering text (end)----------------------
    
    //MARK: - -----------------validation for TextField maximum characters(start)--------------
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text : NSString = (textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString
        
        lblError.isHidden = true
        
        return text.length <= 17
        
    }
    //MARK: - -----------------validation for TextField maximum characters(end)--------------
    
    
    //MARK: - -----------------validation for TextField return and begin editing (start)--------------
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtFieldUserName {
            txtFieldMobileNum.becomeFirstResponder()
        } else {
            txtFieldMobileNum.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        animate(txtFieldUserName, up: true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animate(txtFieldUserName, up: false)
        
    }
    //MARK: - -----------------validation for TextField return and begin editing (end)--------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}



//MARK: - ----------country list delegate provide info of selected country (start)---------------
extension RegistrationVC: CountryListDelegate {
    
    func selectedCountry(country: Country) {
        
        print("contryName --- > \(country.name)")
        print("contryFlag ----> \(country.flag)")
        print("countryCode ----> \(country.countryCode)")
        print("phoneExtension ----> \(country.phoneExtension)")
        
        usrCountryName = country.name!
        usrCountryShortName = country.countryCode
        usrCountryCode = country.phoneExtension
        
        self.txtFldCountryCode.text = (country.flag ?? "")+" +"+country.phoneExtension+" ▿"
    }
    
    
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
}
//MARK:- ----------country list delegate provide info of selected country (end)---------------



extension RegistrationVC: RegistrationView{
    
    func startLoading() {
        
        activityLoader.startAnimating()
    }
    
  
    
    func registrationSuccess(registrationReturnData: RegistrationReturnData) {
        activityLoader.stopAnimating()
       
        
        let vc = UIStoryboard.init(name: "OTPVerification", bundle: Bundle.main).instantiateViewController(withIdentifier: "OTPVerificationVC") as? OTPVerificationVC
        
                vc?.usrMobileNo = registrationReturnData.usrMobileNo
                vc?.usrCountryCode = registrationReturnData.usrCountryCode
                vc?.usrUserName = registrationReturnData.usrUserName
       
        self.navigationController?.pushViewController(vc!, animated: true)
        
   
    }
    
    func registrationFailed(message: String) {
        activityLoader.stopAnimating()
        
        self.style.messageColor = .white
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
}
