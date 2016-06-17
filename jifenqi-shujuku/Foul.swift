//
//  Foul.swift
//  jifenqi-shujuku
//
//  Created by hqq1 on 16/5/26.
//  Copyright © 2016年 hqq1. All rights reserved.
//

import UIKit

class Foul: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var YTeam: UILabel!
    
    @IBOutlet weak var ETeam: UILabel!
    
    @IBOutlet weak var YQM1: UILabel!
    
    @IBOutlet weak var YQM2: UILabel!
    
    @IBOutlet weak var YQM3: UILabel!
    
    @IBOutlet weak var YQM4: UILabel!
    
    @IBOutlet weak var YQM5: UILabel!
    
    @IBOutlet weak var YQM: UILabel!
    
    @IBOutlet weak var EQM: UILabel!
    
    @IBOutlet weak var EQM1: UILabel!
    
    @IBOutlet weak var EQM2: UILabel!
    
    @IBOutlet weak var EQM3: UILabel!
    
    @IBOutlet weak var EQM4: UILabel!
    
    @IBOutlet weak var EQM5: UILabel!
    
    @IBOutlet weak var yq1: UILabel!

    @IBOutlet weak var yq2: UILabel!

    @IBOutlet weak var yq3: UILabel!

    @IBOutlet weak var yq4: UILabel!
    
    @IBOutlet weak var yq5: UILabel!
    
    @IBOutlet weak var eq1: UILabel!

    @IBOutlet weak var eq2: UILabel!

    @IBOutlet weak var eq3: UILabel!
    
    @IBOutlet weak var eq4: UILabel!
    
    @IBOutlet weak var eq5: UILabel!
    
    
    
    var Yqf1:String = ""
    
    @IBAction func Yq1(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(YQM1.text!)!
        result = f + 1
        Yqf1 = String(result)
        YQM1.text = Yqf1
        YQM.text = String(Int(YQM.text!)!+1)
    }
    
    var Yqf2:String = ""
    @IBAction func Yq2(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(YQM2.text!)!
        result = f + 1
        Yqf2 = String(result)
        YQM2.text = Yqf2
        YQM.text = String(Int(YQM.text!)!+1)
    }
    
    var Yqf3:String = ""
    @IBAction func Yq3(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(YQM3.text!)!
        result = f + 1
        Yqf3 = String(result)
        YQM3.text = Yqf3
        YQM.text = String(Int(YQM.text!)!+1)
    }
    
    var Yqf4:String = ""
    @IBAction func Yq4(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(YQM4.text!)!
        result = f + 1
        Yqf4 = String(result)
        YQM4.text = Yqf4
        YQM.text = String(Int(YQM.text!)!+1)
    }
    
    var Yqf5:String = ""
    @IBAction func Yq5(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(YQM5.text!)!
        result = f + 1
        Yqf5 = String(result)
        YQM5.text = Yqf5
        YQM.text = String(Int(YQM.text!)!+1)
    }
    
    var Eqf1:String = ""
    @IBAction func Eq1(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(EQM1.text!)!
        result = f + 1
        Eqf1 = String(result)
        EQM1.text = Eqf1
        EQM.text = String(Int(EQM.text!)!+1)
    }
    
    var Eqf2:String = ""
    @IBAction func Eq2(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(EQM2.text!)!
        result = f + 1
        Eqf2 = String(result)
        EQM2.text = Eqf2
        EQM.text = String(Int(EQM.text!)!+1)
    }
    
    var Eqf3:String = ""
    @IBAction func Eq3(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(EQM3.text!)!
        result = f + 1
        Eqf3 = String(result)
        EQM3.text = Eqf3
        EQM.text = String(Int(EQM.text!)!+1)
    }
    
    var Eqf4:String = ""
    @IBAction func Eq4(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(EQM4.text!)!
        result = f + 1
        Eqf4 = String(result)
        EQM4.text = Eqf4
        EQM.text = String(Int(EQM.text!)!+1)
    }
    
    var Eqf5:String = ""
    @IBAction func Eq5(sender: UIButton) {
        var f = 0
        var result = 0
        f = Int(EQM5.text!)!
        result = f + 1
        Eqf5 = String(result)
        EQM5.text = Eqf5
        EQM.text = String(Int(EQM.text!)!+1)
    }
 
    @IBOutlet weak var jie: UILabel!
    var j:String = ""
    
    
    
    @IBAction func FoulSave(sender: UIButton) {
        saveFoul()
    }
    
    func saveFoul() {
        let yqf = self.YQM.text!
        let yqf1 = self.YQM1.text!
        let yqf2 = self.YQM2.text!
        let yqf3 = self.YQM3.text!
        let yqf4 = self.YQM4.text!
        let yqf5 = self.YQM5.text!
        let eqf = self.EQM.text!
        let eqf1 = self.EQM1.text!
        let eqf2 = self.EQM2.text!
        let eqf3 = self.EQM3.text!
        let eqf4 = self.EQM4.text!
        let eqf5 = self.EQM5.text!
        let j = self.jie.text!
        
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let foulsql = "insert into t_foul(j,yqf,yqf1,yqf2,yqf3,yqf4,yqf5,eqf,eqf1,eqf2,eqf3,eqf4,eqf5) values('\(j)','\(yqf)','\(yqf1)','\(yqf2)','\(yqf3)','\(yqf4)','\(yqf5)','\(eqf)','\(eqf1)','\(eqf2)','\(eqf3)','\(eqf4)','\(eqf5)')"
        print("foulsql: \(foulsql)")
        //通过封装的方法执行sql
        let result = db.execute(foulsql)
        print(result)
    }

    
    @IBAction func FoulReset(sender: UIButton) {
        YQM.text = "0"
        YQM1.text = "0"
        YQM2.text = "0"
        YQM3.text = "0"
        YQM4.text = "0"
        YQM5.text = "0"
        EQM.text = "0"
        EQM1.text = "0"
        EQM2.text = "0"
        EQM3.text = "0"
        EQM4.text = "0"
        EQM5.text = "0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //db.execute("drop table t_foul")
        db.execute("create table if not exists t_foul(uid integer primary key,j varchar(20),yqf varchar(20),yqf1 varchar(20),yqf2 varchar(20),yqf3 varchar(20),yqf4 varchar(20),yqf5 varchar(20),eqf varchar(20),eqf1 varchar(20),eqf2 varchar(20),eqf3 varchar(20),eqf4 varchar(20),eqf5 varchar(20))")
        
        //如果有数据则加载
        initChengyuan()
        initFoul()
    }
    func initChengyuan() {
        let cydata = db.query("select * from t_chengyuan")
        if cydata.count > 0 {
            //获取最后一行数据显示
            let chengyuan = cydata[cydata.count - 1]
            jie.text = chengyuan["j"] as? String
            YTeam.text = chengyuan["team1"] as? String
            yq1.text = chengyuan["yq1"] as? String
            yq2.text = chengyuan["yq2"] as? String
            yq3.text = chengyuan["yq3"] as? String
            yq4.text = chengyuan["yq4"] as? String
            yq5.text = chengyuan["yq5"] as? String
            ETeam.text = chengyuan["team2"] as? String
            eq1.text = chengyuan["eq1"] as? String
            eq2.text = chengyuan["eq2"] as? String
            eq3.text = chengyuan["eq3"] as? String
            eq4.text = chengyuan["eq4"] as? String
            eq5.text = chengyuan["eq5"] as? String
        }
        
    }
    
    func initFoul() {
        let fdata = db.query("select * from t_foul")
        if fdata.count > 0 {
            //获取最后一行数据显示
            let foul = fdata[fdata.count - 1]
            YQM.text = foul["yqf"] as? String
            YQM1.text = foul["yqf1"] as? String
            YQM2.text = foul["yqf2"] as? String
            YQM3.text = foul["yqf3"] as? String
            YQM4.text = foul["yqf4"] as? String
            YQM5.text = foul["yqf5"] as? String
            EQM.text = foul["eqf"] as? String
            EQM1.text = foul["eqf1"] as? String
            EQM2.text = foul["eqf2"] as? String
            EQM3.text = foul["eqf3"] as? String
            EQM4.text = foul["eqf4"] as? String
            EQM5.text = foul["eqf5"] as? String
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}