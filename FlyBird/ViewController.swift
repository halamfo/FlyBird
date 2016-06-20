//
//  ViewController.swift
//  FlyBird
//
//  Created by Dân Tơi on 6/13/16.
//  Copyright © 2016 Dân Tơi. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var bird = UIImageView()
    var audioplayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        drawjungle()
        addBird()
        flyupdown()
        playsong()
    }
    func drawjungle(){
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .ScaleAspectFill
        self.view.addSubview(background)
    }
    func addBird(){
        bird = UIImageView(frame:CGRectMake(0, 0, 100, 60))
        bird.animationImages = [UIImage(named: "bird0.png")!, UIImage(named: "bird1.png")!, UIImage(named: "bird2.png")!, UIImage(named: "bird3.png")!, UIImage(named: "bird4.png")!, UIImage(named: "bird5.png")!]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
        
    }
    func flyupdown(){
        self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, 1, 1), CGAffineTransformMakeRotation(0.5))
        UIView.animateWithDuration(2, animations: {
            self.bird.center = CGPointMake(self.view.bounds.width-50, self.view.bounds.height-50)
            }) { (finished) in
                self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(-0.5))
                UIView.animateWithDuration(1, animations: {
                    self.bird.center = CGPointMake(50, self.view.bounds.height-50)
                }) { (finished) in
                    self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(-0.785))
                    UIView.animateWithDuration(2, animations: {
                        self.bird.center = CGPointMake(self.view.bounds.width-50, 50)
                    }) { (finished) in
                        self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(0.785))
                        UIView.animateWithDuration(1, animations: {
                            self.bird.center = CGPointMake(50, 50)
                        }) { (finished) in
                            self.bird.transform = CGAffineTransformIdentity
                            self.flyupdown()
                        }
                    }
                }
        }
    }
    func playsong()
    {
        let filepath = NSBundle.mainBundle().pathForResource("A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = NSURL(fileURLWithPath: filepath!)
        audioplayer = try! AVAudioPlayer(contentsOfURL: url)
        audioplayer.prepareToPlay()
        audioplayer.play()
    }
    
    

}

