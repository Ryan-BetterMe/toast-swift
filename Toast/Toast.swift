//
//  Toast.swift
//  Example
//
//  Created by Lance on 2020/10/30.
//

import UIKit
import ObjectiveC

// 为什么要重写:因为这个库写得不错，可以训练我，同时我想自定义一些动画来展示它
// 如何自定义动画：选择几个动画
// 因为会有多个toast出现，所以如何出现的通过set_object来设定关联，但是具体的一些配置，因为是全局的，所以通过manager这个单例来进行全局的管理

public extension UIView {
    func test() {
        let effect = UIBlurEffect.init(style: .dark)
    }
}

public struct ToastStyle {
    public init() {}
    
    public var backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.8)
    
    public var titleColor: UIColor = .white
    
    public var messageColor: UIColor = .white
    
    public var blurStyle: UIBlurEffect.Style = .dark
    
    public var maxWidthPercentage: CGFloat = 0.8 {
        didSet {
            maxWidthPercentage = max(min(maxWidthPercentage, 1.0), 0.0)
        }
    }
    
    public var maxHeightPercentage: CGFloat = 0.8 {
        didSet {
            maxHeightPercentage = max(min(maxHeightPercentage, 1.0), 0.0)
        }
    }
    
    public var horizontalPadding: CGFloat = 10.0
    
    public var verticalPadding: CGFloat = 10.0
    
    public var cornerRaidus: CGFloat = 10.0
    
    public var titleFont: UIFont = .boldSystemFont(ofSize: 16.0)
    
    public var messageFont: UIFont = .systemFont(ofSize: 16.0)
    
    public var titleAlignment: NSTextAlignment = .left
    
    public var messageAlignment: NSTextAlignment = .left
    
    public var titleNumberOfLines = 0
    
    public var messageNumberOfLines = 0
    
    public var displayShadow = false
    
    public var shadowColor: UIColor = .black
    
    public var shadowOpacity: Float = 0.8 {
        didSet {
            shadowOpacity = max(min(shadowOpacity, 1.0), 0.0)
        }
    }
    
    public var shadowRadius: CGFloat = 6.0
    
    public var shadowOffset = CGSize(width: 4.0, height: 4.0)
    
    public var imageSize = CGSize(width: 80.0, height: 80.0)
    
    public var activitySize = CGSize(width: 100.0, height: 100.0)
    
    public var fadeDuration: TimeInterval = 0.2
    
    public var activityIndicatorColor: UIColor = .white
    
    public var activityBackgroundColor: UIColor = UIColor.black.withAlphaComponent(0.8)
}

public class ToastManager {
    
    public static let shared = ToastManager()
    
    public var style = ToastStyle()
    
    public var isTapToDismissEnable = true
    
    public var isQueueEnabled = true
    
    public var duration: TimeInterval = 3.0
    
    public var position: ToastPosition = .bottom
}

public enum ToastAnimation {
    
}

public enum ToastBottomViewStyle {
    case alpha
    case blur
}

public enum ToastPosition {
    case top
    case center
    case bottom
    
    fileprivate func centerPoint(forToast toast: UIView, inSuperview superview: UIView) -> CGPoint {
        return CGPoint.zero
    }
}

private extension UIView {
    
    var csSafeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.safeAreaInsets
        } else {
            return .zero
        }
    }
}


