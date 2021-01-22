//
//  StartViewController.swift
//  slimeTapGame
//
//  Created by Will on 2/1/20.
//  Copyright © 2020 Will Cunane. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBAction func startBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "vc")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
