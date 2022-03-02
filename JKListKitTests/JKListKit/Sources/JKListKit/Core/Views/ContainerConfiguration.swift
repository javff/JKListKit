//
//  ContainerConfiguration.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import Foundation
import UIKit

public struct ContainerConfiguration {
    public let spacing: CGFloat
    public let lateralSpacing: CGFloat
    public let topInset: CGFloat
    public let bottomInset: CGFloat

    public init(spacing: CGFloat,
                 lateralSpacing: CGFloat = .zero,
                topInset: CGFloat = .zero,
                bottomInset: CGFloat = .zero) {
        self.spacing = spacing
        self.lateralSpacing = lateralSpacing
        self.topInset = topInset
        self.bottomInset = bottomInset
    }
}
