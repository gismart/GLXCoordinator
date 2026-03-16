//
//  Router+Combine.swift
//  XCoordinatorCombine
//
//  Created by Paul Kraft on 28.08.19.
//  Copyright © 2018 QuickBird Studios. All rights reserved.
//

#if canImport(Combine) && canImport(XCoordinator)

import Combine
import XCoordinator

@MainActor
public struct PublisherExtension<Base> {
    public let base: Base
}

@MainActor
extension Router {

    public var publishers: PublisherExtension<Self> {
        .init(base: self)
    }

    @available(iOS 13.0, tvOS 13.0, *)
    public func triggerPublisher(
        _ route: RouteType,
        with options: TransitionOptions = .init(animated: true)
    ) -> Future<Void, Never> {
        Future { completion in
            self.trigger(route, with: options) {
                completion(.success(()))
            }
        }
    }

}

@available(iOS 13.0, tvOS 13.0, *)
@MainActor
extension PublisherExtension where Base: Router {

    public func trigger(
        _ route: Base.RouteType,
        with options: TransitionOptions = .init(animated: true)
    ) -> Future<Void, Never> {
        base.triggerPublisher(route, with: options)
    }

}

#endif
