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
    
    
    @IBAction func YStop(sender: UIButton) {
        stop1 = String(Int(stop1)!+1)
        Ystop.text = stop1
    }
    
    @IBAction func YFoul(sender: UIButton) {
        foul1 = String(Int(foul1)!+1)
        Yfoul.text = foul1
    }
    
    @IBAction func YDel(sender: UIButton) {
        mark1.text = che1
    }
    
    @IBAction func EStop(sender: UIButton) {
        stop2 = String(Int(stop2)!+1)
        Estop.text = stop2
    }
    
    @IBAction func EFoul(sender: UIButton) {
        foul2 = String(Int(foul2)!+1)
        Yfoul.text = foul2
    }
    
    @IBAction func EDel(sender: UIButton) {
        mark1.text = che2
    }
    
    @IBAction func Ymark(sender: UIButton) {
        let value = sender.currentTitle//提取每次取的值
        che1 = value!
        operand1 = String(Int(operand1)!+Int(value!)!)
        mark1.text = operand1
    }
    
    @IBAction func Emark(sender: UIButton) {
        let value = sender.currentTitle//提取每次取的值
        che2 = value!
        operand2 = String(Int(operand2)!+Int(value!)!)
        //huancun2 = huancun2+Int(value!)!
        //operand2 = String(huancun2)
        mark2.text = operand2
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
            mark1.text = user["uname"] as? String
            mark2.text = user["mobile"] as? String
        }
    }
    
    //保存数据到SQLite
    func saveUser() {
        let uname = self.mark1.text!
        let mobile = self.mark2.text!
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