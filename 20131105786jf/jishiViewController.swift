//
//  jishiViewController.swift
//  20131105786jf
//
//  Created by fz on 16/5/7.
//  Copyright © 2016年 fz. All rights reserved.
//

import UIKit

class jishiViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var stoporcon: UIButton!
    @IBOutlet weak var startBt: UIButton!
    @IBOutlet weak var min: UITextField!
    @IBOutlet weak var sec: UITextField!
    var x:Int32=0
    var y:Int32=0
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
            alertView = UIAlertView()
            alertView.title="请输入时间"
            alertView.addButtonWithTitle("确定")
            alertView.show()
        }else if min.text=="0"&&sec.text=="0"||min.text=="0"&&sec.text==""||min.text==""&&sec.text=="0"
        {
            alertView = UIAlertView()
            alertView.title="该时间不能倒计时"
            alertView.addButtonWithTitle("确定")
            alertView.show()
        }
        else
        {
            startBt.setTitle("倒计时中", forState:UIControlState.Normal)
           // startBt.setTitle(<#T##title: String?##String?#>, forState: <#T##UIControlState#>)
            start=true
            timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1),target:self,selector:Selector("tickDown"),
                userInfo:nil,repeats:true)
            alertView = UIAlertView()
            alertView.title = "到计时开始"
            alertView.message = "倒计时开始，还有 \(leftTime) 秒..."
            alertView.addButtonWithTitle("确定")
            alertView.show()

        }
    }
    
    
    @IBAction func restoration(sender: UIButton) {
        if start==true
        {
            timer.invalidate()
            leftTime = 0
            min.text="0"
            sec.text="0"
            alertView = UIAlertView()
            alertView.title = "复位成功"
            alertView.addButtonWithTitle("确定")
            alertView.show()
            startBt.setTitle("开始", forState: UIControlState.Normal)
        }else
        {
            if min=="0"&&sec=="0"
            {
                
            }
            else
            {
                alertView = UIAlertView()
                alertView.title = "你还没有开始计时"
                alertView.addButtonWithTitle("确定")
                alertView.show()
            }
        }
    }
    @IBAction func stoporcontinue(sender: UIButton) {
        if start==true
        {
            stoporcon.setTitle("继续", forState: UIControlState.Normal)
            //tickDown()
            start=false
            alertView = UIAlertView()
            alertView.message = "已经暂停，还有 \(leftTime) 秒..."
            alertView.addButtonWithTitle("确定")
            alertView.show()
            a("aaa",tile: "iii")
            
            //title=("继续",forState:UIControlState.Normal)
            timer.invalidate()
            
            
        }else
        {
            stoporcon.setTitle("暂停", forState: UIControlState.Normal)
            timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1),target:self,selector:Selector("tickDown"),
                userInfo:nil,repeats:true)
            alertView = UIAlertView()
            alertView.title = "到计时开始"
            alertView.message = "倒计时开始，还有 \(leftTime) 秒..."
            alertView.addButtonWithTitle("确定")
            alertView.show()
            start=true
        }
    }
    func tickDown()
    {
        alertView.message = "倒计时开始，还有 \(leftTime) 秒..."
        if !start==false
        {
            leftTime -= 1
            print(leftTime)
            
            
            if(leftTime <= 0)
            {
                timer.invalidate()
            }
            
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alertView = UIAlertView()
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
