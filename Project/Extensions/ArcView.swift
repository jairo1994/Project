//
//  ArcView.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class ArcView: UIView {
    var color: UIColor = UIColor.lightGray
    override func draw(_ rect: CGRect) {
        let y:CGFloat = 60
        let curveTo:CGFloat = 0
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
        myBezier.close()
        let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(4.0)
        UIColor.white.setFill()
        myBezier.fill()
    }
}
