import Foundation

@Observable
class BrowseViewModel {
    var searchText: String = ""
    var selectedCategory: String = "All"
    
    var filteredItems: [EcoItem] {
        
        let items = EcoItemsData.allItems
        
        let searchFiltered = searchText.isEmpty ? items : items.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.category.localizedCaseInsensitiveContains(searchText)
        }
        
        
        if selectedCategory == "All" {
            return searchFiltered
        } else {
            return searchFiltered.filter { $0.category == selectedCategory }
        }
    }
    
    var categories: [String] {
        ["All"] + Array(Set(EcoItemsData.allItems.map { $0.category })).sorted()
    }
}
