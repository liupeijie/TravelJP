//
//  ViewController.swift
//  TravelJP
//
//  Created by 向日葵会下雨 on H27/10/11.
//  Copyright © 平成27年 向日葵会下雨. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!

    //テーブルに表示するセル配列
    let items: NSMutableArray = ["TEST1", "TEST2", "TEST3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //テーブルビュー初期化、関連付け
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.estimatedRowHeight = 84
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        // Cellに値を設定.
        cell.textLabel?.text = "\(items[indexPath.row])"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("セルを選択しました！ #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 削除のとき.
        if editingStyle == UITableViewCellEditingStyle.Delete {
            print("削除")
            
            // 指定されたセルのオブジェクトをmyItemsから削除する.
            items.removeObjectAtIndex(indexPath.row)
            
            // TableViewを再読み込み.
            tableView.reloadData()
        }
    }
    
    /*
    今はただテスト用に作ったもの、画面や変数など整いたら地図画面に遷移するかも
    */
    @IBAction func addCell() {
        print("追加")
        
        // myItemsに追加.
        items.addObject("add Cell")
        
        // TableViewを再読み込み.
        tableView.reloadData()
    }
  
    
    @IBAction func makeRoot() {
        //ルート作成ボタンのメソット
    }
    
    @IBAction func return1 (segue: UIStoryboardSegue) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

