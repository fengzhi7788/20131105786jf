//
//  jishiViewController.swift
//  20131105786jf
//
//  Created by fz on 16/5/7.
//  Copyright © 2016年 fz. All rights reserved.
//

import UIKit

class sec: UIViewController {
    
    
    var db:SQLiteDB!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var stoporcon: UIButton!
    @IBOutlet weak var startBt: UIButton!
    @IBOutlet weak var min: UITextField!
    @IBOutlet weak var sec: UITextField!
    //定义分 ＋秒数
    var x:Int32=0
    var y:Int32=0
    //总秒
    var leftTime:Int32 = 0
    
    var timer:NSTimer!
    
    var alertView:UIAlertView!
    
    var start=false
    
    
    
    @IBAction func start(sender: UIButton) {
        x=60*(min.text! as NSString).intValue
        y=(sec.text! as NSString).intValue
        leftTime=x+y
        if min.text!==""&&sec.text==""
        {
            a("请输入时间",tile:"")
        }else if min.text=="0"&&sec.text=="0"||min.text=="0"&&sec.text==""||min.text==""&&sec.text=="0"
        {
            a("该时间不能倒计时",tile:"")
        }
        else
        {
            startBt.setTitle("倒计时中",forState:UIControlState.Normal)
            start=true
            timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1),target:self,selector:Selector("tickDown"),userInfo:nil,repeats:true)
            a("倒计时开始，还有 \(leftTime) 秒..",tile: "倒计时开始")
            start=true
            
            //var emptyArray: [Int32] = []
            save()
        }
    }
    
    
    @IBAction func restoration(sender: UIButton) {
        if start==true
        {
            timer.invalidate()
            leftTime = 0
            min.text="0"
            sec.text="0"
            label1.text="0"
            label2.text="0"
            a("",tile: "复位成功")
            startBt.setTitle("开始", forState: UIControlState.Normal)
        }else
        {
            if min=="0"&&sec=="0"
            {
                
            }
            else
            {
                a("",tile: "你还没有开始计时")
            }
        }
    }
    @IBAction func stoporcontinue(sender: UIButton) {
        stoporstart()
    }
    func stoporstart()
    {
        if start==true
        {
            stoporcon.setTitle("继续", forState: UIControlState.Normal)
            start=false
            a("已经暂停，还有 \(leftTime) 秒...",tile: "")
            timer.invalidate()
            
            
        }else
        {
            if min.text==""&&sec.text==""||min.text=="0"&&sec.text=="0"||min.text==""&&sec.text=="0"||min.text=="0"&&sec.text==""
            {
                a("",tile: "还没有开始")
            }else
            {
                stoporcon.setTitle("暂停", forState: UIControlState.Normal)
                timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1),target:self,selector:Selector("tickDown"),
                    userInfo:nil,repeats:true)
                a("已经暂停，还有 \(leftTime) 秒...",tile: "到计时开始")
                start=true
            }
        }
        
    }
    func tickDown()
    {
        alertView.message = "倒计时开始，还有 \(leftTime) 秒..."
        if !start==false
        {
            leftTime -= 1
            print(leftTime)
            if leftTime <= 0
            {
                timer.invalidate()
            }
            
            
            if y==0&&x>0
            {
                x=x-1
                y=60
                
            }else if y==0&&x==0
            {
                a("比赛结束",tile:"")
            }
            y-=1
            label1.text=String(x/60)
            label2.text=String(y)
            
            
        }else
        {
            timer.invalidate()
        }
    }
    
    func a(msg:String,tile:String)
    {
        
        alertView.message = msg
        alertView.title = tile
        alertView.addButtonWithTitle("确定")
        alertView.show()
    }
    func save()
    {
        let min = self.min.text!
        let sec = self.sec.text!
        let sql = "insert into time(min,sec) values('\(min)','\(sec)')"
        print("sql: \(sql)")
        let result = db.execute(sql)
        print(result)
    }
    func initUser() {
        let data = db.query("select * from time")
        
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            min.text = user["min"] as? String
            sec.text = user["sec"] as? String
        }
        //var x=leftTime
        label1.text=String(leftTime/60)
        label2.text=String(leftTime%60)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alertView = UIAlertView()
        
        //        let bg=UIImage(named: "lanqiu.jpg")
        //        self.view.backgroundColor=UIColor(patternImage: bg!)
        
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists time(uid integer primary key,cout varchar(20),min varchar(20),sec varchar(20))")
        
        initUser()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
