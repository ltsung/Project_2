//
//  AccountViewController.swift
//  Project_2
//
//  Created by Lauren Tsung on 9/13/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\ltsung. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    
    @IBOutlet weak var termsAgreement: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTermsAgreement(sender: AnyObject) {
        termsAgreement.selected = !termsAgreement.selected
    }
    
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func popCreateDropbox(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
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
