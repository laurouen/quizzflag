//
//  CircleShape.swift
//  TimeLeft Shape Sample
//
//  Created by Laurent Mery on 13/08/2018.
//  Copyright © 2018 inDabusiness. All rights reserved.
//

import UIKit

class CircleShapeLayer: CAShapeLayer {

    var endTime: Date?
    var timeLeft: TimeInterval?
    var timer = Timer()
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    
    func initCircle(centerX: CGFloat, centerY: CGFloat, radius: CGFloat, lineWidth: CGFloat,startAngleDegree: Int, endAngleDegree: Int, clockwise: Bool, color: CGColor) -> CircleShapeLayer {
        
        self.path = UIBezierPath(arcCenter: CGPoint(x: centerX , y: centerY), radius:
            radius, startAngle: startAngleDegree.csDegreesToRadians, endAngle: endAngleDegree.csDegreesToRadians, clockwise: clockwise).cgPath
        self.strokeColor = color
        self.fillColor = UIColor.clear.cgColor
        self.lineWidth = lineWidth
        
        return self
    }
    
    func addProgress(fromValue: Int, stepValue: Int, duration: CFTimeInterval) {
        
        strokeIt.fromValue = fromValue
        strokeIt.toValue = stepValue
        strokeIt.duration = duration
        timeLeft = duration
        
        self.add(strokeIt, forKey: nil)
        guard let timeleft = timeLeft else { fatalError("CircleShape: You must define duration when you add progress (addProgress) !") }
        endTime = Date().addingTimeInterval(timeleft)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        NotificationCenter.default.post(name: .csStart, object: self)
    }
    
    func getTimeStringFromUserInfoNotification (userInfo: [String: String]?) -> String {
        guard let ui = userInfo else { return "" }
        return ui["labelTime"] ?? ""
    }
    
    @objc func updateTime() {
        guard let timeleft = timeLeft else { fatalError("CircleShape: You must define duration when you add progress (addProgress) !") }
        if timeleft > 0 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            NotificationCenter.default.post(name: .csUpdateTime, object: self, userInfo: ["labelTime": timeleft.csTime])
        } else {
            NotificationCenter.default.post(name: .csEnd, object: self)
            NotificationCenter.default.post(name: .csUpdateTime, object: self, userInfo: ["labelTime": "00:00"])
            timer.invalidate()
        }
    }
}


extension TimeInterval {
    var csTime: String {
        return String(format:"%02d:%02d", Int(self/60),  Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}
extension Int {
    var csDegreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
extension Notification.Name {
    static let csUpdateTime = Notification.Name("csUpdateName")
    static let csStart = Notification.Name("csStart")
    static let csEnd = Notification.Name("csEnd")
}

