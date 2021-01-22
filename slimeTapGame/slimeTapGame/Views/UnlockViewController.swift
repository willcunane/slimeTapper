//
//  AhopViewController.swift
//  slimeTapGame
//
//  Created by Will on 5/29/19.
//  Copyright © 2019 Will Cunane. All rights reserved.
//

import UIKit

class UnlockViewController: UIViewController {

    @IBOutlet weak var rewardDisplay: UIImageView!
    private var tapCount : Int = 0
    public func setTag(_ tag : Int){
        self.tapCount = tag
    }
    @IBAction func collect(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    func getReward(){
        if self.tapCount >= 100{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "2pertap.png")
        }
        if self.tapCount >= 300{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "4Pertap.png")
        }
        if self.tapCount >= 500{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "GreenSlimeColor_.png")
        }
        if self.tapCount >= 1000{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "NewMusic.png")
        }
        if self.tapCount >= 5000{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "NewSlimeSound_.png")
        }
        if self.tapCount >= 10000{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "RedSlimeColor_.png")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getReward()
        // Do any additional setup after loading the view.
    }


}
