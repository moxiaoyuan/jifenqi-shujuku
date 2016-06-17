//
//  Sql.swift
//  jifenqi-shujuku
//
//  Created by hqq1 on 16/5/26.
//  Copyright © 2016年 hqq1. All rights reserved.
//

import UIKit

class Sql: UIViewController {
    
    
    @IBOutlet weak var cyfoultable: UITextView!
    @IBOutlet weak var foultable: UITextView!
    @IBOutlet weak var stoptable: UITextView!
    
    @IBOutlet weak var cyfoultable2: UITextView!
    @IBOutlet weak var table: UITextView!
    var db:SQLiteDB!
    var Team1:String = ""
    var YQ1:String = ""
    var YQ2:String = ""
    var YQ3:String = ""
    var YQ4:String = ""
    var YQ5:String = ""
    var Team2:String = ""
    var EQ1:String = ""
    var EQ2:String = ""
    var EQ3:String = ""
    var EQ4:String = ""
    var EQ5:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        //如果有数据则加载
        initChengyuan()
        initUser()
        initFoul()
        initStop()
    }
    
    func initChengyuan() {
        let cydata = db.query("select * from t_chengyuan")
        if cydata.count > 0 {
            //获取最后一行数据显示
            let chengyuan = cydata[cydata.count - 1]
            Team1 = (chengyuan["team1"] as? String)!
            YQ1 = (chengyuan["yq1"] as? String)!
            YQ2 = (chengyuan["yq2"] as? String)!
            YQ3 = (chengyuan["yq3"] as? String)!
            YQ4 = (chengyuan["yq4"] as? String)!
            YQ5 = (chengyuan["yq5"] as? String)!
            Team2 = (chengyuan["team2"] as? String)!
            EQ1 = (chengyuan["eq1"] as? String)!
            EQ2 = (chengyuan["eq2"] as? String)!
            EQ3 = (chengyuan["eq3"] as? String)!
            EQ4 = (chengyuan["eq4"] as? String)!
            EQ5 = (chengyuan["eq5"] as? String)!
        }
    }
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
        var ji:String = ""
        for(var i=0;i<data.count;i++){
            let user = data[i]
            let m1:String = (user["uname"] as? String)!
            let m2:String = (user["mobile"] as? String)!
            let c:String = (user["ci"] as? String)!
            ji = c+Team1+"比分："+m1+"  "+Team2+"比分："+m2;
            table.text! += ji+"\r"
        }
    }
    
    func initFoul() {
        let fdata = db.query("select * from t_foul")
        var jilu:String = ""
        var y:String = ""
        var e:String = ""
        for(var i=0;i<fdata.count;i++){
            let foul = fdata[i]
            let j = (foul["j"] as? String)!
            let YQM:String = (foul["yqf"] as? String)!
            let EQM:String = (foul["eqf"] as? String)!
            jilu = j+Team1+"犯规："+YQM+"  "+Team2+"犯规："+EQM
            foultable.text! += jilu+"\r"
            
        }
        if fdata.count > 0 {
            //获取最后一行数据显示
            let foul = fdata[fdata.count - 1]
            let j = (foul["j"] as? String)!
            let Y1:String = (foul["yqf1"] as? String)!
            let Y2:String = (foul["yqf2"] as? String)!
            let Y3:String = (foul["yqf3"] as? String)!
            let Y4:String = (foul["yqf4"] as? String)!
            let Y5:String = (foul["yqf5"] as? String)!
            let E1:String = (foul["eqf1"] as? String)!
            let E2:String = (foul["eqf2"] as? String)!
            let E3:String = (foul["eqf3"] as? String)!
            let E4:String = (foul["eqf4"] as? String)!
            let E5:String = (foul["eqf5"] as? String)!
            y = j+"\r"+Team1+"队成员："+"\r"+YQ1+"犯规："+Y1+"\r"+YQ2+"犯规："+Y2+"\r"+YQ3+"犯规："+Y3+"\r"+YQ4+"犯规："+Y4+"\r"+YQ5+"犯规："+Y5
            e = j+"\r"+Team2+"队成员："+"\r"+EQ1+"犯规："+E1+"\r"+EQ2+"犯规："+E2+"\r"+EQ3+"犯规："+E3+"\r"+EQ4+"犯规："+E4+"\r"+EQ5+"犯规："+E5
            cyfoultable.text! += y
            cyfoultable2.text! += e
        }

    }
    
    func initStop() {
        let sdata = db.query("select * from t_stop")
        var ji:String = ""
        var lu:String = ""
        for(var i=0;i<sdata.count;i++){
            let stop = sdata[i]
            let j:String = (stop["j"] as? String)!
            let Ystop:String = (stop["ydstop"] as? String)!
            let YCstop:String = (stop["ycstop"] as? String)!
            let Estop:String = (stop["edstop"] as? String)!
            let ECstop:String = (stop["ecstop"] as? String)!
            ji = j+Team1+"短停:"+Ystop+"  "+"长停:"+YCstop
            lu = "  "+Team2+"短停:"+Estop+"  "+"长停:"+ECstop
            stoptable.text! += ji+lu+"\r"
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}