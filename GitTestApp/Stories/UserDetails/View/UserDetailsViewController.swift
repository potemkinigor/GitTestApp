//
//  UserDetailsViewController.swift
//  GitTestApp
//
//  Created by User on 20.05.2022.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var userDetailsView: UserDetailsView!
    
    override func loadView() {
        self.view = userDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
