//
//  VerticalGallerySectionView.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 07-03-22.
//

import UIKit

class VerticalGallerySectionView: UIView {
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 6
        return stackView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "GALLERY"
        label.font = .fontTheme(size: 16)
        label.textColor = .grayScaleOn
        label.numberOfLines = 3
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addImage(_ imageName: String, height: CGFloat) {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: imageName)
        stackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func setupView() {
        addSubview(titleLabel)
        addSubview(stackView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -20),

            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
