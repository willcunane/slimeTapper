//
//  ViewController.swift
//  slimeTapGame
//
//  Created by Will on 5/28/19.
//  Copyright © 2019 Will Cunane. All rights reserved.
//

import UIKit
import AVFoundation

// set int for tap count
var tapIncrease = 1

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
	
    var audioPlayer : AVAudioPlayer?
		var Levels = [
			[#imageLiteral(resourceName: "100"), 100],
			[#imageLiteral(resourceName: "300"), 300],
			[#imageLiteral(resourceName: "500"), 500],
			[#imageLiteral(resourceName: "1000"), 1000],
			[#imageLiteral(resourceName: "5000"), 5000],
			[#imageLiteral(resourceName: "10000"), 10000]
		]
		
    @IBOutlet weak var buttonLink: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Stores tap count when app is closed
    var tapCount : Int{
        get{
            return UserDefaults.standard.value(forKey: "tapCount") as? Int ?? 0
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "tapCount")
            self.tapCountLabel.text = "\(newValue)"
        }
    }
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return Levels.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LevelsCollectionViewCell.reuseID, for: indexPath) as? LevelsCollectionViewCell else {
						return collectionView.dequeueReusableCell(withReuseIdentifier: "blank", for: indexPath)
		}
		let levelValue = Levels[indexPath.item][1]
		checkLevel(tapCount: tapCount, unlockValue: (levelValue as! Int))
		
		let cellImage = Levels[indexPath.item][0]
		cell.levelIcon.image = (cellImage as! UIImage)
		return cell
	}
	
	func checkLevel(tapCount : Int, unlockValue : Int) {
		if tapCount >= unlockValue {
			
		}
		
	}
    
    // loads unlock screen after tap count hits specific number
    @IBAction func loadUnlock(_ sender: Any){
        guard let unlockView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "unlockView") as? UnlockViewController else{return}
        unlockView.setTag((sender as! UIButton).tag)
        self.present(unlockView, animated: true, completion: nil)
    }
    
    // resets count
    @IBAction func resetButton(_ sender: Any) {
        self.tapCount = 0

    }
    
    
    
    // Play sound function
    func playSound(){
        if let player = audioPlayer{
            if player.isPlaying {
                player.pause()
                player.currentTime = 0
            }
            player.play()
        }else{
           
        }
    }
    
    
    //tab slime actions and animate
    @IBAction func slimeTap(_ sender: UIButton) {
        tapCount += tapIncrease
    //    checkLevel(tapCount)
        
        sender.layer.removeAllAnimations()
        
        UIView.animate(withDuration: 0.03, delay: 0, options: [.allowUserInteraction], animations: {
            self.playSound()
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            UIView.animate(withDuration: 0.03, delay: 0, options: [.allowUserInteraction], animations: {
                sender.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
    
    //checks level and changes locked/ unlocked images
    //enables buttons to load UnlockViewController
    
//    func checkLevel(_ count: Int){
//        self.tapCountLabel.text = "\(tapCount)"
//        if count >= 100 && !lvl1.isEnabled{
//            //change the image for
//            lvl1.isEnabled = true
//            let img = UIImage.init(named: "100unlocked.png")
//            lvl1.setBackgroundImage(img, for: .normal)
//        }
//        if count >= 300 && !lvl2.isEnabled{
//            //change the image for
//            lvl2.isEnabled = true
//            let img = UIImage.init(named: "300unlocked.png")
//            lvl2.setBackgroundImage(img, for: .normal)
//        }
//        if count >= 500 && !lvl3.isEnabled{
//            //change the image for
//            lvl3.isEnabled = true
//            let img = UIImage.init(named: "500unlocked.png")
//            lvl3.setBackgroundImage(img, for: .normal)
//        }
//        if count >= 1000 && !lvl4.isEnabled{
//            //change the image for
//            lvl4.isEnabled = true
//            let img = UIImage.init(named: "1000unlocked.png")
//            lvl4.setBackgroundImage(img, for: .normal)
//        }
//        if count >= 5000 && !lvl5.isEnabled{
//            //change the image for
//            lvl5.isEnabled = true
//            let img = UIImage.init(named: "5000unlocked.png")
//            lvl5.setBackgroundImage(img, for: .normal)
//        }
//        if count >= 10000 && !lvl6.isEnabled{
//            //change the image for
//            lvl6.isEnabled = true
//            let img = UIImage.init(named: "10000unlocked.png")
//            lvl6.setBackgroundImage(img, for: .normal)
//        }
//
//    }
    
    //tap counter label
    @IBOutlet weak var tapCountLabel: UILabel!
   
    //changes tap count increments
    //changes slime color and sounds when tapped
    func changeAssets(_ count: Int){
        self.tapCountLabel.text = "\(tapCount)"
        if tapCount >= 500{
            let img = UIImage.init(named: "GreenSlime.png")
            buttonLink.setImage(img, for: .normal)
        }
        if tapCount >= 10000{
            let img = UIImage.init(named: "RedSlime.png")
            buttonLink.setImage(img, for: .normal)
        }
        if tapCount >= 5000{
            setSound("slimesound2","wav")
        }
        if tapCount >= 100{
            tapIncrease = 2
        }
        if tapCount >= 300{
            tapIncrease = 4
        }
        if tapCount >= 1000{
            tapIncrease = 6
        }
        
    }
    // sound player
    func setSound(_ fileName : String, _ ext:String){
        guard let sound = Bundle.main.path(forResource: fileName, ofType: ext) else{return}
        if let player = audioPlayer{
            player.stop()
            do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            }catch let err{
                print(err)
            }
        }else{
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                audioPlayer?.prepareToPlay()
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            }
            catch let err{
                print(err)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
			collectionView.delegate = self
			collectionView.dataSource = self
        setSound("slimeSound","mp3")
   //     checkLevel(tapCount)
        changeAssets(tapCount)
        self.buttonLink.adjustsImageWhenHighlighted = false
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
  //      checkLevel(tapCount)
        changeAssets(tapCount)
        
    }
}

