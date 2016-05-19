//
//  HHJUnitTextField.swift
//  TableView_Swift
//
//  Created by bu88 on 16/3/24.
//  Copyright © 2016年 HM. All rights reserved.
//

//  可在textField前面或者后面带一个单位固定，带的这个单位是不可以编辑的

import UIKit

public class HHJUnitTextField: UIView {
    
    var preUnit: UILabel?
    var sufUnit: UILabel?
    public let textField: UITextField!
    
    override init(frame: CGRect) {
        textField = UITextField()
        super.init(frame: frame)
        addSubview(textField)
    }
    /**
     穿创建一个HHJUnitTextField的便利构造器
     
     - parameter pre:      UITextField前面的单位
     - parameter suf:      UITextField后面的单位
     - parameter frame:    HHJUnitTextField的尺寸
     - parameter fontSize: 单位的字号
     
     */
    public convenience init(pre: String? = nil, suf: String?, frame: CGRect, fontSize: CGFloat) {
        self.init(frame: frame)
        if let tempPre = pre {
            setMyPreUnit(tempPre, fontSize: fontSize)
        }
        
        if let tempSuf = suf {
            setMySufUnit(tempSuf, fontSize: fontSize)
        }
        setTextFieldFrame()
    }
    
    /**
     对一个已经存在的（从sb或者xib创建的）HHJUnitTextField设置UITextField前面的单位
     
     - parameter str:      UITextField前面的单位
     - parameter fontSize: 单位的字号
     */
    public func setMyPreUnit(str: String, fontSize: CGFloat) {
        let height = bounds.size.height
        let preWidth = HHJUnitTextField.getWidth(string: str, systemFontSize: fontSize, height: 100)
        preUnit = getLabel(CGRect(x: 0, y: 0, width: preWidth, height: height), str: str, fontSize: fontSize)
        preUnit?.backgroundColor = UIColor.greenColor()
        addSubview(preUnit!)
        setTextFieldFrame()
    }
    
    /**
     对一个已经存在的（从sb或者xib创建的）HHJUnitTextField设置UITextField后面的单位
     
     - parameter str:      UITextField后面的单位
     - parameter fontSize: 单位的字号
     */
    public func setMySufUnit(str: String, fontSize: CGFloat) {
        let height = bounds.size.height
        let width = bounds.size.width
        let sunWidth = HHJUnitTextField.getWidth(string: str, systemFontSize: fontSize, height: 100)
        sufUnit = getLabel(CGRect(x: width - sunWidth, y: 0, width: sunWidth, height: height), str: str, fontSize: fontSize)
        sufUnit?.backgroundColor = UIColor.greenColor()
        addSubview(sufUnit!)
        setTextFieldFrame()
    }
    
    func setTextFieldFrame() {
        var x = CGFloat(0)
        
        if preUnit != nil {
            x = preUnit!.frame.size.width
        }
        var width = bounds.size.width - x
        if sufUnit != nil {
            width -= sufUnit!.bounds.size.width
        }
        textField.frame = CGRect(x: x, y: 0, width: width, height: bounds.size.height)
        if subviews.indexOf(textField) == nil {
            addSubview(textField)
        }
    }
    
    override public func layoutSubviews() {
        let height = bounds.size.height
        let width = bounds.size.width
        if sufUnit != nil {
            let sunWidth = HHJUnitTextField.getWidth(string: sufUnit!.text!, systemFontSize: sufUnit!.font.pointSize, height: 100)
            sufUnit?.frame = CGRect(x: width - sunWidth, y: 0, width: sunWidth, height: height)
        }
        if preUnit != nil {
            let preWidth = HHJUnitTextField.getWidth(string: preUnit!.text!, systemFontSize: preUnit!.font.pointSize, height: 100)
            preUnit?.frame = CGRect(x: 0, y: 0, width: preWidth, height: height)
        }
        setTextFieldFrame()
    }
    
    func getLabel(frame: CGRect, str: String, fontSize:CGFloat) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = str
        label.font =  UIFont.systemFontOfSize(fontSize)
        return label
    }
    
    static func getWidth(string str: String, systemFontSize: CGFloat, height: CGFloat) -> CGFloat {
        let attributes = [NSFontAttributeName: UIFont.systemFontOfSize(systemFontSize)]
        let rect = str.boundingRectWithSize(CGSize(width: CGFloat(MAXFLOAT), height: height), options:.UsesLineFragmentOrigin, attributes:attributes, context: nil)
        return rect.width
    }

    required public init?(coder aDecoder: NSCoder) {
        textField = UITextField()
        super.init(coder: aDecoder)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
