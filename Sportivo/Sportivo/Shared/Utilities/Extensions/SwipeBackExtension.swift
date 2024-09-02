//
//  SwipeBackExtension.swift
//  Sportivo
//
//  Created by marwa maky on 31/08/2024.
//

import Foundation
import UIKit

extension UIViewController: UIGestureRecognizerDelegate {

    func addSwipeBackGesture() {
        let swipeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleSwipeBack(_:)))
        swipeGesture.edges = .left
        swipeGesture.delegate = self
        view.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func handleSwipeBack(_ gesture: UIScreenEdgePanGestureRecognizer) {
        if gesture.state == .recognized {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.navigationController?.viewControllers.count ?? 0 > 1
    }
}
