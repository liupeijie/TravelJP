//
//  ListTableViewController.swift
//  TravelJP
//
//  Created by kojpkn on 2015/10/21.
//  Copyright © 2015年 向日葵会下雨. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController,OGActionChooserDelegate,UIApplicationDelegate {
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    //Sectionで使用する配列を定義
    let sectionTitle: NSArray = ["東京都","千葉県","神奈川県"]
    let tokyo = ["スカイツリー", "東京タワー", "渋谷","more"]
    let chiba = ["ディズニー", "幕張", "船橋","more"]
    let kanagawa = ["中華街", "赤レンガ倉庫", "江ノ島","more"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if saveData.objectForKey("WORD") != nil {
            wordArray = saveData.objectForKey("WORD") as! Array
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    
    //===============================================セクションのタイトルを返す
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section] as? String
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //===============================================各セルの内容
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ListTableViewCell
        //        let nowIndexPathDictionary: (AnyObject) = wordArray[indexPath.row]
        
        //        cell.label1.text = nowIndexPathDictionary["english"] as? String
        //        cell.label2.text = nowIndexPathDictionary["japanese"] as? String
        
        if(indexPath.section == 0){//==========================indexPath.sectionはセクション番号
            cell.label2.text = tokyo[indexPath.row]
        }else if(indexPath.section == 1){
            cell.label2.text = chiba[indexPath.row]
        }else if(indexPath.section == 2){
            cell.label2.text = kanagawa[indexPath.row]
        }
        
        return cell
    }
    
    //===============================================Cellが選択された際に呼び出される
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // 選択中のセルが何番目か.
        print("Num: \(indexPath.row)")
        
        // 選択中のセルを編集できるか.
        print("Edeintg: \(tableView.editing)")
        
        if(indexPath.row < 3){
            //=========================================================
            let acSheet: OGActionChooser = OGActionChooser.actionChooserWithDelegate(self) as! OGActionChooser
            acSheet.title = "ファイルに追加"
            let imgName: String = "actionChooser_Button.png"
            let fst: OGActionButton = OGActionButton.buttonWithTitle("name1", imageName: imgName, enabled: true) as! OGActionButton
            let snd: OGActionButton = OGActionButton.buttonWithTitle("name2", imageName: imgName, enabled: true) as! OGActionButton
            let trd: OGActionButton = OGActionButton.buttonWithTitle("name3", imageName: imgName, enabled: true) as! OGActionButton
            let fth: OGActionButton = OGActionButton.buttonWithTitle("name4", imageName: imgName, enabled: true) as! OGActionButton
            
            acSheet.setButtonsWithArray([fst,snd,trd,fth])
            acSheet.presentInView(tableView.superview)
            //=========================================================
        }
    }
    
    //    override func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    //    {
    //        return true
    //    }
    
    //===============================================エディット機能の提供に必要なメソッド
    //    override func tableView(tableView: UITableView,
    //        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
    //        forRowAtIndexPath indexPath: NSIndexPath) {
    //
    //    }
    
    //===============================================こちらのメソッドでindexPathで指定されたCell毎のRowAction配列を設定します
    //    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath)
    //        -> [AnyObject]? {
    //            let editAction =
    //            UITableViewRowAction(style: .Normal, // 削除等の破壊的な操作を示さないスタイル
    //                title: "edit"){(action, indexPath) in print("\(indexPath) edited")}
    //            editAction.backgroundColor = UIColor.greenColor()
    //            let deleteAction =
    //            UITableViewRowAction(style: .Default, // 標準のスタイル
    //                title: "delete"){(action, indexPath) in print("\(indexPath) deleted")}
    //            deleteAction.backgroundColor = UIColor.redColor()
    //            return [editAction, deleteAction]
    //    }
    
    //===============================================セルの並び替えを有効にする
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    }
    //===============================================戻るボタン
    @IBAction func backBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true , completion: nil)
    }
    
    //==================================================================================//ポップアップのボタンを押した時の挙動
    func actionChooser(ac: OGActionChooser, buttonPressedWithIndex index: Int) {
        switch index {
        case 0:
            ac.shouldDrawShadow = !ac.shouldDrawShadow
        case 1:
            ac.shouldDrawShadow = !ac.shouldDrawShadow
        case 2:
            ac.backgroundColor = UIColor.blueColor()
        case 3:
            NSLog("4")
        case 4:
            NSLog("5")
        case 5:
            NSLog("6")
        case 6:
            NSLog("7")
        default:
            NSLog("clicked button with index: %i", index+1)
        }
    }
    //==================================================================================
    
}
