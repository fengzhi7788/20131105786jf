//
//  teamViewController.swift
//  20131105786jf
//
//  Created by fz on 16/5/12.
//  Copyright © 2016年 fz. All rights reserved.
//

import UIKit

class teamViewController: UIViewController {
    var db:SQLiteDB!
    
    
    
    @IBOutlet weak var A1: UITextField!
    @IBOutlet weak var A2: UITextField!
    @IBOutlet weak var A3: UITextField!
    @IBOutlet weak var A4: UITextField!
    @IBOutlet weak var A5: UITextField!
    @IBOutlet weak var A6: UITextField!
    @IBOutlet weak var B1: UITextField!
    @IBOutlet weak var B2: UITextField!
    @IBOutlet weak var B3: UITextField!
    @IBOutlet weak var B4: UITextField!
    @IBOutlet weak var B5: UITextField!
    @IBOutlet weak var B6: UITextField!

    var team1 = 0
    
    
    
    
    
    @IBAction func save(sender: UIButton) {
        save()
    }
    
    @IBAction func save2(sender: UIButton) {
        save1()
    }
    @IBAction func clean(sender: UIButton) {
        clean()
        save()
    }
    @IBAction func clean2(sender: UIButton) {
        clean1()
        save1()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        
        db.execute("create table if not exists turnpeople(uid integer primary key,Aname6 varchar(20),Bname6 varchar(20))")
        
        db.execute("create table if not exists nomalpeople12(uid integer primary key,Aname1 varchar(20),Bname1 varchar(20),Aname2 varchar(20),Bname2 varchar(20),Aname3 varchar(20),Bname3 varchar(20),Aname4 varchar(20),Bname4 varchar(20),Aname5 varchar(20),Bname5 varchar(20))")
        //如果有数据则加载
        initUser()
        
    }
    
    //点击保存
    //    @IBAction func saveClicked(sender: AnyObject) {
    //        saveUser()
    //    }
    
    //从SQLite加载数据
    func clean()
    {
        A1.text = ""
        B1.text = ""
        A2.text = ""
        B2.text = ""
        A3.text = ""
        B3.text = ""
        A4.text = ""
        B4.text = ""
        A5.text = ""
        B5.text = ""
    }
    func clean1()
    {
        A6.text = ""
        B6.text = ""
    }
    func initUser() {
        let data = db.query("select * from nomalpeople12")
        let data1 = db.query("select * from turnpeople")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            A1.text = user["Aname1"] as? String
            B1.text = user["Bname1"] as? String
            A2.text = user["Aname2"] as? String
            B2.text = user["Bname2"] as? String
            A3.text = user["Aname3"] as? String
            B3.text = user["Bname3"] as? String
            A4.text = user["Aname4"] as? String
            B4.text = user["Bname4"] as? String
            A5.text = user["Aname5"] as? String
            B5.text = user["Bname5"] as? String
        }
        if data1.count > 0 {
            //获取最后一行数据显示
            let user2 = data1[data1.count - 1]
            A6.text = user2["Aname6"] as? String
            B6.text = user2["Bname6"] as? String
        }
    }
    
    //保存数据到SQLite
    func save1(){
        let Bname6 = self.B6.text!
        let Aname6 = self.A6.text!
        
        let sql2 = "insert into turnpeople(Aname6,Bname6) values('\(Aname6)','\(Bname6)')"
        print("sql: \(sql2)")
        let result = db.execute(sql2)
        print(result)

    }
    func save() {
        let Aname1 = self.A1.text!
        let Aname2 = self.A2.text!
        let Aname3 = self.A3.text!
        let Aname4 = self.A4.text!
        let Aname5 = self.A5.text!
        let Bname1 = self.B1.text!
        let Bname2 = self.B2.text!
        let Bname3 = self.B3.text!
        let Bname4 = self.B4.text!
        let Bname5 = self.B5.text!
        
        
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into nomalpeople12(Aname1,Bname1,Aname2,Bname2,Aname3,Bname3,Aname4,Bname4,Aname5,Bname5) values('\(Aname1)','\(Bname1)','\(Aname2)','\(Bname2)','\(Aname3)','\(Bname3)','\(Aname4)','\(Bname4)','\(Aname5)','\(Bname5)')"
        
        
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
