//
//  UserInfoViewController.swift
//  logInApp
//
//  Created by Константин Прокофьев on 20.07.2021.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User!
    //MARK: - private properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userInfoLabel: UILabel!
    
    override func viewWillLayoutSubviews() {
        imageView.layer.cornerRadius = 10
        userInfoLabel.layer.cornerRadius = 10
        userInfoLabel.text =
            """
            
            """
    }
    
    
}
