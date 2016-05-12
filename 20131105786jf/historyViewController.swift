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
        initUser()
    }
    
    func initscore()
    {
        let score=db.query("select * from score")
        for var a=0;a<score.count;a++
        {
            let score1 = score[a]
            text.text! += String(score1)+"\n"
        }
    }
    func initteam()
    {
        let team=db.query("select * from name")
        for var a=0;a<team.count;a++
        {
            let team1 = team[a]
            text.text! += String(team1)+"\n"
        }
    }
    func initTurn()
    {
        let people=db.query("select * from turnpeople")
        for var a=0;a<people.count;a++
        {
            let user1 = people[a]
            text.text! += String(user1)+"\n"
            
        }
        
    }
    func initUser() {
        
        let people=db.query("select * from nomalpeople12")
        for var a=0;a<people.count;a++
        {
            let user1 = people[a]
            text.text! += String(user1)+"\n"
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
