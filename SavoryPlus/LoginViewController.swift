//
//  LoginViewController.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/5/2.
//  Copyright © 2016年 savoryplus.SavoryPlus. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textfieldEmail: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // If logged in, it will show Note ViewController first.
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil{
            self.performSegueWithIdentifier(SEGUE_FACEBOOK_LOG_IN, sender: nil)
        }
    }
    
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func buttonFacebookLogin(sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) in
            
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            } else if facebookResult.isCancelled {
                print("Facebook login was cancelled.")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Successfully logged in with Facebook. \(accessToken)")
                
                DataService.dataService.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { (error, authData) in
                    
                    if error != nil {
                        print("login failed. Error \(error)")
                    } else {
                        print("Successfully logged in. \(authData)")
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                        self.performSegueWithIdentifier(SEGUE_FACEBOOK_LOG_IN, sender: nil)
                    }
                })
            }
        }
    }
    
    @IBAction func buttonEmailLogin(sender: AnyObject) {
        
        if let email = self.textfieldEmail.text where email != "", let password = self.textfieldPassword.text where password != "" {
                DataService.dataService.REF_BASE.authUser(email, password: password, withCompletionBlock: { error, authData in
                    if error != nil {
                        if error.code == STATUS_ACCOUNT_NONEXIST {
                            DataService.dataService.REF_BASE.createUser(email, password: password, withValueCompletionBlock: { error, result in
                                if error != nil {
                                    self.showErrorAlert("無法建立登入帳號", message: "建立帳號時產生錯誤。請試試看其他的E-mail。")
                                } else {
                                    NSUserDefaults.standardUserDefaults().setValue(result[KEY_UID], forKey: KEY_UID)
                                    DataService.dataService.REF_BASE.authUser(email, password: password, withCompletionBlock: nil)
                                    self.performSegueWithIdentifier(SEGUE_EMAIL_LOG_IN, sender: nil)
                                }
                            })
                        } else {
                            self.showErrorAlert("無法登入", message: "請確認是否輸入正確的E-mail或密碼。")
                        }
                    } else {
                        self.performSegueWithIdentifier(SEGUE_EMAIL_LOG_IN, sender: nil)
                    }
                })
        } else {
            showErrorAlert("登入認證錯誤", message: "請輸入正確的E-mail和密碼。")
        }
        
    }
    
}
