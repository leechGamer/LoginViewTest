//
//  ViewController.swift
//  LoginTest
//
//  Created by 배경은 on 2017. 8. 24..
//  Copyright © 2017년 배경은. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage


class ViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    var userStorage : StorageReference!
    var ref : DatabaseReference!
    
    
    @IBAction func createAccountAction(_ sender: Any) {
        guard  emailTextField.text != "", passwordTextField.text != "", confirmPassword.text != "" else {return}
        
        if passwordTextField.text == confirmPassword.text {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                  
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                }
                
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        else {
        
              let alertController = UIAlertController(title: "Error", message: "Password doesn not match Confirm password!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Signin")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

