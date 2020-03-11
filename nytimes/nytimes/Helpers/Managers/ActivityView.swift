//
//  ActivityManager.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

protocol ActivityIndicatorPresenter {
    var activityIndicator: ActivityView { get }
    func setActivityIndicator(hidden: Bool)
}

class ActivityView: UIView {
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .whiteLarge
        view.center = CGPoint(x: Constants.Dimensions.deviceWidth / 2, y: Constants.Dimensions.deviceHeight / 2)
        view.hidesWhenStopped = true
        return view
    }()
    
    private let backgroundView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        return view
    }()
    
    private func setupView() {
        self.addSubview(backgroundView)
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ActivityIndicatorPresenter where Self: UIViewController {
    
    func setActivityIndicator(hidden: Bool) {
        if !hidden {
            DispatchQueue.main.async {
                self.activityIndicator.frame = self.view.bounds
                self.view.addSubview(self.activityIndicator)
                UIApplication.shared.beginIgnoringInteractionEvents()
            }
        } else {
            DispatchQueue.main.async {
                self.activityIndicator.removeFromSuperview()
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
    }
    
}
