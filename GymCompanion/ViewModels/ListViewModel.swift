//
//  ListViewModel.swift
//  GymCompanion
//
//  Created by Fernando Brito on 03/09/23.
//

import Foundation

protocol NameFilter {
    var name: String { get }
}

class ListViewModel<T> {
    public var renderList: [T] = []

    init(renderList: [T] = []) {
        addElements(renderList)
    }

    public func addElements(_ newElements: [T]) {
        renderList += newElements
    }

    public func getNumberOfRows() -> Int {
        return renderList.count
    }

    public func getElement(by indexPath: IndexPath) -> T {
        return renderList[indexPath.row]
    }
}

class SearchListViewModel<T: NameFilter>: ListViewModel<T> {
    private var fullList: [T] = []

    override func addElements(_ newElements: [T]) {
        super.addElements(newElements)

        fullList = newElements
    }

    public func onChangeSearchText(searchText: String) {
        let sanitizedText = searchText.lowercased()

        if sanitizedText == "" {
            renderList = fullList
        } else {
            renderList = fullList.filter { element in
                element.name.contains(sanitizedText)
            }
        }
    }
}
