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
    var alertView:UIAlertView!
    
    override func viewDidLoad() {
         alertView = UIAlertView()
        
        
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists turnpeople(uid integer primary key,Aname6 varchar(20),Bname6 varchar(20))")
        db.execute("create table if not exists nomalpeople12(id integer primary key,Aname1 varchar(20),Bname1 varchar(20),Aname2 varchar(20),Bname2 varchar(20),Aname3 varchar(20),Bname3 varchar(20),Aname4 varchar(20),Bname4 varchar(20),Aname5 varchar(20),Bname5 varchar(20))")
        db.execute("create table if not exists score(uid integer primary key,Ascore varchar(20),Bscore varchar(20))")
        db.execute("create table if not exists name(uid integer primary key,Aname varchar(20),Bname varchar(20))")
    }
    
    @IBAction func score(sender: UIButton) {
        initscore()
    }
    @IBAction func team(sender: UIButton) {
        initteam()
    }
    
    @IBAction func people2(sender: UIButton) {
        initTurn()
    }
    @IBAction func people(sender: UIButton) {
        inituser()
    }
    
    func initscore()
    {
        text.text=""
        let score=db.query("select * from score")
        text.text! += "历史记录:"+String(score.count)+"\n"
        for var a=0;a<score.count;a++
        {
            let score1 = score[a]
            text.text! += String(score1["uid"]!)+" "+"A队得分："+String(score1["Ascore"]!)+"  "+"B队得分："+String(score1["Bscore"]!)+"\n"
        }
 
    }
    func initteam()
    {
        text.text=""
        let team=db.query("select * from name")
        text.text! += "历史记录:"+String(team.count)+"\n"
        for var a=0;a<team.count;a++
        {
            let team1 = team[a]
            text.text! += String(team1["uid"]!)+" "+"A队伍名："+String(team1["Aname"]!)+"  "+"B队伍名："+String(team1["Bname"]!)+"\n"
        }
    }
    func initTurn()
    {
        text.text=""
        let people=db.query("select * from turnpeople")
         text.text! += "历史记录:"+String(people.count)+"\n"
        for var a=0;a<people.count;a++
        {
            let user1 = people[a]
            text.text! += String(user1["uid"]!)+"  "+"A替补队员： "+String(user1["Aname6"]!)+"  "+"B替补队员："+String(user1["Bname6"]!)+"\n"
            
        }
        
    }
    
    @IBAction func del(sender: UIButton) {
        alertView.title="确定要历史记录吗"
        //alertView.addButtonWithTitle("删除")
        alertView.addButtonWithTitle("确定")
        alertView.show()
 
       // if alertView.clipsToBounds
        //{
        let x=db.query("delete from score")
        db.query("delete from name")
        db.query("delete from nomalpeople12")
        db.query("delete from turnpeople")
        text.text = "历史记录:"+String(x.count)+"\n"

        //}
    }
    func inituser()
    {
        text.text=""
        let people=db.query("select * from nomalpeople12")
        text.text! += "历史记录:"+String(people.count)+"\n"
        for var a=0;a<people.count;a++
        {
            let user1 = people[a]
            text.text! += String(user1["uid"]!)+"  "+"A队第一名球员："+String(user1["Aname1"]!)+"B队第一名球员："+String(user1["Bname1"]!)+"A队第二名球员："+String(user1["Aname2"]!)+"B队第二名球员："+String(user1["Bname2"]!)+"A队第三名球员："+String(user1["Aname3"]!)+"B队第三名球员："+String(user1["Bname3"]!)+"A队第四名球员："+String(user1["Aname4"]!)+"B队第四名球员："+String(user1["Bname4"]!)+"A队第五名球员："+String(user1["Aname5"]!)+"B队第五名球员："+String(user1["Bname5"]!)+"\n"+"\n"
            
        }
        
        
    }
    

}
