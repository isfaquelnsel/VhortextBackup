//
//  OTPVerificationVC.swift
//  Vhortext
//
//  Created by LNSEL on 11/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit
import Toast_Swift


class OTPVerificationVC: UIViewController {

    
    //MARK:- --------------------------OTPVerificationVC outlers---------------------------
    @IBOutlet weak var lblAuthentication: UILabel!
    @IBOutlet weak var topViewOtp: UIView!
    @IBOutlet weak var btmViewOtp: UIView!
    
    @IBOutlet weak var otpField1: UITextField!
    @IBOutlet weak var otpField2: UITextField!
    @IBOutlet weak var otpField3: UITextField!
    @IBOutlet weak var otpField4: UITextField!
    @IBOutlet weak var otpField5: UITextField!
    @IBOutlet weak var otpField6: UITextField!
    
    @IBOutlet weak var lblReEnterPN: UILabel!
    @IBOutlet weak var lblActivationCode: UILabel!
    @IBOutlet weak var lblResendOtp: UILabel!
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    
    var usrCountryCode = String()
    var usrUserName = String()
    var usrMobileNo = String()
    var style = ToastStyle()
    
    //call service with presenter
    let otpVerificationPresenter = OTPVerificationPresenter(otpVerificationService: OTPVerificationService())
    
    
    
    //MARK:- ----------------------To change the status bar tint color------------------------
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
    
    //MARK:- ----------------------------------Life Cycle-------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    

        print("usrMobileNo-------> \(usrMobileNo)")
        lblActivationCode.text = "We have sent a sms with activation code to your \n phone" + " " + "+" + usrCountryCode+" "+usrMobileNo
        
        
        self.topViewOtp.layer.borderWidth = 2
        self.topViewOtp.layer.borderColor = UIColor(red:198/255, green:191/255, blue:191/255, alpha: 1).cgColor
        
        self.btmViewOtp.layer.borderWidth = 2
        self.btmViewOtp.layer.borderColor = UIColor(red:198/255, green:191/255, blue:191/255, alpha: 1).cgColor
        
        
        
        otpField1.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        otpField2.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        otpField3.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        otpField4.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        otpField5.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        otpField6.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        
        lblReEnterPN.isUserInteractionEnabled = true // Remember to do this
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(goToRegistration))
        lblReEnterPN.addGestureRecognizer(tap)
        
        lblResendOtp.isUserInteractionEnabled = true
        let tapResend: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(resendOTP))
        lblResendOtp.addGestureRecognizer(tapResend)
        
        otpField1.delegate = self
        otpField2.delegate = self
        otpField3.delegate = self
        otpField4.delegate = self
        otpField5.delegate = self
        otpField6.delegate = self
        
        otpField1.setBottomBorder()
        otpField2.setBottomBorder()
        otpField3.setBottomBorder()
        otpField4.setBottomBorder()
        otpField5.setBottomBorder()
        otpField6.setBottomBorder()
        
        lblTextColor()
        lblUnderline()
        dismissKeyBoard()
        
        otpField1.text = "1"
        otpField2.text = "2"
        otpField3.text = "3"
        otpField4.text = "4"
        otpField5.text = "5"
        otpField6.text = "6"

    }

    @objc func goToRegistration() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @objc func resendOTP(){
    
        otpVerificationPresenter.attachView(view: self)
        
        var otpUrl = String()
        otpUrl = UrlConstants.apiResendOTP
        
        otpVerificationPresenter.getResendOTP(url: otpUrl, usrCountryCode: usrCountryCode, usrMobileNo: usrMobileNo, usrAppType: "iOS", usrAppVersion: "1.0")

        
    }
    
    //MARK:- -----------------------To change the label Authentcation text color--------------------
    func lblTextColor(){
        
        self.lblAuthentication.textColor = UIColor(red: 242/255, green: 188/255, blue: 130/255, alpha: 1)
        self.lblReEnterPN.textColor = UIColor(red: 76/255, green: 193/255, blue: 184/255, alpha: 1)
        self.lblResendOtp.textColor = UIColor(red: 76/255, green: 193/255, blue: 184/255, alpha: 1)
        
    }
    
    //MARK:- -----------------------To change the underline color of labels--------------------
    func lblUnderline() {
        
        let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Re-enter phone number", attributes: underlineAttribute)
        lblReEnterPN.attributedText = underlineAttributedString
        
        let underlineAttribute1 = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedString1 = NSAttributedString(string: "Resend verification code", attributes: underlineAttribute1)
        lblResendOtp.attributedText = underlineAttributedString1
        
    }
    
    /* MARK:- -------------------done button on keyBoard andits action (start)-----------------------*/
    func dismissKeyBoard(){
        
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        //setting toolbar as inputAccessoryView
        
        self.otpField6.inputAccessoryView = toolbar
        
    }
    
    @objc func doneButtonAction() {
        
        if otpField1.text!.isEmpty || otpField2.text!.isEmpty || otpField3.text!.isEmpty || otpField4.text!.isEmpty || otpField5.text!.isEmpty || otpField6.text!.isEmpty {
            
//            self.style.messageColor = .green
//            self.view.makeToast("Please Enter Valid OTP", duration: 2.0, position: .center, style: self.style)
            
        } else {
            
            

            
            var otpUrl = String()
            otpUrl = UrlConstants.apiOTPVerification
            
            otpVerificationPresenter.attachView(view: self)
            
            Log.i("getOTPVerfication() called")
            otpVerificationPresenter.getOTPVerification(url: otpUrl, usrCountryCode: usrCountryCode, usrMobileNo: usrMobileNo, usrUserName: usrUserName, usrDeviceId: Constants.Values.usrDeviceId , usrTokenId: "tftyff", usrOTP: self.otpField1.text!+otpField2.text!+otpField3.text!+otpField4.text!+otpField5.text!+otpField6.text!, usrAppType: "iOS", usrAppVersion: "1.0")
            
        }
        
    }
    //MARK:- -------------------done button on keyBoard and its action (start)-----------------------
    
    //MARK:- --------------------------------back button action---------------------------
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
   
}

