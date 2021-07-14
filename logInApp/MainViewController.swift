//
//  ViewController.swift
//  logInApp
//
//  Created by Константин Прокофьев on 12.07.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userPasswordTF: UITextField!

    let userName = "Eugeniya"
    let userPassword = "Teacher"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.layer.cornerRadius = 20
        userPasswordTF.layer.cornerRadius = 20
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.welcome = userNameTF.text
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    @IBAction func logInAction() {
        if userNameTF.text == userName && userPasswordTF.text == userPassword {
      performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            showAlert(title: "Access denied⛔️", message: "Login or password are invalid")
        }
    }
    
    
    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        self.userNameTF.text = ""
        self.userPasswordTF.text = ""
    }
    
    @IBAction func showUserNameAlert() {
    showAlert(title: "Ooops!", message: "Your user name is \(userName) 👩🏽‍💻")
    }
        
    @IBAction func showUserPasswordAlert() {
        showAlert(title: "Ooops!", message: "Your password is \(userPassword) 👩🏽‍💻")
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

