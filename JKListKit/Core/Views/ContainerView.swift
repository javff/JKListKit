//
//  ContainerView.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import UIKit

final class ContainerView: UIView {

    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isScrollEnabled = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    private let stackView: UIStackView = {
        let containerView = UIStackView()
        containerView.distribution = .fill
        containerView.alignment = .fill
        containerView.axis = .vertical
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }

    init(configuration: ContainerConfiguration) {
        super.init(frame: .zero)
        setupView()
        setupConstraint()
        setConfiguration(configuration: configuration)
    }

    private func setConfiguration(configuration: ContainerConfiguration) {
        stackView.spacing = configuration.spacing
    }

    func addArrangedSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }

    func insertArrangedSubview(_ view: UIView, at index: Int) {
        stackView.insertArrangedSubview(view, at: index)
    }

    func cleanSubViews() {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }

    private func setupConstraint() {

        let frameGuide = scrollView.frameLayoutGuide
        let contentGuide = scrollView.contentLayoutGuide

        NSLayoutConstraint.activate([
            frameGuide.topAnchor.constraint(equalTo:        topAnchor),
            frameGuide.leadingAnchor.constraint(equalTo:    leadingAnchor),
            frameGuide.trailingAnchor.constraint(equalTo:   trailingAnchor),
            frameGuide.bottomAnchor.constraint(equalTo:     bottomAnchor),

            contentGuide.topAnchor.constraint(equalTo:         stackView.topAnchor),
            contentGuide.leadingAnchor.constraint(equalTo:     stackView.leadingAnchor),
            contentGuide.trailingAnchor.constraint(equalTo:    stackView.trailingAnchor),
            contentGuide.bottomAnchor.constraint(equalTo:      stackView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo:          frameGuide.widthAnchor)
        ])
    }
}
