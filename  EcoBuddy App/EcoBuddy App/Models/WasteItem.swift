import SwiftUI

enum WasteCategory: String, CaseIterable {
    case electronic = "Electronic"
    case recyclable = "Recyclable"
    case organic = "Organic"
    case general = "General"
    
    var binColor: Color {
        switch self {
        case .electronic: return Color(red: 0.8, green: 0.2, blue: 0.2)
        case .recyclable: return Color(red: 0.2, green: 0.4, blue: 0.8)
        case .organic: return Color(red: 0.3, green: 0.7, blue: 0.3)
        case .general: return Color(red: 0.3, green: 0.3, blue: 0.3)
        }
    }
    
    var binIcon: String {
        switch self {
        case .electronic: return "⚡"
        case .recyclable: return "♻️"
        case .organic: return "🌱"
        case .general: return "✖️"
        }
    }
}

struct WasteItem: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let imageName: String  // CHANGED: from emoji to imageName
    let category: WasteCategory
    var position: CGPoint
    var isCollected: Bool = false
    var isHeld: Bool = false
    
    static func == (lhs: WasteItem, rhs: WasteItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func overlaps(with other: WasteItem, minDistance: CGFloat = 60) -> Bool {
        let dx = position.x - other.position.x
        let dy = position.y - other.position.y
        let distance = sqrt(dx * dx + dy * dy)
        return distance < minDistance
    }
}

struct GameLevel {
    let levelNumber: Int
    let duration: Int
    let wasteCount: Int
    let scoreMultiplier: Int
    
    var displayName: String {
        switch levelNumber {
        case 1: return "LEVEL 1 - EASY"
        case 2: return "LEVEL 2 - MEDIUM"
        case 3: return "LEVEL 3 - HARD"
        default: return "LEVEL \(levelNumber)"
        }
    }
}

