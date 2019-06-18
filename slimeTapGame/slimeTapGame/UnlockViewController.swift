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
    private var tag : Int = 0
    public func setTag(_ tag : Int){
        self.tag = tag
    }
    @IBAction func collect(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    func getReward(){
        if self.tag >= 100{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "2pertap.png")
        }
        if self.tag >= 300{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "4Pertap.png")
        }
        if self.tag >= 500{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "GreenSlimeColor_.png")
        }
        if self.tag >= 1000{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "NewMusic.png")
        }
        if self.tag >= 5000{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "NewSlimeSound_.png")
        }
        if self.tag >= 10000{
            //change the image for
            rewardDisplay.image = UIImage.init(named: "RedSlimeColor_.png")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getReward()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
