//
//  ShortDescriptionSectionView.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 03-03-22.
//

import UIKit

class ShortDescriptionSectionView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "420$"
        return label
    }()

    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(descriptionLabel)
        containerStackView.addArrangedSubview(priceLabel)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
