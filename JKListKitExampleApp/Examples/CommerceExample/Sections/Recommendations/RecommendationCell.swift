//
//  RecommendationCell.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 04-03-22.
//

import UIKit

class RecommendationCell: UICollectionViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .fontTheme(size: 12)
        label.textColor = .grayScaleOn
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .fontTheme(size: 12)
        label.textColor = .grayScaleTitle
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "420$"
        label.font = .fontTheme(size: 15)
        label.textColor = .primary
        return label
    }()

    let imageProductView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
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
        containerStackView.addArrangedSubview(imageProductView)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(descriptionLabel)
        containerStackView.addArrangedSubview(priceLabel)

        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),

            imageProductView.heightAnchor.constraint(equalToConstant: 145)
        ])
    }
}
