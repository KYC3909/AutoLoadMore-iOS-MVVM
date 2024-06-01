//
//  Color.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import Foundation

// MARK: - ColorConvertible
public protocol ColorConvertible {
    var name: String { get }
    var code: String { get }
    var alpha: CGFloat { get }
}

// MARK: - CorporateColor
public struct CorporateColor: ColorConvertible {
    
    public var name: String
    public var code: String
    public var alpha: CGFloat
    
    public init(name: String, code: String, alpha: CGFloat = 1.0) {
        self.name = name
        self.code = code
        self.alpha = alpha
    }
}

// MARK: - Colors
public struct Colors {
    
    static let main: ColorConvertible = CorporateColor(name: "CorporateMain.lightgreen", code: "#589e85")

    static let ghostWhite: ColorConvertible = CorporateColor(name: "ghost white", code: "#F4F6F8")

}
