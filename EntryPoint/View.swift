//
//  View.swift
//  EntryPoint
//
//  Created by Vladislav Glumov on 13.6.24..
//

import UIKit

final class View: UIView {

    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black

        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Hello, Swift!"

        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Change title color", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(changeTitleColor), for: .touchUpInside)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateCounter(count: Int) {
        counterLabel.text = "Interactions: \(count)"
    }
}

// MARK: - View Setup

private extension View {

    func setupView() {
        setupAppearance()
        setupLayout()
    }

    func setupAppearance() {
        backgroundColor = .white
    }

    func setupLayout() {
        addSubview(counterLabel)
        addSubview(titleLabel)
        addSubview(button)

        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            counterLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            counterLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),

            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16)
        ])
    }
}

// MARK: - View Actions

private extension View {

    @objc func changeTitleColor() {
        let colors: [UIColor] = [.black, .red, .green, .purple, .brown, .yellow]
        let randomColor = colors[Int.random(in: colors.indices)]

        titleLabel.textColor = randomColor
    }
}
