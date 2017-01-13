//
//  Layoutable.swift
//  Pods
//
//  Created by Alvin Choo on 13/1/17.
//
//

protocol Layoutable {
    func originValue(withBound bounds: CGRect, containerRect: CGRect) -> CGFloat
    func autoresizingMask(with origin: UIViewAutoresizing) -> UIViewAutoresizing
}

extension PopupView.HorizontalLayout: Layoutable {
    func originValue(withBound bounds: CGRect, containerRect: CGRect) -> CGFloat {
        switch self {
        case .left:
            return 0.0
        case .leftOfCenter:
            return floor(bounds.width / 3.0 - containerRect.width / 2.0)
        case .center:
            return floor((bounds.width - containerRect.width) / 2.0)
        case .rightOfCenter:
            return floor((bounds.width * 2.0 / 3.0) - (containerRect.width / 2.0))
        case .right:
            return bounds.width - containerRect.width
        }
    }
    
    func autoresizingMask(with origin: UIViewAutoresizing) -> UIViewAutoresizing {
        switch self {
        case .left:
            return [origin, .flexibleRightMargin]
        case .leftOfCenter:
            return [origin, .flexibleLeftMargin, .flexibleRightMargin]
        case .center:
            return [origin, .flexibleLeftMargin, .flexibleRightMargin]
        case .rightOfCenter:
            return [origin, .flexibleLeftMargin, .flexibleRightMargin]
        case .right:
            return [origin, .flexibleLeftMargin]
        }
    }
}

extension PopupView.VerticalLayout: Layoutable {
    func originValue(withBound bounds: CGRect, containerRect: CGRect) -> CGFloat {
        switch self {
        case .top:
            return 0.0
        case .aboveCenter:
            return floor(bounds.width / 3.0 - containerRect.height / 2.0)
        case .center:
            return floor((bounds.height - containerRect.height) / 2.0)
        case .belowCenter:
            return floor((bounds.height * 2.0 / 3.0) - (containerRect.height / 2.0))
        case .bottom:
            return bounds.height - containerRect.height
        }
    }
    
    func autoresizingMask(with origin: UIViewAutoresizing) -> UIViewAutoresizing {
        switch self {
        case .top:
            return [origin, .flexibleBottomMargin]
        case .aboveCenter:
            return [origin, .flexibleTopMargin, .flexibleBottomMargin]
        case .center:
            return [origin, .flexibleTopMargin, .flexibleBottomMargin]
        case .belowCenter:
            return [origin, .flexibleTopMargin, .flexibleBottomMargin]
        case .bottom:
            return [origin, .flexibleTopMargin]
        }
    }
}
