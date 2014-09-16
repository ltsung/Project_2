//
//  SigninViewController.swift
//  Project_2
//
//  Created by Lauren Tsung on 9/13/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\ltsung. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var containerView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
      view.endEditing(true)
    }
    
    
    @IBAction func onSignIn(sender: AnyObject) {
        var emailBlankAlert = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
       
        var pwBlankAlert = UIAlertView(title: "Password Required", message: "Please enter your password", delegate: self, cancelButtonTitle: "OK")

        var loadingAlert = UIAlertView(title: "", message: "Signing in...", delegate: self, cancelButtonTitle: nil)

        var incorrectEmailPWAlert = UIAlertView(title: "Sign in failed.", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
        

       
        
        if (self.email.text == "") {
            emailBlankAlert.show()
        }
        
        if (self.password.text == "") {
            pwBlankAlert.show()
        }
        
        if (self.email.text != "" && self.password.text != "") {
            
            loadingAlert.show()
            delay(2) {
                loadingAlert.dismissWithClickedButtonIndex(0, animated: true)
            }
            
            
            if (self.email.text != "tim@thecodepath.com" && self.password.text != "password") {
                loadingAlert.show()

                delay(2) {
                   loadingAlert.dismissWithClickedButtonIndex(0, animated: true)
                   incorrectEmailPWAlert.show()
                }
                
            }
            else {
                self.performSegueWithIdentifier("tutorialSegue", sender: self)
            }

        }

    }

    
    
    func keyboardWillShow(notification: NSNotification!) {
        println("keyboard will show")
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {

            println(self.containerView.frame.origin.y)
            
            if (self.containerView.frame.origin.y != 155) {
              self.containerView.frame.origin.y = self.containerView.frame.origin.y - 160
            }
        }, completion: nil)

    }
    
    func keyboardWillHide(notification: NSNotification!) {
        println("keyboard will hide")
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
        
            if (self.view.frame.origin.y >= 0) {
                self.containerView.frame.origin.y = self.containerView.frame.origin.y + 160
            }
    
            
        }, completion: nil)
    }

    
    
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        // buttonIndex is 0 for Cancel
        // buttonIndex ranges from 1-n for the other buttons.
    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
