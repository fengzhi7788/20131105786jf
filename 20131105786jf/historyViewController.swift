//
//  teamViewController.swift
//  20131105786jf
//
//  Created by fz on 16/5/12.
//  Copyright © 2016年 fz. All rights reserved.
//

import UIKit

class historyViewController: UIViewController {
    var db:SQLiteDB!
    
    
    
    @IBOutlet weak var text: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        
        db.execute("create table if not exists turnpeople(uid integer primary key,Aname6 varchar(20),Bname6 varchar(20))")
        
        db.execute("create table if not exists nomalpeople12(uid integer primary key,Aname1 varchar(20),Bname1 varchar(20),Aname2 varchar(20),Bname2 varchar(20),Aname3 varchar(20),Bname3 varchar(20),Aname4 varchar(20),Bname4 varchar(20),Aname5 varchar(20),Bname5 varchar(20))")

        
    }

    
    @IBAction func people(sender: UIButton) {
        initUser1()
    }
    //从SQLite加载数据
    func initUser1() {
        //let data = db.query("select * from nomalpeople12")
        let data2=db.query("select * from nomalpeople12")
        for var a=0;a<data2.count;a++
        {
            let user = data2[a]
            text.text = String(user)

        }
        //let data1 = db.query("select * from turnpeople")
        //for var a=0;a<data.count;a++ {
            //获取最后一行数据显示
          //  let user = data[a]
          //  text.text = user["Aname1"] as? String
            //text.text = user[""]![""] as? String
            //        }
        /*if data1.count > 0 {
            //获取最后一行数据显示
            let user2 = data1[data1.count - 1]
            text.text = user2["Aname6"] as? String
            text.text = user2["Bname6"] as? String
        }*/
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
