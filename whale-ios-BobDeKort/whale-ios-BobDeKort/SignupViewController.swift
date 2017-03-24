//
//  SignupViewController.swift
//  whale-ios-BobDeKort
//
//  Created by Bob De Kort on 3/22/17.
//  Copyright © 2017 Bob De Kort. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func signUpPressed(_ sender: Any) {
        guard let username = usernameTextField.text else {
            // present alert
            print("Username empty")
            presentAlert(message: "Please fill in a username")
            return
        }
        
        guard let firstName = firstNameTextField.text else {
            // present alert
            print("firstName empty")
            presentAlert(message: "Please fill in your first name")
            return
        }
        
        guard let lastName = lastNameTextField.text else {
            // present alert
            print("lastName empty")
            presentAlert(message: "Please fill in your last name")
            return
        }
        
        guard let password = passwordTextField.text else {
            // present alert
            print("password empty")
            presentAlert(message: "Please fill in a password")
            return
        }
        
        guard let email = emailTextField.text else {
            // present alert
            print("email empty")
            presentAlert(message: "Please fill in your email address")
            return
        }
        
        APIClient.sharedInstance.signUp(email: email, firstName: firstName, lastName: lastName, password: password, userName: username) { (isSucces) in
            if isSucces {
                self.signUpSucces()
            } else {
                self.presentAlert(message: "Something went wrong please try again later")
            }
            print("success")
        }
        
    }
    
    func presentAlert(message: String) {
        let alert = UIAlertController(title: "Ooops!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func signUpSucces(){
        let tabbarController = UITabBarController()
        
        let layout = UICollectionViewFlowLayout()
        let homeController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        
        homeController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "homeSelected"))
        
        tabbarController.viewControllers = [homeController]
        
        self.navigationController?.pushViewController(tabbarController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
