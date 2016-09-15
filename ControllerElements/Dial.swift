//
//  Dial.swift
//  ControllerElements
//
//  Created by James Bean on 9/15/16.
//
//

import QuartzCore
import PathTools
import GraphicsTools

public class Dial: CALayer, CompositeShapeType {
    
    // Value between 0 and 1
    public let operationRange: Range<Float> = 0..<1
    
    public var value: Float
    
    /**
     Create the components contained herein.
     */
    public func createComponents() {
        
    }

    /// Components that need to built and commited
    public var components: [CALayer] = []

    //public let frame: CGRect
    
    public func makeFrame() -> CGRect {
        return CGRect.zero
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