//MARK:- ---------------------extension for UItextfield for each textfield bottom boarder-------------
extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}


//MARK: - -----------------TextField Delegate Extension and its functions (start)--------------------
extension OTPVerificationVC : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == otpField2 {
            if otpField1.text?.isEmpty == true {
                
                otpField2.text = ""
                otpField1.becomeFirstResponder()
                
            }
        } else if textField == otpField3 {
            if otpField1.text?.isEmpty == true {
                otpField1.becomeFirstResponder()
                otpField3.text = ""
            }
        } else if textField == otpField4 {
            
            if otpField1.text?.isEmpty == true {
                otpField1.becomeFirstResponder()
                otpField4.text = ""
            }
            
        } else if textField == otpField5 {
            
            if otpField1.text?.isEmpty == true {
                otpField1.becomeFirstResponder()
                otpField5.text = ""
                
            }
            
        } else if textField == otpField6 {
            
            if otpField1.text?.isEmpty == true {
                otpField1.becomeFirstResponder()
                otpField6.text = ""
                
            }
        }
        
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        let text : NSString = (textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString
        
        
        return text.length <= 1
        
    }
    
    
    @objc func textFieldDidChange(textField: UITextField){
        
        let text = textField.text
        
        if text?.utf16.count==1{
            switch textField{
            case otpField1:
                otpField2.becomeFirstResponder()
            case otpField2:
                otpField3.becomeFirstResponder()
            case otpField3:
                otpField4.becomeFirstResponder()
            case otpField4:
                otpField5.becomeFirstResponder()
            case otpField5:
                otpField6.becomeFirstResponder()
            case otpField6:
                otpField6.becomeFirstResponder()
            default:
                break
                
            }
            
        } else {
            switch textField{
            case otpField1:
                otpField1.becomeFirstResponder()
            case otpField2:
                otpField1.becomeFirstResponder()
            case otpField3:
                otpField2.becomeFirstResponder()
            case otpField4:
                otpField3.becomeFirstResponder()
            case otpField5:
                otpField4.becomeFirstResponder()
            case otpField6:
                otpField5.becomeFirstResponder()
            default:
                break
            }
            
        }
        
        
    }
}
//MARK: - -----------------TextField Delegate Extension and its functions (start)--------------------


extension OTPVerificationVC: OTPVerificationView{
    
    func startLoading(){
        activityLoader.startAnimating()
        
    }
    
    func otpVerificationSuccess(profileData: ProfileData){
        activityLoader.stopAnimating()
        
        UserDefaults.standard.createLoginSession(
            isLogin: true,
            usrId: profileData.usrId,
            usrCountryCode: profileData.usrCountryCode,
            usrMobileNo: profileData.usrMobileNo,
            usrUserName: profileData.usrUserName,
            usrTokenId: profileData.usrTokenId,
            usrDeviceId: profileData.usrDeviceId,
            usrProfileImage: profileData.usrProfileImage,
            usrProfileStatus: profileData.usrProfileStatus,
            usrLanguageId: profileData.usrLanguageId,
            usrLanguageName: profileData.usrLanguageName,
            usrLanguageSName: profileData.usrLanguageSName,
            usrGender: profileData.usrGender,
            usrLocationPermission: profileData.usrLocationPermission,
            usrTranslationPermission: profileData.usrTranslationPermission,
            usrPrivateNumberPermission: profileData.usrPrivateNumberPermission,
            usrOnlinePermission: profileData.usrOnlinePermission,
            usrNotificationPermission: profileData.usrNotificationPermission,
            usrFcmTokenId: profileData.usrFcmTokenId,
            usrAppVersion: profileData.usrAppVersion,
            usrAppType: profileData.usrAppType)
        
        let vc = UIStoryboard.init(name: "ContactSync", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContactSyncVC") as? ContactSyncVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func otpVerificationFailed(message: String){
        activityLoader.stopAnimating()
        self.style.messageColor = .white
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
    func resendOTPSuccess(status: String, message: String){
        activityLoader.stopAnimating()
        self.style.messageColor = .green
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
    
    func resendOTPFailed(message: String){
        activityLoader.stopAnimating()
        self.style.messageColor = .green
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
    
    
}

