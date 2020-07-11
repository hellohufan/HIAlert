//
//  HIAlert.swift
//  HIAlert
//
//  Created by hufan on 2020/6/16.
//

import Foundation
import UIKit

public class HIAlert: HIAlertView {
    
    override init(style: HIAlertViewStyle, title: String?, message: String?) {
        super.init(style: style, title: title, message: message)
        let color : UIColor = UIColor(red: 4/255.0, green: 135.0/255, blue: 255.0/255, alpha: 1)
        self.buttonColor = color
        self.cancelButtonColor = UIColor.white
        self.cancelButtonLayerBorderColor = color
        self.cancelButtonTitleColor = color
        self.titleTopMargin = 16
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: 快速调用
    public class func alert(_ title: String, _ message: String, _ actions:[String], handler:((HIAlertAction)->Void)?) {
        
        let alertView = HIAlert()
        alertView.title = title
        alertView.message = message
        
        for i in 0..<actions.count{
            let title = actions[i]
            let def = HIAlertAction(title: title, style: .defaulted) { (action) in
                if handler != nil {
                    handler!(action)
                }
                alertView.dismiss()
            }
            alertView.addAction(action: def)
        }
        
//        let cancel = HIAlertAction(title: actions[0], style: .cancel) { (action) in
//            print("取消")
//            alertView.dismiss()
//        }
//        alertView.addAction(action: cancel)
//
//        if actions.count > 1 {
//            let def = HIAlertAction(title: actions[1], style: .defaulted) { (action) in
//                if handler != nil {
//                    handler!(action)
//                }
//                alertView.dismiss()
//            }
//            alertView.addAction(action: def)
//        }
//
//        if actions.count > 2{
//            let def = HIAlertAction(title: actions[2], style: .defaulted) { (action) in
//                if handler != nil {
//                    handler!(action)
//                }
//                alertView.dismiss()
//            }
//            alertView.addAction(action: def)
//        }
        
        alertView.show()
    }
    
    
}
