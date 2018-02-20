//
//  TMProgressView.swift
//  TMProgressView
//
//  Created by Viachaslau Kastsechka on 2/4/18.
//  Copyright © 2018 Viachaslau Kastsechka. All rights reserved.
//

import UIKit

class TMProgressView: UIView {

    //MARK:- Public
    
    let yellowColor: UIColor = UIColor(red: 255/255.0, green: 212/255.0, blue: 0/255.0, alpha: 1)
    let greenColor: UIColor = UIColor(red: 76/255.0, green: 217/255.0, blue: 100/255.0, alpha: 1)
    let blueColor: UIColor = UIColor(red: 2/255.0, green: 142/255.0, blue: 255/255.0, alpha: 1)
    let redColor: UIColor = UIColor(red: 252/255.0, green: 78/255.0, blue: 103/255.0, alpha: 1)
    
    let chunckViewWidth: CGFloat = 62.0
    
    let animationDuration: TimeInterval = 2
    
    var animator: UIViewPropertyAnimator?
    //MARK:- Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK:- Public
    
    func start() -> Void {
        var index: UInt = UInt(subviews.count)
        for view in subviews {
            animateView(view: view, index: index)
            index -= 1
        }
    }
    
    func animateView(view: UIView, index: UInt) -> Void {

        animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            var frame = view.frame
            var x = 0
            switch view.tag {
            case 0:
                x = 350 + 62 + 62 + 62
            case 1:
                x = 350 + 62 + 62
            case 2:
                x = 350 + 62
            case 3:
                x = 350
            default:
                break
            }
            //            frame.origin.x = (CGFloat(350) + ((self.chunckViewWidth) * CGFloat(index - 1)))
            frame.origin.x = CGFloat(x)
            frame.size.width = CGFloat(62)
            
            
            view.frame = frame
        }
        
        animator?.startAnimation(afterDelay: 0)
//        UIView.animate(withDuration: animationDuration, delay: 0, options: [.repeat, .curveEaseInOut], animations: {
//            var frame = view.frame
//            var x = 0
//            switch view.tag {
//            case 0:
//                x = 350 + 62 + 62 + 62
//            case 1:
//                x = 350 + 62 + 62
//            case 2:
//                x = 350 + 62
//            case 3:
//                x = 350
//            default:
//                break
//            }
////            frame.origin.x = (CGFloat(350) + ((self.chunckViewWidth) * CGFloat(index - 1)))
//            frame.origin.x = CGFloat(x)
//            frame.size.width = CGFloat(62)
//
//
//            view.frame = frame
//        }) { (_) in
//            //do nothing
//        }

    }
    
    
    func stop() -> Void {
        self.layer.removeAllAnimations()
    }
    
    //MARK:- UI
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //MARK:- Private

    private func setup() -> Void {
        let colors: [UIColor] = [redColor, yellowColor, greenColor, blueColor]
        
        let height = CGFloat(self.bounds.size.height)
        let y = CGFloat(0)
        var i: UInt = 0
        for color in colors {
            var x = 0
            var width = 124
            if i == 3 {
                x = 572
                width = 200
            } else {
                x = (Int(CGFloat(i + 1) * CGFloat(124.0)))
            }
            let view: UIView  = UIView(frame: CGRect(x: -(CGFloat(x)), y: y, width: CGFloat(width), height: height))
            view.backgroundColor = color
            view.tag = Int(i)
            addSubview(view)
            i = i + 1
        }
        
        self.clipsToBounds = true
        
        
        
    }
    
}
