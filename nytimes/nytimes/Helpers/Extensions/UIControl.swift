//
//  UIControl.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

extension UIControl {
    
    private class ClosureWrapper {
        let closure: () -> Void
        init(owner: AnyObject, block: @escaping () -> Void) {
            closure = block
            guard let ownwer_d = owner.description else { return }
            objc_setAssociatedObject(owner, "\(ownwer_d)\(arc4random())", self, .OBJC_ASSOCIATION_RETAIN)
        }
        @objc func run() {
            closure()
        }
    }
    
    func addAction(for controlEvents: UIControl.Event, action: @escaping () -> Void) {
        let wrapper = ClosureWrapper(owner: self, block: action)
        addTarget(wrapper, action: #selector(ClosureWrapper.run), for: controlEvents)
    }
    
    func removeActions(for controlEvents: UIControl.Event = .allEvents) {
        removeTarget(nil, action: nil, for: controlEvents)
    }
    
}
