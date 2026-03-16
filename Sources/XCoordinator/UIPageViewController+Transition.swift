//
//  UIPageViewController+Transition.swift
//  XCoordinator
//
//  Created by Paul Kraft on 30.07.18.
//  Copyright © 2018 QuickBird Studios. All rights reserved.
//

import UIKit

@MainActor
extension UIPageViewController {
    func set(_ viewControllers: [UIViewController],
             direction: UIPageViewController.NavigationDirection,
             with options: TransitionOptions,
             completion: PresentationHandler?) {
        setViewControllers(
            viewControllers,
            direction: direction,
            animated: options.animated,
            completion: { _ in completion?() }
        )
    }
}
