//
//  UIViewController+Extensions.swift
//  RouterServiceDiscovery
//
//  Created by Fernando Luiz Goulart on 30/05/22.
//

import UIKit
extension UIViewController:  GenericView {

    public func navigateTo(_ destination: GenericView) {
        if type(of: destination) == UIViewController.Type.self {
            self.navigationController?.pushViewController(destination as! UIViewController, animated: true)
        }
    }
}
