//
//  ContainerConfiguration.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import Foundation
import UIKit


/// The object that sets the spacing and insets for the ListView.
public struct ListViewConfiguration {
    public let spacing: CGFloat
    public let lateralSpacing: CGFloat
    public let topInset: CGFloat
    public let bottomInset: CGFloat


    ///  Init of ListViewConfiguration
    /// - Parameters:
    ///   - spacing: default CGFloatZero. Define spacing into 
    ///   - lateralSpacing: default is CGFloatZero. Spacing between sections.
    ///   - topInset: default CGFloatZero. add additional scroll area in the top of the content
    ///   - bottomInset: default CGFloatZero. add additional scroll area in the bottom of the content
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
