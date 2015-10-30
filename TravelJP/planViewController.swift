//
//  planViewController.swift
//  TravelJP
//
//  Created by 向日葵会下雨 on H27/10/17.
//  Copyright © 平成27年 向日葵会下雨. All rights reserved.
//

import UIKit

class planViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var table:UITableView!
    let label2Array: NSMutableArray = ["a","b","c","d"]//ファイルのタイトル
    var fileNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label2Array.count
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
//        let img = UIImage(named:"\(imgArray[indexPath.row])")
        // Tag番号 1 で UIImageView インスタンスの生成
//        let imageView = table.viewWithTag(1) as! UIImageView
//        imageView.image = img
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = "No.\(indexPath.row + 1)"
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = "\(label2Array[indexPath.row])"
        
        return cell
    }
    
    // Cell が選択された場合
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        fileNumber = indexPath.row + 1
        print("fileNumber:\(fileNumber)")
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toViewController") {
        }
    }

//画面遷移を行って、また元の画面に戻ってきた際に、セルの選択状態を解除するコード
    override func viewWillAppear(animated: Bool) {
        if let indexPath = table.indexPathForSelectedRow {
            table.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//==========================================================================値渡しのためのもの
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.ViewVal = label2Array //Stringの値を引き渡す(ポインタ)
        appDelegate.ViewVal2 = label2Array.count
        appDelegate.ViewVal3 = fileNumber
    }

}
