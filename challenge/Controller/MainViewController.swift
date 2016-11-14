//
//  ViewController.swift
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var btFindUser: UIButton!
    @IBOutlet weak var btFindRepository: UIButton!
    let cornerRadius : CGFloat = 5.0


    override func viewDidLoad() {
        super.viewDidLoad()
        btFindUser.layer.cornerRadius = cornerRadius
        btFindRepository.layer.cornerRadius = cornerRadius
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }


}

