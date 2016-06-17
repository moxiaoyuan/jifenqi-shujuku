//
//  Jishi.swift
//  jifenqi-shujuku
//
//  Created by hqq1 on 16/5/26.
//  Copyright © 2016年 hqq1. All rights reserved.
//

import UIKit

class Jishi: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet weak var SaiTime: UILabel!
    
    @IBOutlet weak var StopTime: UILabel!
    
    @IBOutlet weak var Time24s: UILabel!
    
    var ChangDing:NSTimer!//倒计时定时器
    var Ctimesec:Int = 720
    //var Ctimesec:Int = 61
    var ChangClick:Int = 0
    
    @IBOutlet weak var ChangGui: UIButton!
    
    @IBAction func ChangGuiTime(sender: UIButton) {
        var cgt = ""
        if ChangClick == 0{
            ChangDing=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("changguiDown"), userInfo: nil, repeats: true)
            ChangClick = 1
            ChangGui.setTitle("常规赛暂停",forState:UIControlState.Normal)
        }else if ChangClick==1
        {
            cgt = SaiTime.text!
            if cgt == "0:0"
            {
                ChangDing.invalidate()//停止计时器
                ChangGui.setTitle("常规赛",forState:UIControlState.Normal)
                ChangClick=0
                Ctimesec = 720
                SaiTime.text! = "12:00"
            }else{
                ChangDing.invalidate()//停止计时器
                ChangGui.setTitle("常规赛",forState:UIControlState.Normal)
                ChangClick=0
            }
        }

    }
    func changguiDown()
    {
        if Ctimesec>0{
            Ctimesec -= 1
            let sec = Ctimesec%60
            let min = Ctimesec/60
            SaiTime.text = String(min)+":"+String(sec)}
    }
    
    var AddDing:NSTimer!//倒计时定时器
    var Addtimesec:Int = 300
    //var Addtimesec:Int = 65
    var AddClick:Int = 0


    @IBOutlet weak var Add: UIButton!
    @IBAction func AddTime(sender: UIButton) {
        var adt = "0"
        if AddClick == 0
        {
            AddDing=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("addDown"), userInfo: nil, repeats: true)
            AddClick = 1
            Add.setTitle("加时赛暂停",forState:UIControlState.Normal)
        }else if AddClick==1
        {
            adt = SaiTime.text!
            if adt == "0:0"
            {
                AddDing.invalidate()//停止计时器
                Add.setTitle("加时赛",forState:UIControlState.Normal)
                AddClick=0
                Addtimesec = 300
                SaiTime.text! = "5:0"
            }else{
                AddDing.invalidate()//停止计时器
                Add.setTitle("加时赛",forState:UIControlState.Normal)
                AddClick=0
            }
        }
    }
    func addDown()
    {
        if Addtimesec>0{
            Addtimesec -= 1
            let sec = Addtimesec%60
            let min = Addtimesec/60
            SaiTime.text = String(min)+":"+String(sec)}
    }

    
    
    @IBOutlet weak var times: UIButton!
    var TimeDing:NSTimer!//倒计时定时器
    var timesec:Int = 24
    var TimeClick:Int = 0
    
    @IBAction func TIME24s(sender: UIButton) {
        var tt = ""
        if TimeClick == 0
        {
            TimeDing=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timeDown"), userInfo: nil, repeats: true)
                TimeClick = 1
                times.setTitle("24秒暂停",forState:UIControlState.Normal)
        }else if TimeClick==1
        {
            tt = Time24s.text!
            if tt == "0"
            {
                TimeDing.invalidate()//停止计时器
                times.setTitle("24秒计时",forState:UIControlState.Normal)
                TimeClick=0
                timesec = 24
                Time24s.text! = "24"
            }else{
            TimeDing.invalidate()//停止计时器
            times.setTitle("24秒计时",forState:UIControlState.Normal)
            TimeClick=0
            }
        }

    }
    
    func timeDown()
    {
        
        if timesec>0{
            timesec -= 1
            let sec = timesec
            Time24s.text = String(sec)}
    }
    
    var stopDing:NSTimer!//倒计时定时器
    var stoptimesec:Int = 20
    var stopClick:Int = 0

    @IBOutlet weak var stop20s: UIButton!
    @IBAction func Stop20s(sender: UIButton) {
        var st = ""
        if stopClick == 0
        {
            stopDing=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("stopDown"), userInfo: nil, repeats: true)
            stopClick = 1
            stop20s.setTitle("短stop",forState:UIControlState.Normal)
            if ChangClick == 1
            {
            ChangDing.invalidate()//停止计时器
            ChangGui.setTitle("常规赛",forState:UIControlState.Normal)
                ChangClick=0
            }else if AddClick == 1{
                AddDing.invalidate()//停止计时器
                Add.setTitle("加时赛",forState:UIControlState.Normal)
                AddClick=0
            }
        }else if stopClick==1
        {
            st = StopTime.text!
            if st == "0"
            {
                stopDing.invalidate()//停止计时器
                stop20s.setTitle("短暂停",forState:UIControlState.Normal)
                stopClick=0
                stoptimesec = 20
                StopTime.text! = "20"
            }else{
                stopDing.invalidate()//停止计时器
                stop20s.setTitle("短暂停",forState:UIControlState.Normal)
                stopClick=0
            }
        }
        
    }
    
    func stopDown()
    {
        
        if stoptimesec>0{
            stoptimesec -= 1
            let sec = stoptimesec
            StopTime.text = String(sec)}
    }

   
    var CstopDing:NSTimer!//倒计时定时器
    var Cstoptimesec:Int = 100
    var CstopClick:Int = 0
    @IBOutlet weak var cstop: UIButton!
    @IBAction func Cstop(sender: UIButton) {
        var st = ""
        if CstopClick == 0
        {
            CstopDing=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("CstopDown"), userInfo: nil, repeats: true)
            CstopClick = 1
            cstop.setTitle("长stop",forState:UIControlState.Normal)
            if ChangClick == 1
            {
                ChangDing.invalidate()//停止计时器
                ChangGui.setTitle("常规赛",forState:UIControlState.Normal)
                ChangClick=0
            }else if AddClick == 1{
                AddDing.invalidate()//停止计时器
                Add.setTitle("加时赛",forState:UIControlState.Normal)
                AddClick=0
            }
        }else if CstopClick==1
        {
            st = StopTime.text!
            if st == "0"
            {
                CstopDing.invalidate()//停止计时器
                cstop.setTitle("常规暂停",forState:UIControlState.Normal)
                CstopClick=0
                Cstoptimesec = 100
                StopTime.text! = "100"
            }else{
                CstopDing.invalidate()//停止计时器
                cstop.setTitle("常规暂停",forState:UIControlState.Normal)
                CstopClick=0
            }
        }
        
    }
    
    func CstopDown()
    {
        
        if Cstoptimesec>0{
            Cstoptimesec -= 1
            let sec = Cstoptimesec
            StopTime.text = String(sec)}
    }

    
    
    @IBOutlet weak var Ystop: UILabel!
    var stop1:String = ""
    
    @IBOutlet weak var YCstop: UILabel!
    var cstop1:String = ""

    @IBOutlet weak var Estop: UILabel!
    var stop2:String = ""

    @IBOutlet weak var ECstop: UILabel!
    var cstop2:String = ""

    @IBAction func YStop(sender: UIButton) {
        var s = 0
        var result = 0
        s = Int(Ystop.text!)!
        result = s + 1
        stop1 = String(result)
        Ystop.text = stop1
    }
    
    @IBAction func YCStop(sender: UIButton) {
        var s = 0
        var result = 0
        s = Int(YCstop.text!)!
        result = s + 1
        cstop1 = String(result)
        YCstop.text = cstop1
    }
    
    @IBAction func EStop(sender: UIButton) {
        var s = 0
        var result = 0
        s = Int(Estop.text!)!
        result = s + 1
        stop2 = String(result)
        Estop.text = stop2
    }
    
    @IBAction func ECStop(sender: UIButton) {
        var s = 0
        var result = 0
        s = Int(ECstop.text!)!
        result = s + 1
        cstop2 = String(result)
        ECstop.text = cstop2
    }
    
    @IBOutlet weak var jie: UILabel!
    
    
    @IBAction func JishiReset(sender: UIButton) {
        SaiTime.text = "比赛时间"
        Time24s.text = "24"
        StopTime.text = "暂停时间"
        Ystop.text = "0"
        YCstop.text = "0"
        Estop.text = "0"
        ECstop.text = "0"
        
        if ChangClick == 1{
            ChangDing.invalidate()
            ChangGui.setTitle("常规赛",forState:UIControlState.Normal)
        }
        Ctimesec = 720
        ChangClick = 0
        
        if AddClick == 1{
            AddDing.invalidate()
            Add.setTitle("加时赛",forState:UIControlState.Normal)
        }
        Addtimesec = 300
        AddClick = 0
        
        if TimeClick == 1{
            TimeDing.invalidate()
            times.setTitle("24秒计时",forState:UIControlState.Normal)
        }
        timesec = 24
        TimeClick = 0
        
        if stopClick == 1{
            stopDing.invalidate()
            stop20s.setTitle("短暂停",forState:UIControlState.Normal)
        }
        stoptimesec = 20
        stopClick = 0
        
        if CstopClick == 1{
            CstopDing.invalidate()
            cstop.setTitle("常规暂停",forState:UIControlState.Normal)
        }
        Cstoptimesec = 100
        CstopClick = 0
    
        stop1 = ""
        cstop1 = ""
        stop2 = ""
        cstop2 = ""
    }
    
    
    @IBAction func StopSave(sender: UIButton) {
        saveStop()
    }
    
    func saveStop() {
        let j = self.jie.text!
        let ydstop = self.Ystop.text!
        let ycstop = self.YCstop.text!
        let edstop = self.Estop.text!
        let ecstop = self.ECstop.text!
        
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let stopsql = "insert into t_stop(j,ydstop,ycstop,edstop,ecstop) values('\(j)','\(ydstop)','\(ycstop)','\(edstop)','\(ecstop)')"
        print("stopsql: \(stopsql)")
        //通过封装的方法执行sql
        let result = db.execute(stopsql)
        print(result)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //db.execute("drop table t_stop")
        db.execute("create table if not exists t_stop(uid integer primary key,j varchar(20),ydstop varchar(20),ycstop varchar(20),edstop varchar(20),ecstop varchar(20))")
        //如果有数据则加载
        initStop()
        initChengyuan()
    }
    
    func initStop() {
        let sdata = db.query("select * from t_stop")
        if sdata.count > 0 {
            //获取最后一行数据显示
            let stop = sdata[sdata.count - 1]
            Ystop.text = stop["ydstop"] as? String
            YCstop.text = stop["ycstop"] as? String
            Estop.text = stop["edstop"] as? String
            ECstop.text = stop["ecstop"] as? String
        }
        
    }
    func initChengyuan() {
        let cydata = db.query("select * from t_chengyuan")
        if cydata.count > 0 {
            //获取最后一行数据显示
            let chengyuan = cydata[cydata.count - 1]
            jie.text = chengyuan["j"] as? String
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}