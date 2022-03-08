//
//  ListView.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import Foundation
import UIKit

protocol ListViewProtocol: AnyObject {
    func loadSections(_ sections: [BaseSectionDataProtocol])
    func updateSection(_ section: BaseSectionDataProtocol)
    func appendSection(_ section: BaseSectionDataProtocol)
    func insertSection(_ section: BaseSectionDataProtocol, at index: Int)
}

public final class ListView: UIView {

    lazy var containerView: ContainerView = {
        let view = ContainerView(configuration: configuration)
        return view
    }()

    private let configuration: ContainerConfiguration

    public init(configuration: ContainerConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        setupView()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(containerView)
    }

    private func setupConstraint() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
