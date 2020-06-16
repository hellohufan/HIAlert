//
//  HIAlert.swift
//  FBSnapshotTestCase
//
//  Created by hufan on 2020/6/16.
//

import Foundation

import UIKit

class HIAlert: HIAlertView {
    
    ///MARK: 快速调用
    public class func alert(_ title: String, _ message: String, _ actions:[String], handler:((HIAlertAction)->Void)?) {
        
        let alertView = HIAlertView()
        alertView.title = title
        alertView.message = message
        
        let cancel = HIAlertAction(title: actions[0], style: .cancel) { (action) in
            print("取消")
            alertView.dismiss()
        }
        alertView.addAction(action: cancel)
        
        if actions.count > 1 {
            let def = HIAlertAction(title: actions[1], style: .defaulted) { (action) in
                if handler != nil {
                    handler!(action)
                }
                alertView.dismiss()
            }
            alertView.addAction(action: def)
        }
        
        alertView.show()
    }

    
    override init(style: HIAlertViewStyle, title: String?, message: String?) {
        super.init(style: style, title: title, message: message)
        let color : UIColor = UIColor(red: 4, green: 135, blue: 255, alpha: 1)
        self.buttonColor = color
        self.cancelButtonColor = UIColor.white
        self.cancelButtonLayerBorderColor = color
        self.cancelButtonTitleColor = color
        self.titleTopMargin = 16
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
