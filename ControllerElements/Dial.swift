//
//  Dial.swift
//  ControllerElements
//
//  Created by James Bean on 9/15/16.
//
//

import QuartzCore
import Color
import PathTools
import GraphicsTools

public class Dial: CALayer, CompositeShapeType {
    
    // Value between 0 and 1
    public let operationRange: Range<Float> = 0 ..< 1

    private let layer = CALayer()
    
    public var value: Float = 0.0 {
        
        // TODO: refactor this as method: updateRotation()
        didSet {
            guard value >= 0.0 && value <= 1.0 else { return }
            updateRotation(value: value)
        }
    }
    
    /// Components that need to built and commited
    public var components: [CALayer] = []
    
    /**
     Create the components contained herein.
     */
    public func createComponents() {
        addOutlineCircle()
        addLine()
        addSublayer(layer)
    }
    
    public func makeFrame() -> CGRect {
        return CGRect.zero
    }
    
    public init(frame: CGRect) {
        super.init()
        self.frame = frame
        createComponents()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // add circle
    public func addOutlineCircle() {
        let center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        let path = Path.circle(center: center, radius: 0.5 * frame.width)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 1
        shape.strokeColor = Color(gray: 0.4, alpha: 1).cgColor
        shape.fillColor = Color(gray: 0.9, alpha: 1).cgColor
        addSublayer(shape)
    }
    
    public func addLine() {
        let center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        let path = Path()
            .move(to: center)
            .addLine(to: CGPoint(x: 0.5 * frame.width, y: frame.height))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 1
        shape.strokeColor = Color(gray: 0, alpha: 1).cgColor
        layer.addSublayer(shape)
    }
    
    private func updateRotation(value: Float) {
        let degrees = CGFloat(value) * 360
        
        // TODO: Refactor to GraphicsTools ------------------>
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: frame.width / 2, y: frame.height / 2)
        transform = transform.rotated(by: DEGREES_TO_RADIANS(degrees))
        transform = transform.translatedBy(x: -frame.width / 2, y: -frame.height / 2)
        
        CATransaction.setDisableActions(true)
        layer.setAffineTransform(transform)
        CATransaction.setDisableActions(false)
    }
}

// FIXME: This should remain private, removed when rotation is refactored out
/**
 - TODO: Refactor as inits to and from degrees / radians
 */
internal func DEGREES_TO_RADIANS(_ degrees: CGFloat) -> CGFloat {
    return degrees / 180.0 * CGFloat(M_PI)
}

/**
 - TODO: Refactor as inits to and from degrees / radians
 */
internal func RADIANS_TO_DEGREES(_ radians: CGFloat) -> CGFloat {
    return radians * (180.0 / CGFloat(M_PI))
}
