//
//  MainViewController.swift
//  HIAlert_Example
//
//  Created by hufan on 2020/7/13.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import HIAlert

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView : UITableView!
    let titles: Array<String> = ["普通样式", "多个按钮模式", "输入框模式"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }

    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let identifier: String? = "tableviewcell"
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier!, for: indexPath)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.textLabel?.text = self.titles[indexPath.row]
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        switch indexPath.row {
        case 0:
            HIAlert.alert("提示", "你好，我是一条提示信息", ["取消", "确认"]) { action in
                print(action.title as Any)
                if action.title == "确认"{
                    print("确认")
                    return
                }
                print("other")
            }
            break
        case 1:
            HIAlert.alert("提示", "你好，我是一条多按钮提示信息，请选择下面的选项", ["取消", "确认", "好的", "下班"]) { action in
                print(action.title as Any)
                if action.title == "确认"{
                    print("确认")
                    return
                }
                if action.title == "好的"{
                    print ("好的")
                    return;
                }
                print("other")
            }
            break
        case 2:
            HIAlert.alertInput(title: "提示", message: "请输入信息", placeholder: "placeholder", actionTitles: ["取消", "确定"]) { (action, text) in
                if action.title == "确定"{
                    print(text)
                }
            }
            break
        default:
            
            break
        }
    }
    
    //MARK:- set
    private func setTableView(){
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableviewcell")
    }
}
