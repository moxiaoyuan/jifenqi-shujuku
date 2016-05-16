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
    //@IBOutlet weak var btn: UITextField!
    
    
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
        c = Int(Ystop.text!)!
        result = c + 1
        cc = String(result)
        chang.text = cc
    }
    
    @IBAction func start(sender: UIButton) {
        
    }
    
    @IBAction func jishi(sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_users(uid integer primary key,uname varchar(20),mobile varchar(20),yifoul varchar(20),erfoul varchar(20),yistop varchar(20),erstop varchar(20))")
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
    }
    
    
    //点击保存
    @IBAction func saveClicked(sender: AnyObject) {
        saveUsers()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_users")
        if data.count > 0 {
            //获取最后一行数据显示
            let users = data[data.count - 1]
            mark1.text = users["uname"] as? String
            mark2.text = users["mobile"] as? String
            Yfoul.text = users["yifoul"] as? String
            Efoul.text = users["erfoul"] as? String
            Ystop.text = users["yistop"] as? String
            Estop.text = users["erstop"] as? String
            let a = users["yifoul"] as? String
            print(a)

        }
        print("#####  \(data.count)")
        print(data)
            }
    
    //保存数据到SQLite
    func saveUsers() {
        let uname = self.mark1.text!
        let mobile = self.mark2.text!
        let yifoul = self.Yfoul.text!
        let erfoul = self.Efoul.text!
        let yistop = self.Ystop.text!
        let erstop = self.Estop.text!

        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        //let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        let sql = "insert into t_users(uname,mobile,yifoul,erfoul,yistop,erstop) values('\(uname)','\(mobile)','\(yifoul)','\(erfoul)','\(yistop)','\(erstop)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}