//
//  TvViewController.swift
//  DFZhanQiTv.Swift
//
//  Created by 梁粱展焯 on 16/6/13.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

var SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
var SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

class TvViewController: UIViewController {

    var urlString = ""
    
//    var playerItem:AVPlayerItem?
//    var player:AVPlayer?
    
    private var playView = UIView()

    private var player = AVPlayer()
    
    private var playerLayer = AVPlayerLayer()
    
    private var item = AVPlayerItem.init(URL: NSURL.init())
    
    private var toolbar = UIToolbar.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "直播"
        
        self.navigationController?.navigationBar.translucent = false
        
        //---PlayView---
        self.playView = UIView.init()
        self.playView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*9/16)
//        self.playView.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.playView)

        //---AVPlayerItem---
        self.item = AVPlayerItem.init(URL: NSURL(string: urlString)!)
        self.player = AVPlayer.init(playerItem: self.item)
        
        //---AVPlayerLayer---
        self.playerLayer.player = self.player
        self.playerLayer.frame = CGRectMake(0, 0, self.playView.frame.size.width, self.playView.frame.size.height)
//        self.playerLayer.backgroundColor = UIColor.blueColor().CGColor
        self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        self.playView.layer.addSublayer(self.playerLayer)
        
        self.player.play()
        
        //---重连按钮---
        let rightItem = UIBarButtonItem.init(title: "重连", style: UIBarButtonItemStyle.Plain, target: self, action:#selector(TvViewController.repeatPlayer))
        self.navigationItem.rightBarButtonItem = rightItem

        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func repeatPlayer(){
        self.playerLayer.removeFromSuperlayer()
        self.item = AVPlayerItem.init(URL: NSURL(string: urlString)!)
        self.player = AVPlayer.init(playerItem: self.item)
        self.playerLayer = AVPlayerLayer.init(player: self.player)
        self.playerLayer.frame = CGRectMake(0, 0, self.playView.frame.size.width,  self.playView.frame.size.height)
        self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
        
        self.playView.layer .addSublayer(self.playerLayer)
        self.playerLayer.zPosition = 10
        
        self.player.play()
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        
        if self.interfaceOrientation.isPortrait{
            
            self.playView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*9/16)
            self.playerLayer.frame = CGRectMake(0, 0, self.playView.frame.size.width, self.playView.frame.size.height)
            
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            
        }else if self.interfaceOrientation.isLandscape{
            
            self.playView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width , UIScreen.mainScreen().bounds.size.height)
//            self.playView.backgroundColor = UIColor.blueColor()
            self.playerLayer.frame = CGRectMake(0, 0, self.playView.frame.size.width, self.playView.frame.size.height)
            
            self.navigationController?.setNavigationBarHidden(true, animated: false)
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
