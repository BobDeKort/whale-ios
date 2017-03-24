//
//  LoginViewController.swift
//  whale-ios-BobDeKort
//
//  Created by Bob De Kort on 3/20/17.
//  Copyright © 2017 Bob De Kort. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func loginPressed(_ sender: Any) {
        if let email = usernameTextField.text {
            guard email != "" else {
                // present alert
                print("email empty")
                presentAlert(message: "Please fill in your email")
                return
            }
            if let password = passwordTextField.text {
                guard password != "" else {
                    // present alert
                    print("password empty")
                    presentAlert(message: "Please fill in you password")
                    return
                }
                APIClient.sharedInstance.login(email: email, password: password) { (isSucces) in
                    if isSucces {
                        self.loginSucces()
                    } else {
                        self.presentAlert(message: "Something went wrong please try again later")
                    }
                }
            } else {
                presentAlert(message: "Please fill in you password")
            }
        } else {
            presentAlert(message: "Please fill in your email")
        }
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        let vc = SignupViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loginSucces(){
        let tabbarController = UITabBarController()
        
        let layout = UICollectionViewFlowLayout()
        let homeController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        
        homeController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "homeSelected"))
        
        tabbarController.viewControllers = [homeController]
        
        self.navigationController?.pushViewController(tabbarController, animated: true)
    }
    
    func presentAlert(message: String) {
        let alert = UIAlertController(title: "Ooops!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
