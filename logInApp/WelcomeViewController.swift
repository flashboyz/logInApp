//
//  WelcomeViewController.swift
//  logInApp
//
//  Created by Константин Прокофьев on 13.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcome: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let welcome = self.welcome else {return}
        welcomeLabel.text = "Welcome, \(welcome) 👋🏽"
    }
}
