//
//  Levels.swift
//  slimeTapGame
//
//  Created by Will on 1/22/21.
//  Copyright © 2021 Will Cunane. All rights reserved.
//

import Foundation
import UIKit

class LevelsCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var levelIcon: UIImageView!
	@IBOutlet weak var valueLabel: UILabel!
	@IBOutlet weak var lockIcon: UIImageView!
	@IBOutlet weak var disabledImage: UIImageView!
	
	public static var reuseID : String = "reuseID"
	
}
