//
//  UserInteractionsCounter.swift
//  EntryPoint
//
//  Created by Vladislav Glumov on 13.6.24..
//

import Foundation

protocol UserInteractionsCounterDelegate: AnyObject {
    func interactionAmountDidChange(_ count: Int)
}

final class UserInteractionsCounter {
    private let notificationCenter: NotificationCenter = .default

    private(set) var interactionsCount: Int = .zero

    weak var delegate: UserInteractionsCounterDelegate?

    init() {
        notificationCenter.addObserver(
            self,
            selector: #selector(userDidTouchOnScreen),
            name: .userDidTouchOnScreen,
            object: nil
        )
    }

    deinit {
        notificationCenter.removeObserver(self)
    }
}

// MARK: - Notification Actions

private extension UserInteractionsCounter {

    @objc func userDidTouchOnScreen(_ notification: Notification) {
        interactionsCount += 1
        delegate?.interactionAmountDidChange(interactionsCount)
    }
}
