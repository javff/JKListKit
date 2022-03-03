//
//  MainActionsSectionView.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 03-03-22.
//

import UIKit

class MainActionsSectionView: UIView {

    let plusIcon: UIImageView = {
        let image = UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()

    let favoriteIcon: UIImageView = {
        let image = UIImage(systemName: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()

    let buttonLabel: UILabel = {
        let label = UILabel()
        label.text = "ADD TO BASKET"
        label.textColor = .white
        return label
    }()

    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
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

        let containerView = UIView()
        containerView.backgroundColor = .black
        containerView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(containerView)
        containerView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(plusIcon)
        containerStackView.addArrangedSubview(buttonLabel)
        containerStackView.addArrangedSubview(UIView())
        containerStackView.addArrangedSubview(favoriteIcon)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 56),

            containerStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor, constant: 20),
            containerStackView.heightAnchor.constraint(equalToConstant: 24),

            plusIcon.widthAnchor.constraint(equalToConstant: 24),
            favoriteIcon.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
}
