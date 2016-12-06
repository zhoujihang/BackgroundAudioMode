//
//  HintTool.swift
//  Mara
//
//  Created by 周际航 on 2016/11/28.
//  Copyright © 2016年 com.maramara. All rights reserved.
//

import UIKit


class HintTool {
    
    private var hintView: UIView?
    
    static let shared = HintTool()
    
    static func hint(_ message: String) {
        self.shared.showHintView(hintView: self.hintView(with: message))
    }
    
    private func showHintView(hintView: UIView) {
        guard let window = UIApplication.shared.delegate?.window else {return}
        guard self.hintView == nil else {return}
        
        window!.addSubview(hintView)
        window!.bringSubview(toFront: hintView)
        self.hintView = hintView
        
        // 消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            [weak self] in
            UIView.animate(withDuration: 0.5, animations: {
                [weak self] in
                self?.hintView?.alpha = 0.5
                }, completion: { (finished) in
                    self?.hintView?.removeFromSuperview()
                    self?.hintView = nil
            })
        }
    }
    
    private static func hintView(with message: String) -> UIView {
        let minWidth = 180.0
        let maxWidth = 260.0
        let padding = 10.0
        let font = UIFont.systemFont(ofSize: 14)
        
        let messageSize = message.ext_size(withBoundingSize: CGSize(width: maxWidth-2*padding, height: 0) , font: font)
        
        let labelFrame = CGRect(x: 0, y: 0, width: CGFloat(ceilf(Float(messageSize.width))), height: CGFloat(ceilf(Float(messageSize.height))))
        let viewFrame = CGRect(x: 0, y: 0, width: max(minWidth, Double(messageSize.width) + padding*2), height: Double(messageSize.height) + padding*2)
        
        let hintView = UIView()
        hintView.isUserInteractionEnabled = false
        hintView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        hintView.layer.cornerRadius = 8
        hintView.layer.masksToBounds = true
        hintView.frame = viewFrame
        hintView.center = CGPoint(x: CGFloat(ceilf(Float(UIScreen.main.bounds.size.width*0.5))), y: CGFloat(ceilf(Float(UIScreen.main.bounds.size.height-100.0))))
        
        let hintLabel = UILabel()
        hintView.addSubview(hintLabel)
        hintView.isUserInteractionEnabled = false
        hintLabel.text = message
        hintLabel.textColor = UIColor.white
        hintLabel.textAlignment = .center
        hintLabel.font = font
        hintLabel.preferredMaxLayoutWidth = messageSize.width
        hintLabel.numberOfLines = 0
        hintLabel.frame = labelFrame
        hintLabel.center = CGPoint(x: CGFloat(ceilf(Float(hintView.bounds.size.width*0.5))), y: CGFloat(ceilf(Float(hintView.bounds.size.height*0.5))))
        
        return hintView
    }
}

extension String {
    func ext_size(withBoundingSize boundingSize: CGSize, font: UIFont) -> CGSize {
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let attributes = [NSFontAttributeName : font]
        let contentSize = self.boundingRect(with: boundingSize, options: option, attributes: attributes, context: nil).size
        return contentSize
    }
}


