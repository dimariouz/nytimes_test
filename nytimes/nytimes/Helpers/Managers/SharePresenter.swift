//
//  SharePresenter.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit
import SafariServices

protocol ShareProtocol: class {
    func openLink(string: String?)
}

extension ShareProtocol where Self: UIViewController & AlertPresenter {
    
    func openLink(string: String?) {
        guard let url = string, let link = URL(string: url) else {
            showAlert(message: "Cant open link")
            return }
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: link, configuration: config)
        self.present(vc, animated: true)
    }
    
}
