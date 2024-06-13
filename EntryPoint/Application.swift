//
//  Application.swift
//  EntryPoint
//
//  Created by Vladislav Glumov on 13.6.24..
//

import UIKit

final class Application: UIApplication {
    private let notificationCenter: NotificationCenter = .default

    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)

        if let touches = event.allTouches, touches.contains(where: { $0.phase == .began }) {
            notificationCenter.post(name: .userDidTouchOnScreen, object: nil)
        }
    }
}

// MARK: - Application Notification Names

extension Notification.Name {

    static var userDidTouchOnScreen: Notification.Name {
        Notification.Name(rawValue: "Application.UserDidTouchOnScreen")
    }
}
