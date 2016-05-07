//
//  ViewController.swift
//  20131105786jf
//
//  Created by fz on 16/5/5.
//  Copyright © 2016年 fz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var db:SQLiteDB!

    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var text2: UITextField!

    @IBOutlet weak var name2: UITextField!
    @IBOutlet weak var text1: UITextField!
    var a:Int32=0
    var b:Int32=0
    @IBAction func one(sender: UIButton) {
        a=a+1
        text1.text=("\(a)")
        saveUser()
    }
    @IBAction func two(sender: UIButton) {
        a=a+2
        text1.text=("\(a)")
        saveUser()
    }
    @IBAction func three(sender: UIButton) {
        a=a+3
        text1.text=("\(a)")
        saveUser()
    }
    @IBAction func one1(sender: UIButton) {
        b=b+1
        text2.text=("\(b)")
    }
    @IBAction func two1(sender: UIButton) {
        b=b+2
        text2.text=("\(b)")
    }
    @IBAction func three3(sender: UIButton) {
        b=b+3
        text2.text=("\(b)")
    }
    @IBAction func startgame(sender: UIButton) {
        name1.text=""
        name2.text=""
        text1.text="0"
        text2.text="0"
        a=0
        b=0
    }
    @IBAction func exitt(sender: UIButton) {
        var x:Int32=0
        var y:Int32=0
        x=(text1.text! as NSString).intValue
        y=(text2.text! as NSString).intValue
        a=x
        b=y
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists score(uid integer primary key,Ascore varchar(20),Bscore varchar(20))")
        db.execute("create table if not exists name(uid integer primary key,Aname varchar(20),Bname varchar(20))")
        //如果有数据则加载
        initUser()
        
    }
    
    //点击保存
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from score")
        let data1 = db.query("select * from name")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            text1.text = user["Ascore"] as? String
            text2.text = user["Bscore"] as? String
        }
        if data1.count > 0 {
            //获取最后一行数据显示
            let user2 = data1[data1.count - 1]
            name1.text = user2["Aname"] as? String
            name2.text = user2["Bname"] as? String
        }
    }
    
    //保存数据到SQLite
    func saveUser() {
        let Ascore = self.text1.text!
        let Bscore = self.text2.text!
        let Aname = self.name1.text!
        let Bname = self.name2.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into name(Aname,Bname) values('\(Aname)','\(Bname)')"
        let sql2 = "insert into score(Ascore,Bscore) values('\(Ascore)','\(Bscore)')"
        print("sql: \(sql2)")
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

}

