//
//  ViewController.swift
//  EntryPoint
//
//  Created by Vladislav Glumov on 13.6.24..
//

import UIKit

final class ViewController: UIViewController {
    private let notificationCenter: NotificationCenter = .default
    private let counter: UserInteractionsCounter

    private var selfView: View {
        view as! View
    }

    init(counter: UserInteractionsCounter) {
        self.counter = counter

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }

    override func loadView() {
        self.view = View()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        selfView.updateCounter(count: counter.interactionsCount)
    }
}

// MARK: - UserInteractionsDelegate

extension ViewController: UserInteractionsCounterDelegate {

    func interactionAmountDidChange(_ count: Int) {
        selfView.updateCounter(count: count)
    }
}
