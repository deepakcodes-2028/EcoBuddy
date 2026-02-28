import SwiftUI

enum DisposalType: String, CaseIterable, Codable {
    case recyclable = "Recyclable"
    case organic = "Organic"
    case hazardous = "Hazardous"
    case general = "General Waste"
    
    var color: Color {
        switch self {
        case .recyclable: return .blue
        case .organic: return .green
        case .hazardous: return .red
        case .general: return .gray
        }
    }
    
    var icon: String {
        switch self {
        case .recyclable: return "arrow.3.trianglepath"
        case .organic: return "leaf.fill"
        case .hazardous: return "exclamationmark.triangle.fill"
        case .general: return "trash.fill"
        }
    }
    
    var binDescription: String {
        switch self {
        case .recyclable: return "Blue Bin - Recyclables"
        case .organic: return "Green Bin - Compost"
        case .hazardous: return "Red Bin - Hazardous"
        case .general: return "Black Bin - General Waste"
        }
    }
}
