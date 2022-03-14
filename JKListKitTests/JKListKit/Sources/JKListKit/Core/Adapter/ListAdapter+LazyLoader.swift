//
//  File.swift
//  
//
//  Created by Juan vasquez on 14-03-22.
//

import Foundation
import UIKit

//MARK: - Lazy loading logic

extension ListAdapter {

    var loadNextSection: Bool {
        guard let listView = listView else { return false }
        let haveSpacingForNextSection = listView.contentHeight < listView.frameHeight
        return haveSpacingForNextSection
    }

    var hasComponentToLoad: Bool {
        return self.loadedSections.count < self.currentSections.count
    }

    func needExecuteLazyLoading(scrollOffsetY: CGFloat) -> Bool {
        guard let listView = listView else { return false }
        let scrollFocusOnBottom = listView.contentHeight - listView.scrollLoadResistence
        let scrollBreakTheResistence = (scrollOffsetY + listView.frameHeight) >= scrollFocusOnBottom
        return hasComponentToLoad && scrollBreakTheResistence
    }

    func setupOberveForLazyLoad() {
        guard let listView = listView else { return }
        listView.contentOffsetChanged = { [weak self] offSet in
            guard let self = self else { return }
            self.executeLazyLoad(scrollOffsetY: offSet)
        }
    }

    func executeLazyLoad(scrollOffsetY: CGFloat) {
        guard let listView = listView else { return }
        guard needExecuteLazyLoading(scrollOffsetY: scrollOffsetY) else { return }
        let numberOfSectionToLoad = listView.preloadSections
        let sectionsToLoad = currentSections
            .suffix(from: loadedSections.count)
            .prefix(numberOfSectionToLoad)

        sectionsToLoad.forEach {
            insertSectionInContainer($0)
            loadedSections.append($0)
        }
    }
}
