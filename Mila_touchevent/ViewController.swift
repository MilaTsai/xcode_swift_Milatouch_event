//
//  ViewController.swift
//  Mila_touchevent
//
//  Created by 蔡孟軒 on 2017/10/22.
//  Copyright © 2017年 Mila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    var tt: Date = Date()
    var TT = String()
    
    var ttfilename: Date = Date()

    var valueArray = Array<String>()
  
    var GuestureData = Array<String>()
   
    var fin = Array<String>()
   
    var fintime = Array<String>()
   
    var pointstring = String()
  
    var finstring = String()

    var timestring = String()
 
    var rememberData = false
   
    var rememtime = false
   
    var dotimes = 1
    
   
    @IBOutlet var Start: UIBarButtonItem!
 
    @IBOutlet var Next: UIBarButtonItem!

    @IBOutlet var DoTimes: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.isMultipleTouchEnabled = true
         //Next.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func startClick(_ sender: UIBarButtonItem) {
        
        //Next.isEnabled = true
        //Start.isEnabled = false
        
        DoTimes.text = "請重複手勢10次"
        rememberData = true
       
        GuestureData.removeAll()
        valueArray.removeAll()
        fin.removeAll()
        
        
        ttfilename = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //TTfilename = formatter.string(from: ttfilename)
    }
    
    @IBAction func nextClick(_ sender: UIBarButtonItem) {
        let Count = valueArray.count
        print(Count)
        if Count>0 {
            
            /*for a in stride(from: 0, to: 10, by: 2) {
             print("[", terminator: "");
             if (a%10)==9 {
             print(valueArray[a], terminator: "]\n");
             }
             else {
             print(valueArray[a], terminator: "],");
             }
             }*/
            
            var maxA=0
            var secA = 0
            var AnsCount=0.0
            var dis = 0.0
            var a=0
            var b=0
            var c=0
            var d=0
            var e=0
            
            
            for a in stride(from: 0, to: 10, by: 2) {
                
                var TotalAns = 0.0
                let GX = Double(valueArray[a])
                let GY = Double(valueArray[a+1])
                
                for b in stride(from: 0, to: 10, by: 2) {
                    let CountX = Double(valueArray[b])
                    let CountY = Double(valueArray[b+1])
                    AnsCount = sqrt(pow(CountX!-GX!, 2)+pow(CountY!-GY!, 2))
                    TotalAns = TotalAns + AnsCount
                
                }
                if dis < TotalAns {
                    dis = TotalAns;
                    maxA = a;
                }
            }
           
            GuestureData.append(String(valueArray[maxA]))
            GuestureData.append(String(valueArray[maxA+1]))
            
            for a in stride(from: 0, to: 6, by: 2) {
                dis = 1000.0
                
                let GX = Double(GuestureData[a])
                let GY = Double(GuestureData[a+1])
                
                for b in stride(from: 0, to: 10, by: 2){
                    let CountX = Double(valueArray[b])
                    let CountY = Double(valueArray[b+1])
                    AnsCount = sqrt(pow(CountX!-GX!, 2)+pow(CountY!-GY!, 2))
                    
                    if AnsCount != 0 {
                        if dis > AnsCount {
                            dis = AnsCount
                            secA = maxA
                            maxA = b
                          }
                    }
                }
                
                if a != 0 {
                    if GuestureData[a-2] == valueArray[maxA] {
                        maxA = secA
                    }
                }
                GuestureData.append(String(valueArray[maxA]))
                GuestureData.append(String(valueArray[maxA+1]))
            }
            
            for a in stride(from: 0, to: 6, by: 2) {
                if GuestureData.contains(valueArray[a]) {
                    continue;
                }
                else {
                    maxA = a;
                }
            }
            GuestureData.append(String(valueArray[maxA]))
            GuestureData.append(String(valueArray[maxA+1]))
            
            //print(GuestureData)
            
          
             for a in stride(from: 0, to: (Count-10), by: 2){
                let GX = Double(GuestureData[a])
                let GY = Double(GuestureData[a+1])
                var dis:Double = 1000
                let countA = (a/10)+1
                var countB = 0
                
                for b in stride(from: 0, to: 10, by: 2) {
                    let CountX = Double(valueArray[(countA*10)+b])
                    let CountY = Double(valueArray[(countA*10)+b+1])
                    let AnsCount = sqrt(pow(CountX!-GX!, 2)+pow(CountY!-GY!, 2))
                    
                    //找最近的
                    if AnsCount != 0 {
                        if dis > AnsCount {
                            dis = AnsCount
                            countB = (countA*10)+b
                        }
                    }
                }
                GuestureData.append(String(valueArray[countB]))
                GuestureData.append(String(valueArray[countB+1]))
                
            }
            
           
            for c in stride(from: 0, to: (Count/10), by: 2){
             
                
                
                for a in stride(from: 0, to: 8, by: 2) {
                    let GX = Double(GuestureData[c*10+a])
                    let GY = Double(GuestureData[c*10+a+1])
                    var CountX = 0.0
                    var CountY = 0.0
                    
                  
                    for b in stride(from: 0, to: 10, by: 2) {
                        CountX = Double(GuestureData[c*10+b])!
                        CountY = Double(GuestureData[c*10+b+1])!
                        AnsCount = sqrt(pow(CountX-GX!, 2)+pow(CountY-GY!, 2))
                        fin.append(String(AnsCount))
                      
                    }
                }
             
                
                
               for d in stride(from: 0, to: 10, by: 2){
                    let GX = Double(GuestureData[c*10+d])
                    let GY = Double(GuestureData[c*10+d+1])
                    var CountX = 0.0
                    var CountY = 0.0
                    var CountX1 = 0.0
                    var CountY1 = 0.0
                    var AnsCount1 = 0.0
                    
                    if c+1 != Count/10 {
                        
                        if d==8 {
                            CountX = Double(GuestureData[c*10+d+8])!
                            CountY = Double(GuestureData[c*10+d+9])!
                            CountX1 = Double(GuestureData[c*10+d+2])!
                            CountY1 = Double(GuestureData[c*10+d+3])!
                        }
                        else if d==0 {
                            CountX = Double(GuestureData[c*10+18])!
                            CountY = Double(GuestureData[c*10+19])!
                            CountX1 = Double(GuestureData[c*10+d+12])!
                            CountY1 = Double(GuestureData[c*10+d+13])!
                        }
                        else {
                            CountX = Double(GuestureData[c*10+d+8])!
                            CountY = Double(GuestureData[c*10+d+9])!
                            CountX1 = Double(GuestureData[c*10+d+12])!
                            CountY1 = Double(GuestureData[c*10+d+13])!
                        }
                        
                        AnsCount = sqrt(pow(CountX-GX!, 2)+pow(CountY-GY!, 2))
                        AnsCount1 = sqrt(pow(CountX1-GX!, 2)+pow(CountY1-GY!, 2))
                        fin.append(String(AnsCount))
                        fin.append(String(AnsCount1))
                    }
                    else {
                        
                        for d in stride(from: 0, to: 2, by: 2) {
                            fin.append(String(0))
                        }
                    }
                }
            }
          
            pointstring = GuestureData.joined(separator: ",")
            finstring = fin.joined(separator: ",")
            timestring = fintime.joined(separator: ",")
            
            print(GuestureData[0],GuestureData[1])
            print(fin)
            print(fintime)
            

            func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
            func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                //let touchcount = touches.count
                if rememberData == true {
                    for touch in touches {
                        //let num = touch.force 壓力
                        if touches.count == 5 {
                            //座標
                            let location = touch.location(in: self.view)
                            let X=Int(location.x)
                            let Y=Int(location.y)
                            
                            //時間
                            tt = Date()
                            let formatter = DateFormatter()
                            formatter.dateFormat = "ss.SSS"
                            TT = formatter.string(from: tt)
                            
                            valueArray.append(String(X))
                            valueArray.append(String(Y))
                            
                            rememtime = true
                        }
                    }
                    if rememtime == true {
                        fintime.append(TT)
                        rememtime = false
                    }
                }
            }
    
            func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
                if rememberData == true {
                    for touch in touches {
                        if touches.count == 5 {
                            //座標
                            let location = touch.location(in: self.view)
                            let X=Int(location.x)
                            let Y=Int(location.y)
                            //時間
                            tt = Date()
                            let formatter = DateFormatter()
                            formatter.dateFormat = "ss.SSS"
                            TT = formatter.string(from: tt)
                            
                            valueArray.append(String(X))
                            valueArray.append(String(Y))
                            
                            rememtime = true
                        }
                    }
                    if rememtime == true {
                        fintime.append(TT)
                        rememtime = false
                    }
                }
            }
    
    
        func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 5{
            
            if rememberData == true {
                for touch in touches {
                    if touches.count == 5 {
                        //座標
                        let location = touch.location(in: self.view)
                        let X=Int(location.x)
                        let Y=Int(location.y)
                        //時間
                        tt = Date()
                        let formatter = DateFormatter()
                        formatter.dateFormat = "ss.SSS"
                        TT = formatter.string(from: tt)
                        
                        valueArray.append(String(X))
                        valueArray.append(String(Y))
                        
                        rememtime = true
                    }
                }
                if rememtime == true {
                    fintime.append(TT)
                    rememtime = false
                }
            }
        }
    }
            
    
            func wait() {
                RunLoop.current.run(mode: RunLoopMode.defaultRunLoopMode, before: Date(timeIntervalSinceNow: 0.05))
            }
}

  }
 }

