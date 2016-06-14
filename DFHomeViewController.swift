//
//  DFHomeViewController.swift
//  DFZhanQiTv.Swift
//
//  Created by 梁粱展焯 on 16/6/7.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

let RUI_WEN = "http://dlhls.cdn.zhanqi.tv/zqlive/24589_O0xLv.m3u8"
let BIAO_GE = "http://dlhls.cdn.zhanqi.tv/zqlive/2766_OUCz5.m3u8"
let KU_XIAO = "http://dlhls.cdn.zhanqi.tv/zqlive/101441_dDhu0.m3u8"
let SHANG_DAN = "http://dlhls.cdn.zhanqi.tv/zqlive/76451_y0Orl.m3u8"
let HUANG_SHI = "http://dlhls.cdn.zhanqi.tv/zqlive/92885_jXzXq.m3u8"
let BU_ZHI = "http://dlhls.cdn.zhanqi.tv/zqlive/25224_s0576.m3u8"


import UIKit

class DFHomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.navigationController?.navigationBar.translucent = false
        
        self.title = "战旗Tv.swift"
        
        self.collectionView .registerNib(UINib.init(nibName: "TvCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellID")
        
        self.collectionView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        let layout = UICollectionViewFlowLayout.init()
        
        self.collectionView.setCollectionViewLayout(layout, animated: false)
        
        layout.itemSize = CGSize.init(width: 181, height: 99)
        
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cellID = "cellID"
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! TvCollectionViewCell
        
//        let aCell = cell as? TvCollectionViewCell
        
//        TvCollectionViewCell * cell = (UICollectionViewCell *) aCell;
        
        cell.backgroundColor = UIColor.orangeColor()
        
        if indexPath.item == 0 {
                cell.label.text = "表哥"
                cell.urlString = BIAO_GE;
            }else if (indexPath.item == 1){
                cell.label.text = "苦笑"
                cell.urlString = KU_XIAO;
            }else if (indexPath.item == 2){
                cell.label.text = "瑞文"
                cell.urlString = RUI_WEN;
            }else if (indexPath.item == 3){
                cell.label.text = "上单"
                cell.urlString = SHANG_DAN;
            }else if (indexPath.item == 4){
                cell.label.text = "皇室战争"
                cell.urlString = HUANG_SHI;
            }else if (indexPath.item == 5){
                cell.label.text = "不知道是谁"
                cell.urlString = BU_ZHI;
            }
        return cell
    
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! TvCollectionViewCell
        
        let tvViewController = TvViewController()
        
        tvViewController.urlString = cell.urlString
        
        self.navigationController?.pushViewController(tvViewController, animated: true)
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
