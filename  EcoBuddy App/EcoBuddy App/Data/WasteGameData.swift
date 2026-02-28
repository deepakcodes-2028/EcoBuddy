import Foundation
import SwiftUI

struct WasteGameData {

    static let levels = [
        GameLevel(levelNumber: 1, duration: 60, wasteCount: 5,  scoreMultiplier: 1),
        GameLevel(levelNumber: 2, duration: 45, wasteCount: 7,  scoreMultiplier: 2),
        GameLevel(levelNumber: 3, duration: 30, wasteCount: 10, scoreMultiplier: 3)
    ]

    static let wasteTemplates: [(String, String, WasteCategory)] = [
            //organic waste
        ("banana_pixel",  "Banana",  .organic),
        ("apple_pixel",   "Apple",   .organic),
        ("carrot_pixel",  "Carrot",  .organic),
        ("leaves_pixel",  "Leaves",  .organic),
           //recycle waste
        ("bottle_pixel",  "Bottle",  .recyclable),
        ("paper_pixel",   "Paper",   .recyclable),
        ("can_pixel",     "Can",     .recyclable),
        ("box_pixel",     "Box",     .recyclable),
          // electronic waste
        ("wires_pixel", "Wires", .electronic),
        ("brokenlaptop_pixel","Broken laptop",.electronic),
        ("bulb_pixel",    "Bulb",    .electronic),
        ("battery_pixel", "Battery", .electronic),
         // General waste
        ("dogshit_pixel", "Dogshit", .general),
        ("chocolatewrapper_pixel", "Chocolate Wrappers", .general),
        ("spoon_pixel",   "Spoon",   .general),
        ("tissue_pixel",  "Tissue",  .general)
    ]

    // MARK: - Generate Waste Items
    static func generateWasteItems(
        count:     Int,
        spawnMinX: CGFloat,
        spawnMaxX: CGFloat,
        spawnMinY: CGFloat,
        spawnMaxY: CGFloat
    ) -> [WasteItem] {

        var items: [WasteItem] = []
        let shuffled = wasteTemplates.shuffled()

        for i in 0..<min(count, shuffled.count) {
            let template = shuffled[i]
            var pos      = randomPoint(minX: spawnMinX, maxX: spawnMaxX,
                                       minY: spawnMinY, maxY: spawnMaxY)
           
            for _ in 0..<60 {
                let candidate = randomPoint(minX: spawnMinX, maxX: spawnMaxX,
                                            minY: spawnMinY, maxY: spawnMaxY)
                let tooClose = items.contains {
                    let dx = $0.position.x - candidate.x
                    let dy = $0.position.y - candidate.y
                    return sqrt(dx*dx + dy*dy) < 70
                }
                if !tooClose { pos = candidate; break }
            }

            items.append(WasteItem(
                name:      template.1,
                imageName: template.0,
                category:  template.2,
                position:  pos
            ))
        }
        return items
    }


    

    static func generateRandomPosition(
        avoiding existing: [WasteItem],
        spawnMinX: CGFloat,
        spawnMaxX: CGFloat,
        spawnMinY: CGFloat,
        spawnMaxY: CGFloat
    ) -> CGPoint {
        for _ in 0..<60 {
            let candidate = randomPoint(minX: spawnMinX, maxX: spawnMaxX,
                                        minY: spawnMinY, maxY: spawnMaxY)
            let tooClose = existing.contains {
                guard !$0.isCollected else { return false }
                let dx = $0.position.x - candidate.x
                let dy = $0.position.y - candidate.y
                return sqrt(dx*dx + dy*dy) < 70
            }
            if !tooClose { return candidate }
        }
        // Safe fallback — middle of spawn area
        return CGPoint(x: (spawnMinX + spawnMaxX) / 2,
                       y: (spawnMinY + spawnMaxY) / 2)
    }

    
    private static func randomPoint(minX: CGFloat, maxX: CGFloat,
                                    minY: CGFloat, maxY: CGFloat) -> CGPoint {
        CGPoint(
            x: CGFloat.random(in: minX...maxX),
            y: CGFloat.random(in: minY...maxY)
        )
    }
}
