//
//  Choose.swift
//  jifenqi-shujuku
//
//  Created by hqq1 on 16/5/26.
//  Copyright © 2016年 hqq1. All rights reserved.
//

import UIKit

class Choose: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var Team1: UITextField!
    
    @IBOutlet weak var YQ1: UITextField!
    
    @IBOutlet weak var YQ2: UITextField!
    
    @IBOutlet weak var YQ3: UITextField!
    
    @IBOutlet weak var YQ4: UITextField!
    
    @IBOutlet weak var YQ5: UITextField!

    @IBOutlet weak var Team2: UITextField!
    
    @IBOutlet weak var EQ1: UITextField!
    
    @IBOutlet weak var EQ2: UITextField!
    
    @IBOutlet weak var EQ3: UITextField!
    
    @IBOutlet weak var EQ4: UITextField!
    
    @IBOutlet weak var EQ5: UITextField!
    

    @IBOutlet weak var jie: UILabel!
    var j1:String = ""
    @IBAction func Jie(sender: UIButton) {
        var jstr = ""
        var result = 0
        var jtext = ""
        var jc = 0
        jtext = jie.text!
        jstr = (jtext as NSString).substringWithRange(NSMakeRange(1,1))
        //print(jstr)
        if jstr == "时"
        {
            jie.text = "第1节"
        }else
        {
            jc = Int(jstr)!
            result = jc + 1
            if result<5
            {
                j1 = String(result)
                jie.text = "第"+j1+"节"
            }else if result==5
            {
                j1 = "加时赛"
                jie.text = "加时赛"
            }
        }
    }
    
    
    
    @IBAction func Save(sender: UIButton) {
        saveChengyuan()
        
    }
    
    @IBAction func Reset(sender: UIButton) {
        Team1.text = ""
        YQ1.text = ""
        YQ2.text = ""
        YQ3.text = ""
        YQ4.text = ""
        YQ5.text = ""
        Team2.text = ""
        EQ1.text = ""
        EQ2.text = ""
        EQ3.text = ""
        EQ4.text = ""
        EQ5.text = ""
        jie.text = "第0节"
        
    }
    
    func initChengyuan() {
        let cydata = db.query("select * from t_chengyuan")
        if cydata.count > 0 {
            //获取最后一行数据显示
            let chengyuan = cydata[cydata.count - 1]
            Team1.text = chengyuan["team1"] as? String
            YQ1.text = chengyuan["yq1"] as? String
            YQ2.text = chengyuan["yq2"] as? String
            YQ3.text = chengyuan["yq3"] as? String
            YQ4.text = chengyuan["yq4"] as? String
            YQ5.text = chengyuan["yq5"] as? String
            Team2.text = chengyuan["team2"] as? String
            EQ1.text = chengyuan["eq1"] as? String
            EQ2.text = chengyuan["eq2"] as? String
            EQ3.text = chengyuan["eq3"] as? String
            EQ4.text = chengyuan["eq4"] as? String
            EQ5.text = chengyuan["eq5"] as? String
            jie.text = chengyuan["j"] as? String
        }
        
    }
    
    //保存数据到SQLite
    func saveChengyuan() {
        let team1 = self.Team1.text!
        let yq1 = self.YQ1.text!
        let yq2 = self.YQ2.text!
        let yq3 = self.YQ3.text!
        let yq4 = self.YQ4.text!
        let yq5 = self.YQ5.text!
        let team2 = self.Team2.text!
        let eq1 = self.EQ1.text!
        let eq2 = self.EQ2.text!
        let eq3 = self.EQ3.text!
        let eq4 = self.EQ4.text!
        let eq5 = self.EQ5.text!
        let j = self.jie.text!
        
        
        let cysql = "insert into t_chengyuan(team1,yq1,yq2,yq3,yq4,yq5,team2,eq1,eq2,eq3,eq4,eq5,j) values('\(team1)','\(yq1)','\(yq2)','\(yq3)','\(yq4)','\(yq5)','\(team2)','\(eq1)','\(eq2)','\(eq3)','\(eq4)','\(eq5)','\(j)')"
        print("cysql: \(cysql)")
        //通过封装的方法执行sql
        let cyresult = db.execute(cysql)
        print(cyresult)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        //db.execute("drop table t_chengyuan")
        db.execute("create table if not exists t_chengyuan(uid integer primary key,team1 varchar(20),yq1 varchar(20),yq2 varchar(20),yq3 varchar(20),yq4 varchar(20),yq5 varchar(20),team2 varchar(20),eq1 varchar(20),eq2 varchar(20),eq3 varchar(20),eq4 varchar(20),eq5 varchar(20),j varchar(20))")
        //如果有数据则加载
        initChengyuan()
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}