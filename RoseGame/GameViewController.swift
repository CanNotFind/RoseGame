//
//  GameViewController.swift
//  RoseGame
//
//  Created by 吴青 on 16/8/2.
//  Copyright (c) 2016年 tick. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var scene: GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure the view
        let skview = view as! SKView
        skview.multipleTouchEnabled = false
        
        // Create and configure the scene
        scene = GameScene(size: skview.bounds.size)
        scene.scaleMode = .AspectFill
        
        // Present the scene
        skview.presentScene(scene)
        
        

    }

   
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
