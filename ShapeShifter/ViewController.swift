//
//  ViewController.swift
//  ShapeShifter
//
//  Created by Cole Joplin on 12/22/17.
//  Copyright © 2017 Cole Joplin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shape1: UIBezierPath?
    var shape2: UIBezierPath?
    var isOpen: Bool = false
    var shapeLayer = CAShapeLayer()

    @IBOutlet weak var shapeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shape1 = smallOpening()
        shape2 = largeOpening()
        if let smallShape = shape1 {
            shapeLayer.path = smallShape.cgPath
            shapeLayer.fillColor = UIColor.gray.cgColor
            shapeLayer.strokeColor = UIColor.black.cgColor
            shapeView.layer.addSublayer(shapeLayer)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggle(_ sender: Any) {
        if isOpen {
            closeShape()
        } else {
            openShape()
        }
    }
    
    func openShape() {
        let contractionAnimation = CABasicAnimation(keyPath: "path")
        contractionAnimation.fromValue = shape1?.cgPath
        contractionAnimation.toValue = shape2?.cgPath
        contractionAnimation.duration = 5.0
        contractionAnimation.fillMode = kCAFillModeForwards
        contractionAnimation.isRemovedOnCompletion = false
        shapeLayer.add(contractionAnimation, forKey: "path")
        isOpen = true
    }
    
    func closeShape() {
        let contractionAnimation = CABasicAnimation(keyPath: "path")
        contractionAnimation.fromValue = shape2?.cgPath
        contractionAnimation.toValue = shape1?.cgPath
        contractionAnimation.duration = 5.0
        contractionAnimation.fillMode = kCAFillModeForwards
        contractionAnimation.isRemovedOnCompletion = false
        shapeLayer.add(contractionAnimation, forKey: "path")
        isOpen = false
    }
    
    func smallOpening() -> UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 35.5, y: 49.5))
        bezierPath.addLine(to: CGPoint(x: 41.5, y: 42.5))
        bezierPath.addLine(to: CGPoint(x: 47.5, y: 42.5))
        bezierPath.addLine(to: CGPoint(x: 47.5, y: 42.5))
        bezierPath.addLine(to: CGPoint(x: 59.5, y: 49.5))
        bezierPath.addLine(to: CGPoint(x: 66.5, y: 57.5))
        bezierPath.addLine(to: CGPoint(x: 59.5, y: 57.5))
        bezierPath.addLine(to: CGPoint(x: 47.5, y: 63.5))
        bezierPath.addLine(to: CGPoint(x: 35.5, y: 57.5))
        bezierPath.addLine(to: CGPoint(x: 35.5, y: 49.5))
        bezierPath.addLine(to: CGPoint(x: 35.5, y: 49.5))
        bezierPath.close()
        UIColor.gray.setFill()
        bezierPath.fill()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        return bezierPath
    }
    
    func largeOpening() -> UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 8.5, y: 82.5))
        bezierPath.addLine(to: CGPoint(x: 15.5, y: 51.5))
        bezierPath.addLine(to: CGPoint(x: 32.5, y: 21.5))
        bezierPath.addLine(to: CGPoint(x: 51.5, y: 11.5))
        bezierPath.addLine(to: CGPoint(x: 69.5, y: 21.5))
        bezierPath.addLine(to: CGPoint(x: 82.5, y: 41.5))
        bezierPath.addLine(to: CGPoint(x: 82.5, y: 64.5))
        bezierPath.addLine(to: CGPoint(x: 87.5, y: 82.5))
        bezierPath.addLine(to: CGPoint(x: 51.5, y: 91.5))
        bezierPath.addLine(to: CGPoint(x: 8.5, y: 82.5))
        bezierPath.addLine(to: CGPoint(x: 8.5, y: 82.5))
        bezierPath.addLine(to: CGPoint(x: 8.5, y: 82.5))
        bezierPath.close()
        UIColor.gray.setFill()
        bezierPath.fill()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        return bezierPath
    }
    
    
}

