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

    @IBOutlet weak var text2: UITextField!

    @IBOutlet weak var text1: UITextField!
    var a=0
    var b=0
    @IBAction func one(sender: UIButton) {
        a=a+1
        text1.text=("\(a)")
    }
    @IBAction func two(sender: UIButton) {
        a=a+2
        text1.text=("\(a)")
    }
    @IBAction func three(sender: UIButton) {
        a=a+3
        text1.text=("\(a)")
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        initUser()
    }
    
    //点击保存
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            text1.text = user["uname"] as? String
            text1.text = user["mobile"] as? String
        }
    }
    
    //保存数据到SQLite
    func saveUser() {
        let uname = self.text1.text!
        let mobile = self.text1.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

}

