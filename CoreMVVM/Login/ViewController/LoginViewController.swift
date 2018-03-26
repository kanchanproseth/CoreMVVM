//
//  ViewController.swift
//  CoreMVVM
//
//  Created by CyberK on 3/19/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa

class LoginViewController: UIViewController{
    
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func validatePhonenumber(phoneNumber: String){
        
    }
    
    @IBAction func signIn(_ sender: Any) {
        viewModel.login(phoneNumber: phoneNumberTF.text!) {
            print("success")
        }

    }
    
    
    
}

