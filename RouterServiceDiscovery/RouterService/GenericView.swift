//
//  GenericView.swift
//  RouterServiceDiscovery
//
//  Created by Fernando Luiz Goulart on 30/05/22.
//

public protocol GenericView {
    func navigateTo(_ destination: GenericView)
}
