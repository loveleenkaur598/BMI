//
//  ViewController.swift
//  BMI
//
//  Created by MacUser on 2019-12-11.
//  Copyright © 2019 MacUser. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    
    let userdefaults = UserDefaults.standard
    
    var uid: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
  
    
    @IBAction func registerUser(_ sender: Any) {
        
        if(userEmail.text != nil && userPassword.text != nil){
            print(userEmail.text!)
            Auth.auth().createUser(withEmail: userEmail.text!, password: userPassword.text!) { (result, error) in


                if error != nil{
                    print(error!._code)

                    //self.showToast(message : "Check Email/Password")

                }else if(self.userEmail.text != "" && self.userPassword.text != ""){
                    self.uid = (result?.user.uid)!
                    let ref = Database.database().reference(withPath: "users").child(self.uid)
                    ref.setValue(["email" : self.userEmail.text! , "password" : self.userPassword.text!])
                    self.performSegue(withIdentifier: "loginSegue", sender: self)
                    self.showToast(message : "Successfully registered!")
                }
            }
        }
        
    }
    @IBAction func signInUser(_ sender: Any) {
        if(userEmail.text != nil && userPassword.text != nil){
            Auth.auth().signIn(withEmail: userEmail.text!, password: userPassword.text!) { (result, error) in
             
                if error != nil{
                    //print(error!)
                    
                        self.showToast(message : "Check Email/Password")
                    
                }else if(self.userEmail.text != "" && self.userPassword.text != ""){
                    self.uid = (result?.user.uid)!
                    self.userdefaults.set(self.uid, forKey: "uid")
                    self.performSegue(withIdentifier: "loginSegue", sender: self)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigation = segue.destination as! UINavigationController
        let homeVc = navigation.topViewController as! HomeController
        homeVc.userId = uid
    }
    
    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }


}

