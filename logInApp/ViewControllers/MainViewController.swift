//
//  ViewController.swift
//  logInApp
//
//  Created by Константин Прокофьев on 12.07.2021.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: IB Outlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userPasswordTF: UITextField!

    // MARK: - Private properties
    private let user = User.getUserData()
   
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
    
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoViewController
                userInfoVC.user = user
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.layer.cornerRadius = 20
        userPasswordTF.layer.cornerRadius = 20
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    //MARK: - IB Actions
    
  
    @IBAction func loginAction() {
        if userNameTF.text == user.userName || userPasswordTF.text == user.userPassword {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            showAlert(title: "Access denied⛔️", message: "Login or password are invalid")
        }
    }
    
    
    
    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        userPasswordTF.text = ""
    }
    
    @IBAction func showUserNameAlert() {
        showAlert(title: "Ooops!", message: "Your user name is \(user.userName) 👩🏽‍💻")
        userNameTF.text = user.userName
    }
        
    @IBAction func showUserPasswordAlert() {
        showAlert(title: "Ooops!", message: "Your password is \(user.userPassword) 👩🏽‍💻")
        userPasswordTF.text = user.userPassword
    }
    
    
}

//  MARK: - private methods
extension MainViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

