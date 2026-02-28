import Foundation

struct EcoItem: Identifiable, Hashable, Codable {
    let id: UUID
    let name: String
    let icon: String
    let category: String
    let disposalType: DisposalType
    
    
    let environmentalImpact: String
    let decompositionTime: String
    let carbonFootprint: String
    
   
    let reuseIdeas: [ReuseIdea]
    
    
    let disposalInstructions: String
    let recyclingTips: [String]
    
    init(
        id: UUID = UUID(),
        name: String,
        icon: String,
        category: String,
        disposalType: DisposalType,
        environmentalImpact: String,
        decompositionTime: String,
        carbonFootprint: String,
        reuseIdeas: [ReuseIdea],
        disposalInstructions: String,
        recyclingTips: [String]
    ) {
        self.id = id
        self.name = name
        self.icon = icon
        self.category = category
        self.disposalType = disposalType
        self.environmentalImpact = environmentalImpact
        self.decompositionTime = decompositionTime
        self.carbonFootprint = carbonFootprint
        self.reuseIdeas = reuseIdeas
        self.disposalInstructions = disposalInstructions
        self.recyclingTips = recyclingTips
    }
}

struct ReuseIdea: Identifiable, Hashable, Codable {
    let id: UUID
    let title: String
    let description: String
    let difficulty: ReuseDifficulty
    let icon: String
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String,
        difficulty: ReuseDifficulty,
        icon: String
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.difficulty = difficulty
        self.icon = icon
    }
}

enum ReuseDifficulty: String, Codable, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case advanced = "Advanced"
}
