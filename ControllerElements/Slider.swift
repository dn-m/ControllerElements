//
//  Slider.swift
//  ControllerElements
//
//  Created by James Bean on 9/17/16.
//
//

import QuartzCore
import Color
import PathTools
import GraphicsTools

// TODO: CompositeShapeType
public class Slider: CALayer, ContinuousController, CompositeShapeType {
    
    private let layer = CALayer()
    
    public var components: [CALayer] = []
    
    private var indicator: CALayer!
    
    public var value: Float = 0.0 {
        
        didSet {
            guard value >= 0.0 && value <= 1.0 else { return }
            updateIndicatorPosition(value: value)
        }
    }
    
    public required override init() {
        super.init()
    }
    
    public init(frame: CGRect) {
        super.init()
        self.frame = frame
        createComponents()
        updateIndicatorPosition(value: value)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func ramp(to value: Float, over duration: Double = 0) {
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.duration = duration
        animation.fromValue = indicator.position.y
        animation.toValue = CGFloat(1 - value) * frame.height
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        indicator.add(animation, forKey: "position.y")
    }
    
    public func createComponents() {
        addOutline()
        addIndicator()
        addSublayer(layer)
    }
    
    public func addOutline() {
        borderWidth = 1
        borderColor = Color(gray: 0, alpha: 1).cgColor
    }
    
    public func addIndicator() {
        let path = Path.rectangle(rectangle: CGRect(x: 0, y: 0, width: frame.width, height: 2))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 1
        shape.strokeColor = Color(gray: 0, alpha: 1).cgColor
        layer.addSublayer(shape)
        indicator = shape
    }
    
    // TODO: Consider making this completely instance-level state, or completely local- !
    private func updateIndicatorPosition(value: Float) {
        CATransaction.setDisableActions(true)
        indicator.frame.origin.y = CGFloat(1 - value) * frame.height
        CATransaction.setDisableActions(false)
    }

    public func makeFrame() -> CGRect {
        return CGRect.zero
    }
}
