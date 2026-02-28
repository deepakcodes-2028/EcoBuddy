import SwiftUI

struct GameLayout {
    let size: CGSize

    var grassStartY:    CGFloat { size.height * 0.44 }
    var binStripHeight: CGFloat { max(size.height * 0.155, 110) }
    var grassEndY:      CGFloat { size.height - binStripHeight }

    var charWidth:  CGFloat { min(size.width * 0.20, 110) }
    var charHeight: CGFloat { charWidth * 1.5 }

    var itemSize: CGFloat { min(size.width * 0.105, 55) }

    var playerStart: CGPoint {
        CGPoint(x: size.width * 0.50,
                y: grassStartY + (grassEndY - grassStartY) * 0.38)
    }

    var dragMinX: CGFloat { size.width  * 0.05 }
    var dragMaxX: CGFloat { size.width  * 0.95 }
    var dragMinY: CGFloat { grassStartY + charHeight * 0.25 }
    var dragMaxY: CGFloat { grassEndY   - charHeight * 0.25 }

    var spawnMinX: CGFloat { size.width  * 0.07 }
    var spawnMaxX: CGFloat { size.width  * 0.93 }
    var spawnMinY: CGFloat { grassStartY + itemSize * 1.2 }
    var spawnMaxY: CGFloat { grassEndY - itemSize * 3.5 }

    var binDropY:   CGFloat { grassEndY - charHeight * 0.6 }
    var binCount:   Int     { WasteCategory.allCases.count }
    var binWidth:   CGFloat { size.width / CGFloat(binCount) }
}

#if DEBUG
struct PreviewScoreboard: View {
    var body: some View {
        HStack(spacing: 0) {
            scorePill("SCORE:", "0000",  .yellow)
            Spacer()
            scorePill("TIME:",  "01:00", .white)
            Spacer()
            scorePill("LEVEL:", "1",     .cyan)
        }
        .padding(.vertical, 14)
        .background(Color(red: 0.2, green: 0.2, blue: 0.2))
    }

    func scorePill(_ label: String, _ value: String, _ color: Color) -> some View {
        HStack(spacing: 6) {
            Text(label).font(.system(size: 14, weight: .bold, design: .monospaced)).foregroundColor(.white)
            Text(value) .font(.system(size: 14, weight: .bold, design: .monospaced)).foregroundColor(color)
        }.padding(.horizontal, 14)
    }
}

struct WasteCollectionView_Preview: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                let lay = GameLayout(size: geo.size)
                ZStack {
                    AnimatedGameBackground().ignoresSafeArea().allowsHitTesting(false)
                    VStack(spacing: 0) {
                        PreviewScoreboard()
                        Spacer()
                        BinsStrip(layout: lay)
                    }
                }
            }
            .navigationTitle("Waste Collection")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#endif

struct BinsStrip: View {
    let layout: GameLayout

