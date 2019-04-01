//
//  MainViewController.swift
//  UnitTesting
//
//  Created by webwerks on 27/03/19.
//  Copyright © 2019 webwerks. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var lblStatus: UILabel!
    
    let expectedUsername: String = "abc"
    let expectedPassword: String = "abc"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStatus.text = ""
        txtUsername.text = ""
        txtPassword.text = ""
        activityIndicator.hidesWhenStopped = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
 
        let tempInt = square(value: 2)
        print("square --> \(tempInt)")
    }
    
    func square(value: Int) -> Int {
        return value * value
    }
    
    @IBAction func btnLoginTapped(_ sender: Any) {
       print("login btn tapped")
        
        activityIndicator.startAnimating()
        lblStatus.text = "Logged In"
        
        guard let username = self.txtUsername.text, !username.isEmpty, let password = self.txtPassword.text, !password.isEmpty else {
            presentAlert(title: "Missing credentials", message: "Please enter valid credentials")
            self.lblStatus.text = "Logged failed"
            return
        }
        
        guard expectedUsername == username else {
            presentAlert(title: "Invalid credential", message: "Please enter valid username")
            self.lblStatus.text = "Logged failed"
            return
        }
        
        guard expectedPassword == password else {
            presentAlert(title: "Invalid credential", message: "Please enter valid password")
            self.lblStatus.text = "Logged failed"
            return
        }
        
        UserDefaults.standard.set(true, forKey: "LoggedIn")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.lblStatus.text = "Logged In"
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
            self.presentAlert(title: "Logged In", message: "User logged in successfully")
        }
    }
    
    private func presentAlert(title:String, message:String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertVC.addAction(.init(title: "Okay", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
