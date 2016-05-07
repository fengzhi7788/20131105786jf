//
//  jishiViewController.swift
//  20131105786jf
//
//  Created by fz on 16/5/7.
//  Copyright © 2016年 fz. All rights reserved.
//

import UIKit

class jishiViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var min: UITextField!
    @IBOutlet weak var sec: UITextField!
    var x:Int32=0
    var y:Int32=0
    var leftTime:Int32 = 0
    var timer:NSTimer!

    
    @IBAction func start(sender: UIButton) {
        x=60*(min.text! as NSString).intValue
        y=(sec.text! as NSString).intValue
        leftTime=x+y
        timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1),target:self,selector:Selector("tickDown"),
            userInfo:nil,repeats:true)
       

    }
    
    
    func tickDown()
    {
        
        leftTime -= 1
        print(leftTime)
        if(leftTime <= 0)
        {
            timer.invalidate()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
