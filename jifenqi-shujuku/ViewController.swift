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
    

    @IBOutlet weak var mark1: UITextField!
    @IBOutlet weak var mark2: UITextField!
    //@IBOutlet weak var time: UILabel!

    
    @IBOutlet weak var zhuname: UILabel!
    
    @IBOutlet weak var kename: UILabel!
    var operand1:String = ""//缓存的字符串
    var operand2:String = ""
    var huan1 = 0
    var huan2 = 0
    var che1:String = ""
    var che2:String = ""
    var cc:String = ""
    var timer:NSTimer!//定时器
    var _time:Int = 720
    //var _time:Int = 60
    var isStart:Int = 0
    var timer2:NSTimer!//倒计时定时器
    var _time2:Int = 2
    var isStart2:Int = 0
    
    
    @IBAction func YDel(sender: UIButton) {
        let m = Int(mark1.text!)
        let result = m! - Int(che1)!
        mark1.text = String(result)
        
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
    
    @IBOutlet weak var jie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        //删除以前的表
        //db.execute("drop table t_user")
        db.execute("create table if not exists t_user(uid integer primary key,ci varchar(20),uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        initUser()
        initChengyuan()
    }
    
    func initChengyuan() {
        let cydata = db.query("select * from t_chengyuan")
        if cydata.count > 0 {
            //获取最后一行数据显示
            let chengyuan = cydata[cydata.count - 1]
            zhuname.text = chengyuan["team1"] as? String
            kename.text = chengyuan["team2"] as? String
            jie.text = chengyuan["j"] as? String
        }
        
    }

    
    @IBAction func reset(sender: UIButton) {
        mark1.text = "0"
        mark2.text = "0"
        operand1 = ""//缓存的字符串
        operand2 = ""
        huan1 = 0
        huan2 = 0
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
            mark1.text = user["uname"] as? String
            mark2.text = user["mobile"] as? String
            //let a = user["yifoul"] as? String
            //print(a)
        }
        //print("#####  \(data.count)")
        //print("#####")
    }
    
    //保存数据到SQLite
    func saveUser() {
        let ci = self.jie.text!
        let uname = self.mark1.text!
        let mobile = self.mark2.text!

        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(ci,uname,mobile) values('\(ci)','\(uname)','\(mobile)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}