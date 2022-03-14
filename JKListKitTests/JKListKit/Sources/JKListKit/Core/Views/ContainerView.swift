//
//  ContainerView.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import UIKit

final class ContainerView: UIView {

    let scrollView: UIScrollView = {
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

    let configuration: ListViewConfiguration

    init(configuration: ListViewConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        setupView()
        setupConstraint()
        setConfiguration(configuration: configuration)
    }

    private func setConfiguration(configuration: ListViewConfiguration) {
        stackView.spacing = configuration.spacing
        scrollView.contentInset = UIEdgeInsets(
            top: configuration.topInset,
            left: 0,
            bottom: configuration.bottomInset,
            right: 0
        )
    }

    func addArrangedSubview(_ view: UIView, with lateralSpacing: CGFloat?) {
        let lateralSpacing = lateralSpacing ?? configuration.lateralSpacing
        let view = prepareViewBeforeInsert(view, with: lateralSpacing)
        stackView.addArrangedSubview(view)
        CATransaction.flush()
        layoutIfNeeded()
    }

    func insertArrangedSubview(_ view: UIView, at index: Int, with lateralSpacing: CGFloat?) {
        let lateralSpacing = lateralSpacing ?? configuration.lateralSpacing
        let view = prepareViewBeforeInsert(view, with: lateralSpacing)
        stackView.insertArrangedSubview(view, at: index)
        CATransaction.flush()
        layoutIfNeeded()
    }

    func cleanSubViews() {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }

    private func prepareViewBeforeInsert(_ view: UIView, with lateralSpacing: CGFloat) -> UIView {
        let containerView = UIView()
        containerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: containerView.topAnchor),
            view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: lateralSpacing),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: lateralSpacing),
            view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)

        ])
        return containerView
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
