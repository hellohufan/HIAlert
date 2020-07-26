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
        self.textField.font = UIFont.systemFont(ofSize: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public class func alert(_ title: String!, _ message: String!, _ actionTitles:[String]!, handler:((HIAlertAction)->Void)?) {
        let alertView = HIAlert(style: .defaulted, title: title, message: message)
        alertView.title = title
        alertView.message = message
        for i in 0..<actionTitles.count{
            let title = actionTitles[i]
            let def = HIAlertAction(title: title, style: .defaulted) { (action) in
                if let _handler = handler {
                    _handler(action)
                }
                alertView.dismiss()
            }
            alertView.addAction(action: def)
        }
        
        alertView.show()
    }
    
    public class func alertInput(title: String, message: String, placeholder: String, actionTitles:[String]!, handler:((HIAlertAction, String)->Void)?){
        let textView = HIAlert(style: .textField, title: title, message: message)
        textView.textField.placeholder = placeholder
        for i in 0..<actionTitles!.count {
            let title = actionTitles[i]
            let action = HIAlertAction(title: title, style: .defaulted) { (action) in
                if let block = handler, let text = textView.textField.text{
                    block(action, text)
                }
                textView.dismiss()
            }
            textView.addAction(action: action)
        }
        textView.show()
    }
}
