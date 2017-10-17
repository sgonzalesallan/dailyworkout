//
//  waistViewController.swift
//  Daily Workout
//
//  Created by MAC44 on 04/10/2017.
//  Copyright © 2017 UPang. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class waistViewController: UIViewController
{
    var videoplayer = AVPlayerViewController()
    var video = AVPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //BOYS
    @IBAction func mvideo1(sender: UIButton)
        {
            let path = NSBundle.mainBundle().pathForResource("waistline exercise for men", ofType: ".mp4")
            let url = NSURL(fileURLWithPath: path!)
            video = AVPlayer(URL: url)
            videoplayer.player = video
            self.presentViewController(videoplayer, animated:true)
            {
                self.videoplayer.player?.pause()
                self.videoplayer.player?.play()
            }
        }
    
    @IBAction func mvideo2(sender: UIButton)
    {
        let path = NSBundle.mainBundle().pathForResource("waistline exercise for men 1", ofType: ".mp4")
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
    @IBAction func fvideo1(sender: UIButton)
    {
        let path = NSBundle.mainBundle().pathForResource("waistline exercise for women", ofType: ".mp4")
        let url = NSURL(fileURLWithPath: path!)
        video = AVPlayer(URL: url)
        videoplayer.player = video
        self.presentViewController(videoplayer, animated:true)
        {
            self.videoplayer.player?.pause()
            self.videoplayer.player?.play()
        }
    }
    
    @IBAction func fvideo2(sender: UIButton)
    {
        let path = NSBundle.mainBundle().pathForResource("waistline exercise for women 1", ofType: ".mp4")
        let url = NSURL(fileURLWithPath: path!)
        video = AVPlayer(URL: url)
        videoplayer.player = video
        self.presentViewController(videoplayer, animated:true)
        {
            self.videoplayer.player?.pause()
            self.videoplayer.player?.play()
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
