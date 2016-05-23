//
//  ViewController.swift
//  jifenqi-shujuku
//
//  Created by hqq1 on 16/5/12.
//  Copyright © 2016年 hqq1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var Estop: UITextField!
    @IBOutlet weak var Efoul: UITextField!
    @IBOutlet weak var Ystop: UITextField!
    @IBOutlet weak var Yfoul: UITextField!
    @IBOutlet weak var chang: UITextField!
    @IBOutlet weak var mark1: UITextField!
    @IBOutlet weak var mark2: UITextField!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var daojishi: UILabel!
    
    var operand1:String = ""//缓存的字符串
    var operand2:String = ""
    var huan1 = 0
    var huan2 = 0
    var stop1:String = ""
    var stop2:String = ""
    var foul1:String = ""
    var foul2:String = ""
    var che1:String = ""
    var che2:String = ""
    var cc:String = ""
    var timer:NSTimer!//定时器
    var _time:Int = 720
    var isStart:Int = 0
    var timer2:NSTimer!//倒计时定时器
    var _time2:Int = 1440
    var isStart2:Int = 0
    
    
    @IBOutlet weak var jilu: UITextView!
    
    
    @IBAction func YStop(sender: UIButton) {
        var s = 0
        var result = 0
        s = Int(Ystop.text!)!
        result = s + 1
        stop1 = String(result)
        Ystop.text = stop1
    }
    
    @IBAction func YFoul(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(Yfoul.text!)!
        result = f + 1
        foul1 = String(result)
        Yfoul.text = foul1
    }
    
    @IBAction func YDel(sender: UIButton) {
        let m = Int(mark1.text!)
        let result = m! - Int(che1)!
        mark1.text = String(result)
        
    }
    
    @IBAction func EStop(sender: UIButton) {
        var s = 0
        var result = 0
        s = Int(Estop.text!)!
        result = s + 1
        stop2 = String(result)
        Estop.text = stop2
    }
    
    @IBAction func EFoul(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(Efoul.text!)!
        result = f + 1
        foul2 = String(result)
        Efoul.text = foul2
    }

    @IBAction func EDel(sender: UIButton) {
        let m = Int(mark2.text!)
        let result = m! - Int(che2)!
        mark2.text = String(result)
    }
    
    @IBAction func Ymark(sender: UIButton) {
        var m = 0
        let value = sender.currentTitle//提取每次取的值
        m = Int(mark1.text!)!
        che1 = value!
        huan1 = m + Int(value!)!
        operand1 = String(huan1)
        //operand1 = String(Int(operand1)!+Int(value!)!)
        mark1.text = operand1
        
    }
    
    @IBAction func Emark(sender: UIButton) {
        var m = 0
        let value = sender.currentTitle//提取每次取的值
        m = Int(mark2.text!)!
        che2 = value!
        huan2 = m + Int(value!)!
        operand2 = String(huan2)
        mark2.text = operand2
    }
    
    @IBAction func Changci(sender: UIButton) {
        var c = 0
        var result = 0
        c = Int(chang.text!)!
        result = c + 1
        cc = String(result)
        chang.text = cc
    }
    
    
    @IBOutlet weak var btStart: UIButton!
    
    @IBAction func start(sender: UIButton) {
        if isStart == 0{
            timer=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("tickDown"), userInfo: nil, repeats: true)
            isStart = 1
            btStart.setTitle("暂停",forState:UIControlState.Normal)
            }else{
                timer.invalidate()//停止计时器
                btStart.setTitle("开始",forState:UIControlState.Normal)
            }
    }
    func tickDown()
    {
        _time -= 1
        let sec = _time%60
        let min = _time/60
        time.text = String(min)+":"+String(sec)
    }


    @IBOutlet weak var btStart2: UIButton!

    @IBAction func jishi(sender: UIButton) {
        if isStart2 == 0{
           timer2=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("tick2Down"), userInfo: nil, repeats: true)
            isStart2 = 1
            btStart2.setTitle("暂停",forState:UIControlState.Normal)
        }else{
            timer2.invalidate()//停止计时器
            btStart2.setTitle("开始",forState:UIControlState.Normal)
        }
    }
    
    func tick2Down()
    {
        _time2 -= 1
        let sec = _time2/60
        daojishi.text = String(sec)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        //删除以前的表
        //db.execute("drop table t_userss")
        //db.execute("drop table t_users")
        //db.execute("delete from t_userss")
        //db.execute("delete from t_users")
        db.execute("create table if not exists t_user(uid integer primary key,ci varchar(20),uname varchar(20),mobile varchar(20),yifoul varchar(20),erfoul varchar(20),yistop varchar(20),erstop varchar(20))")
        //如果有数据则加载
        initUser()
        
    }
    
    
    @IBAction func reset(sender: UIButton) {
        mark1.text = "0"
        mark2.text = "0"
        Estop.text = "0"
        Efoul.text = "0"
        Ystop.text = "0"
        Yfoul.text = "0"
        chang.text = "0"
        operand1 = ""//缓存的字符串
        operand2 = ""
        huan1 = 0
        huan2 = 0
        stop1 = ""
        stop2 = ""
        foul1 = ""
        foul2 = ""
        che1 = ""
        che2 = ""
        cc = ""
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
            chang.text = user["ci"] as? String
            mark1.text = user["uname"] as? String
            mark2.text = user["mobile"] as? String
            Yfoul.text = user["yifoul"] as? String
            Efoul.text = user["erfoul"] as? String
            Ystop.text = user["yistop"] as? String
            Estop.text = user["erstop"] as? String
            //let a = user["yifoul"] as? String
            //print(a)
        }
    
        var ji:String = ""
        var lu:String = ""
            for(var i=0;i<data.count;i++){
            let user = data[i]
                let c:String = (user["ci"] as? String)!
                let m1:String = (user["uname"] as? String)!
                let m2:String = (user["mobile"] as? String)!
                let f1:String = (user["yifoul"] as? String)!
                let f2:String = (user["erfoul"] as? String)!
                let s1:String = (user["yistop"] as? String)!
                let s2:String = (user["erstop"] as? String)!
                //chang.text = c
                //mark1.text = m1
                //mark2.text = m2
                //Yfoul.text = f1
                //Efoul.text = f2
                //Ystop.text = s1
                //Estop.text = s2
                ji = "\r"+"第"+c+"场"+"Team1 比分："+m1+"  犯规:"+f1+"  暂停:"+s1
                lu = "第"+c+"场"+"Team2 比分："+m2+"  犯规:"+f2+"  暂停:"+s2
                jilu.text! += ji+"\n"+lu
              }
                //print("#####  \(data.count)")
        //print("#####")
    }
    
    //保存数据到SQLite
    func saveUser() {
        let ci = self.chang.text!
        let uname = self.mark1.text!
        let mobile = self.mark2.text!
        let yifoul = self.Yfoul.text!
        let erfoul = self.Efoul.text!
        let yistop = self.Ystop.text!
        let erstop = self.Estop.text!

        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        //let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        
        let sql = "insert into t_user(ci,uname,mobile,yifoul,erfoul,yistop,erstop) values('\(ci)','\(uname)','\(mobile)','\(yifoul)','\(erfoul)','\(yistop)','\(erstop)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}