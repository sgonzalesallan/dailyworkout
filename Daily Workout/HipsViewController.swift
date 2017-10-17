//
//  HipsViewController.swift
//  Daily Workout
//
//  Created by MAC03 on 05/10/2017.
//  Copyright © 2017 UPang. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class HipsViewController: UIViewController
    {
        var videoplayer = AVPlayerViewController()
        var video = AVPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //BOYS
    @IBAction func mvideo(sender: UIButton)
    {
        let path = NSBundle.mainBundle().pathForResource("hip exercise for men", ofType: ".mp4")
        let url = NSURL(fileURLWithPath: path!)
        video = AVPlayer(URL: url)
        videoplayer.player = video
        self.presentViewController(videoplayer, animated:true)
        {
            self.videoplayer.player?.pause()
            self.videoplayer.player?.play()
        }
    }
    
    @IBAction func mvideo1(sender: UIButton)
    {
        let path = NSBundle.mainBundle().pathForResource("hip exercise for men 1", ofType: ".mp4")
        let url = NSURL(fileURLWithPath: path!)
        video = AVPlayer(URL: url)
        videoplayer.player = video
        self.presentViewController(videoplayer, animated:true)
        {
            self.videoplayer.player?.pause()
            self.videoplayer.player?.play()
        }
    }
    
    //GIRLS
    @IBAction func fvideo(sender: UIButton)
    {
        let path = NSBundle.mainBundle().pathForResource("hip exercise for women", ofType: ".mp4")
        let url = NSURL(fileURLWithPath: path!)
        video = AVPlayer(URL: url)
        videoplayer.player = video
        self.presentViewController(videoplayer, animated:true)
        {
            self.videoplayer.player?.pause()
            self.videoplayer.player?.play()
        }
    }
    
    @IBAction func fvideo1(sender: UIButton)
    {
        let path = NSBundle.mainBundle().pathForResource("hip exercise for women 1", ofType: ".mp4")
        let url = NSURL(fileURLWithPath: path!)
        video = AVPlayer(URL: url)
        videoplayer.player = video
        self.presentViewController(videoplayer, animated:true)
        {
            self.videoplayer.player?.pause()
            self.videoplayer.player?.play()
        }
    }
    
    
}