    var body: some View {
        HStack(spacing: 8) {
            ForEach(WasteCategory.allCases, id: \.self) { cat in
                VStack(spacing: 4) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(cat.binColor.opacity(0.8))
                        .frame(height: 8)
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(cat.binColor)
                            .frame(height: layout.binStripHeight * 0.45)
                        Text(cat.binIcon)
                            .font(.system(size: min(layout.size.width * 0.065, 34)))
                    }
                    Text(cat.rawValue)
                        .font(.system(size: min(layout.size.width * 0.022, 12),
                                      weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(Rectangle().fill(Color(red: 0.6, green: 0.5, blue: 0.4)))
    }
}

struct WasteCollectionView: View {
    @Environment(\.dismiss) var dismiss

    @State private var currentLevel    = 0
    @State private var score           = 0
    @State private var timeRemaining   = 60
    @State private var wasteItems:     [WasteItem] = []
    @State private var playerPosition  = CGPoint(x: 196, y: 500)
    @State private var heldWasteId:    UUID?
    @State private var gameOver        = false
    @State private var showVictory     = false
    @State private var gameTimer:      Timer?
    @State private var showFeedback    = false
    @State private var feedbackMessage = ""
    @State private var feedbackColor   = Color.green
    @State private var lastDropTime    = Date.distantPast
    @State private var layout:         GameLayout?

    var currentGameLevel: GameLevel { WasteGameData.levels[currentLevel] }
    var isLastLevel: Bool { currentLevel >= WasteGameData.levels.count - 1 }

    var body: some View {
        GeometryReader { geo in
            let lay = GameLayout(size: geo.size)

            ZStack {
                AnimatedGameBackground()
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
                    .zIndex(0)

                if !gameOver && !showVictory {
                    VStack(spacing: 0) {
                        scoreboardView
                            .zIndex(10)

                        ZStack {
                            ForEach(wasteItems) { item in
                                if !item.isCollected && item.id != heldWasteId {
                                    Image(item.imageName)
                                        .resizable()
                                        .interpolation(.none)
                                        .scaledToFit()
                                        .frame(width: lay.itemSize, height: lay.itemSize)
                                        .shadow(color: .black.opacity(0.3), radius: 2, y: 2)
                                        .position(item.position)
                                        .zIndex(1)
                                        .onTapGesture(count: 2) {
                                            pickUpWaste(item)
                                        }
                                }
                            }

                            Image("TrashCollectorboy")
                                .resizable()
                                .interpolation(.none)
                                .scaledToFit()
                                .frame(width: lay.charWidth, height: lay.charHeight)
                                .position(playerPosition)
                                .zIndex(playerPosition.y < lay.grassEndY - 60 ? 5 : 0.5)
                                .onTapGesture(count: 2) {
                                    dropHeldWaste()
                                }

                            if let heldId = heldWasteId,
                               let held   = wasteItems.first(where: { $0.id == heldId }) {
                                Image(held.imageName)
                                    .resizable()
                                    .interpolation(.none)
                                    .scaledToFit()
                                    .frame(width: lay.itemSize * 0.85,
                                           height: lay.itemSize * 0.85)
                                    .position(
                                        x: playerPosition.x + lay.charWidth  * 0.48,
                                        y: playerPosition.y - lay.charHeight * 0.08
                                    )
                                    .zIndex(10)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in handleDrag(at: v.location, layout: lay) }
                        )

                        BinsStrip(layout: lay).zIndex(100)
                    }

                } else if gameOver    { gameOverView .zIndex(50) }
                  else if showVictory { victoryView  .zIndex(50) }

                if showFeedback { feedbackOverlay.zIndex(1000) }
            }
            .onAppear {
                layout = lay
                startLevel(layout: lay)
            }
            .onChange(of: geo.size) { _, newSize in
                let newLay = GameLayout(size: newSize)
                layout = newLay
                playerPosition = newLay.playerStart
                respawnItems(layout: newLay)
            }
        }
        .navigationTitle("Waste Collection")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear { stopTimer() }
    }

    var scoreboardView: some View {
        HStack(spacing: 0) {
            scorePill("SCORE:", String(format: "%04d", score), .yellow)
            Spacer()
            scorePill(
                "TIME:",
                String(format: "%02d:%02d", timeRemaining / 60, timeRemaining % 60),
                timeRemaining < 10 ? .red : .white
            )
            Spacer()
            scorePill("LEVEL:", "\(currentLevel + 1)", .cyan)
        }
        .padding(.vertical, 14)
        .background(
            ZStack {
                Rectangle().fill(Color(red: 0.2, green: 0.2, blue: 0.2))
                VStack(spacing: 0) {
                    Rectangle().fill(Color(red: 0.4, green: 0.4, blue: 0.4)).frame(height: 4)
                    Spacer()
                    Rectangle().fill(Color.black).frame(height: 4)
                }
            }
        )
    }

    func scorePill(_ label: String, _ value: String, _ color: Color) -> some View {
        HStack(spacing: 6) {
            Text(label).font(.system(size: 14, weight: .bold, design: .monospaced)).foregroundColor(.white)
            Text(value) .font(.system(size: 14, weight: .bold, design: .monospaced)).foregroundColor(color)
        }.padding(.horizontal, 14)
    }

    var feedbackOverlay: some View {
        Text(feedbackMessage)
            .font(.system(size: 22, weight: .bold, design: .monospaced))
            .foregroundColor(.white)
            .padding(.horizontal, 18).padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 8).fill(feedbackColor)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 3))
            )
            .transition(.scale.combined(with: .opacity))
    }

    var gameOverView: some View {
        VStack(spacing: 20) {
            Text("⏰").font(.system(size: 70))
            Text("TIME'S UP!").font(.system(size: 28, weight: .bold, design: .monospaced))
            Text("SCORE: \(score)").font(.system(size: 22, weight: .bold, design: .monospaced))
            VStack(spacing: 10) {
                GameButton(title: "RETRY",      color: .blue)  { resetCurrentLevel() }
                if !isLastLevel {
                    GameButton(title: "NEXT LEVEL", color: .green) { nextLevel() }
                }
                GameButton(title: "EXIT", color: .gray) { dismiss() }
            }
        }
        .padding(36)
        .background(RoundedRectangle(cornerRadius: 12).fill(.white)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 4)))
        .padding()
    }

    var victoryView: some View {
        VStack(spacing: 20) {
            Text("🏆").font(.system(size: 70))
            Text(currentGameLevel.displayName)
                .font(.system(size: 22, weight: .bold, design: .monospaced))
            Text("CLEAR!")
                .font(.system(size: 28, weight: .bold, design: .monospaced))
            Text("SCORE: \(score)")
                .font(.system(size: 22, weight: .bold, design: .monospaced))

            if isLastLevel {
                VStack(spacing: 8) {
                    Text("🎉 CONGRATULATIONS! 🎉")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                    Text("You cleared all three levels!")
                        .font(.system(size: 14, weight: .semibold, design: .monospaced))
                        .multilineTextAlignment(.center)
                }
                VStack(spacing: 10) {
                    GameButton(title: "PLAY AGAIN", color: .blue) { resetGame() }
                    GameButton(title: "EXIT",       color: .gray) { dismiss() }
                }
            } else {
                VStack(spacing: 10) {
                    GameButton(title: "NEXT LEVEL", color: .green) { nextLevel() }
                    GameButton(title: "RETRY",      color: .blue)  { resetCurrentLevel() }
                    GameButton(title: "EXIT",       color: .gray)  { dismiss() }
                }
            }
        }
        .padding(36)
        .background(RoundedRectangle(cornerRadius: 12).fill(.white)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 4)))
        .padding()
    }

    func startLevel(layout lay: GameLayout) {
        stopTimer()
        
        timeRemaining  = currentGameLevel.duration
        heldWasteId    = nil
        playerPosition = lay.playerStart

        wasteItems = WasteGameData.generateWasteItems(
            count:     currentGameLevel.wasteCount,
            spawnMinX: lay.spawnMinX,
            spawnMaxX: lay.spawnMaxX,
            spawnMinY: lay.spawnMinY,
            spawnMaxY: lay.spawnMaxY
        )

        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            DispatchQueue.main.async {
                // ✅ FIX: Check victory BEFORE decrementing timer
                if self.checkLevelComplete() {
                    return  // Victory triggered, stop timer processing
                }
                
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.endGame()
                }
            }
        }
    }

    func respawnItems(layout lay: GameLayout) {
        wasteItems = wasteItems.map { item in
            guard !item.isCollected else { return item }
            let inBounds = (lay.spawnMinX...lay.spawnMaxX).contains(item.position.x)
                        && (lay.spawnMinY...lay.spawnMaxY).contains(item.position.y)
            if inBounds { return item }
            var moved = item
            moved.position = WasteGameData.generateRandomPosition(
                avoiding: wasteItems.filter { !$0.isCollected && $0.id != item.id },
                spawnMinX: lay.spawnMinX, spawnMaxX: lay.spawnMaxX,
                spawnMinY: lay.spawnMinY, spawnMaxY: lay.spawnMaxY
            )
            return moved
        }
    }

    func pickUpWaste(_ item: WasteItem) {
        guard !item.isCollected else { return }
        guard !gameOver && !showVictory else { return }
        guard heldWasteId == nil else { return }
        
        heldWasteId = item.id
    }

    func dropHeldWaste() {
        guard let id    = heldWasteId,
              let index = wasteItems.firstIndex(where: { $0.id == id }) else { return }
        
        wasteItems[index].position = playerPosition
        heldWasteId = nil
    }

    func handleDrag(at location: CGPoint, layout lay: GameLayout) {
        playerPosition = CGPoint(
            x: min(lay.dragMaxX, max(lay.dragMinX, location.x)),
            y: min(lay.dragMaxY, max(lay.dragMinY, location.y))
        )

        if heldWasteId != nil && playerPosition.y >= lay.binDropY {
            let now = Date()
            if now.timeIntervalSince(lastDropTime) > 0.5 {
                lastDropTime = now
                let binIndex = Int(playerPosition.x / lay.binWidth)
                
                if (0..<lay.binCount).contains(binIndex) {
                    let selectedBin = WasteCategory.allCases[binIndex]
                    processBinDrop(bin: selectedBin, layout: lay)
                }
            }
        }
    }

    func processBinDrop(bin: WasteCategory, layout lay: GameLayout) {
        guard let id    = heldWasteId,
              let index = wasteItems.firstIndex(where: { $0.id == id }) else { return }

        let waste = wasteItems[index]

        if waste.category == bin {
            // ✅ CORRECT BIN
            let points = 10 * currentGameLevel.scoreMultiplier
            score += points
            
            wasteItems[index].isCollected = true
            heldWasteId = nil
            showToast("✓ CORRECT!", color: .green)

            // ✅ FIX: Check victory immediately and aggressively
            checkAndTriggerVictory()
            
        } else {
            // ❌ WRONG BIN
            score = max(0, score - 5)
            
            var newPos = WasteGameData.generateRandomPosition(
                avoiding: wasteItems.filter { !$0.isCollected && $0.id != id },
                spawnMinX: lay.spawnMinX, spawnMaxX: lay.spawnMaxX,
                spawnMinY: lay.spawnMinY, spawnMaxY: lay.spawnMaxY
            )
            
            for _ in 0..<30 {
                let c = WasteGameData.generateRandomPosition(
                    avoiding: wasteItems.filter { !$0.isCollected && $0.id != id },
                    spawnMinX: lay.spawnMinX, spawnMaxX: lay.spawnMaxX,
                    spawnMinY: lay.spawnMinY, spawnMaxY: lay.spawnMaxY
                )
                let dx = c.x - waste.position.x
                let dy = c.y - waste.position.y
                if sqrt(dx*dx + dy*dy) > 100 { newPos = c; break }
            }
            
            wasteItems[index].position = newPos
            heldWasteId = nil
            showToast("✗ WRONG BIN!", color: .red)
        }
    }

    // ✅ NEW: Separate victory check function
    @discardableResult
    func checkLevelComplete() -> Bool {
        guard !gameOver && !showVictory else { return true }
        
        let allCollected = wasteItems.allSatisfy { $0.isCollected }
        if allCollected {
            stopTimer()
            showVictory = true
            return true
        }
        return false
    }

    // ✅ NEW: Aggressive immediate victory trigger
    func checkAndTriggerVictory() {
        // Check multiple times to ensure it triggers
        DispatchQueue.main.async {
            if self.wasteItems.allSatisfy({ $0.isCollected }) {
                self.stopTimer()
                self.showVictory = true
            }
        }
        
        // Backup check after tiny delay (insurance)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            if self.wasteItems.allSatisfy({ $0.isCollected }) && !self.showVictory {
                self.stopTimer()
                self.showVictory = true
            }
        }
    }

    func showToast(_ message: String, color: Color) {
        feedbackMessage = message
        feedbackColor   = color
        withAnimation { showFeedback = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation { self.showFeedback = false }
        }
    }

    func stopTimer() {
        gameTimer?.invalidate()
        gameTimer = nil
    }

    func nextLevel() {
        guard currentLevel < WasteGameData.levels.count - 1 else { return }
        
        currentLevel += 1
        showVictory = false
        gameOver    = false
        
        if let lay = layout { startLevel(layout: lay) }
    }

    func resetCurrentLevel() {
        gameOver    = false
        showVictory = false
        if let lay = layout { startLevel(layout: lay) }
    }

    func endGame() {
        stopTimer()
        withAnimation { gameOver = true }
    }

    func resetGame() {
        currentLevel = 0
        score        = 0
        gameOver     = false
        showVictory  = false
        if let lay = layout { startLevel(layout: lay) }
    }
}

struct GameButton: View {
    let title:  String
    let color:  Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
                .padding(.horizontal, 24).padding(.vertical, 12)
                .frame(minWidth: 200)
                .background(color)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 2))
        }
    }
}
