import SwiftUI

struct AnimatedGameBackground: View {
    @State private var cloudOffset1: CGFloat = -150
    @State private var cloudOffset2: CGFloat = -280
    @State private var cloudOffset3: CGFloat = -80
    @State private var sunRotation:  Double   = 0
    @State private var skyPhase:     Double   = 0
    @State private var grassPositions: [CGPoint] = []

    var body: some View {
        GeometryReader { geo in
            let grassLine = geo.size.height * 0.44

            ZStack {
            
                skyLayer
                    .zIndex(0)

                grassGround(geo: geo, grassLine: grassLine)
                    .zIndex(1)

                grassTuftsLayer(geo: geo, grassLine: grassLine)
                    .zIndex(2)

                mountainsLayer(geo: geo, grassLine: grassLine)
                    .zIndex(3)

                treesLayer(geo: geo, grassLine: grassLine)
                    .zIndex(4)

                sunLayer(geo: geo, grassLine: grassLine)
                    .zIndex(5)

                cloudsLayer(geo: geo, grassLine: grassLine)
                    .zIndex(6)
            }
            .onAppear {
                generateGrassPositions(geo: geo, grassLine: grassLine)
                startAnimations(screenWidth: geo.size.width)
            }
            .onChange(of: geo.size) { _, newSize in
                let newGrassLine = newSize.height * 0.44
                grassPositions = []
                generateGrassPositions(geo: geo, grassLine: newGrassLine)
            }
        }
    }

    var skyLayer: some View {
        LinearGradient(
            colors: [
                Color(red: 0.53, green: 0.81, blue: 0.98),
                Color(red: 0.68, green: 0.85, blue: 0.92 + sin(skyPhase) * 0.04),
                Color(red: 0.78, green: 0.90, blue: 0.95)
            ],
            startPoint: .top,
            endPoint: .center
        )
        .ignoresSafeArea()
    }

    func sunLayer(geo: GeometryProxy, grassLine: CGFloat) -> some View {
        let sunSize:  CGFloat = min(geo.size.width * 0.13, 70)
        let glowSize: CGFloat = sunSize * 2.0

        let sunY: CGFloat = grassLine * 0.30
        let sunX: CGFloat = geo.size.width - sunSize * 1.2

        return ZStack {
            Circle()
                .fill(RadialGradient(
                    colors: [Color.yellow.opacity(0.35), Color.yellow.opacity(0.10), Color.clear],
                    center: .center, startRadius: sunSize * 0.3, endRadius: sunSize))
                .frame(width: glowSize, height: glowSize)

            Circle()
                .fill(Color(red: 1.0, green: 0.92, blue: 0.30))
                .frame(width: sunSize, height: sunSize)
                .overlay(Circle().stroke(Color(red: 1.0, green: 0.85, blue: 0.20),
                                         lineWidth: max(1.5, sunSize * 0.04)))
        }
        .rotationEffect(.degrees(sunRotation))
        .position(x: sunX, y: sunY)
    }

    func cloudsLayer(geo: GeometryProxy, grassLine: CGFloat) -> some View {
        let cloudW: CGFloat = min(geo.size.width * 0.30, 140)
        let cloudH: CGFloat = cloudW * 0.33

        return ZStack {
            cloudShape(opacity: 0.90, width: cloudW, height: cloudH)
                .position(x: cloudOffset1, y: grassLine * 0.13)

            cloudShape(opacity: 0.85, width: cloudW * 0.85, height: cloudH * 0.85)
                .position(x: cloudOffset2, y: grassLine * 0.22)

            cloudShape(opacity: 0.80, width: cloudW * 0.75, height: cloudH * 0.75)
                .position(x: cloudOffset3, y: grassLine * 0.32)
        }
    }

    func cloudShape(opacity: Double, width: CGFloat, height: CGFloat) -> some View {
        HStack(spacing: -height * 0.28) {
            Circle().fill(Color.white.opacity(opacity))
            Circle().fill(Color.white.opacity(opacity)).scaleEffect(1.30)
            Circle().fill(Color.white.opacity(opacity))
            Circle().fill(Color.white.opacity(opacity)).scaleEffect(0.90)
        }
        .frame(width: width, height: height)
    }

    func mountainsLayer(geo: GeometryProxy, grassLine: CGFloat) -> some View {
        let w = geo.size.width
        let mH = grassLine * 0.55
        let mW = w * 0.32

        return ZStack {
            Triangle()
                .fill(Color(red: 0.55, green: 0.50, blue: 0.65))
                .frame(width: mW * 0.90, height: mH * 0.82)
                .position(x: w * 0.13, y: grassLine - mH * 0.82 / 2)

            Triangle()
                .fill(Color(red: 0.58, green: 0.53, blue: 0.68))
                .frame(width: mW, height: mH)
                .position(x: w * 0.33, y: grassLine - mH / 2)

            Triangle()
                .fill(Color(red: 0.60, green: 0.55, blue: 0.70))
                .frame(width: mW * 0.88, height: mH * 0.85)
                .position(x: w * 0.55, y: grassLine - mH * 0.85 / 2)

            Triangle()
                .fill(Color(red: 0.62, green: 0.57, blue: 0.72))
                .frame(width: mW * 0.70, height: mH * 0.68)
                .position(x: w * 0.75, y: grassLine - mH * 0.68 / 2)

            Triangle()
                .fill(Color(red: 0.63, green: 0.58, blue: 0.73))
                .frame(width: mW * 0.60, height: mH * 0.55)
                .position(x: w * 0.92, y: grassLine - mH * 0.55 / 2)
        }
    }

    func treesLayer(geo: GeometryProxy, grassLine: CGFloat) -> some View {
        let treeScale = min(geo.size.width / 393.0, 1.6)

        return ZStack {
            treeWithBushAndFlower
                .scaleEffect(treeScale * 0.95)
                .position(x: geo.size.width * 0.09,  y: grassLine - 2)

            treeWithBushAndFlower
                .scaleEffect(treeScale * 1.05)
                .position(x: geo.size.width * 0.30,  y: grassLine - 2)

            treeWithBushAndFlower
                .scaleEffect(treeScale * 0.90)
                .position(x: geo.size.width * 0.58,  y: grassLine - 2)

            treeWithBushAndFlower
                .scaleEffect(treeScale * 1.00)
                .position(x: geo.size.width * 0.82,  y: grassLine - 2)
        }
    }

    var treeWithBushAndFlower: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 0.45, green: 0.30, blue: 0.20))
                .frame(width: 12, height: 30)
                .offset(y: 15)

            Circle()
                .fill(Color(red: 0.25, green: 0.55, blue: 0.25))
                .frame(width: 50, height: 50)
                .overlay(Circle()
                    .fill(Color(red: 0.30, green: 0.60, blue: 0.30))
                    .frame(width: 35, height: 35)
                    .offset(x: -5, y: -5))

            Ellipse()
                .fill(Color(red: 0.28, green: 0.50, blue: 0.22))
                .frame(width: 35, height: 20)
                .offset(y: 35)

            Circle()
                .fill(Color(red: 0.32, green: 0.54, blue: 0.26))
                .frame(width: 12, height: 12)
                .offset(x: -8, y: 30)

            Circle()
                .fill(Color(red: 0.32, green: 0.54, blue: 0.26))
                .frame(width: 12, height: 12)
                .offset(x: 8, y: 30)

            ZStack {
                ForEach(0..<5, id: \.self) { i in
                    Circle()
                        .fill(Color(red: 1.0, green: 0.4, blue: 0.5))
                        .frame(width: 5, height: 5)
                        .offset(x: 8 * cos(Double(i) * 2 * .pi / 5),
                                y: 8 * sin(Double(i) * 2 * .pi / 5))
                }
                Circle()
                    .fill(Color(red: 1.0, green: 0.8, blue: 0.2))
                    .frame(width: 4, height: 4)
            }
            .offset(x: 10, y: 28)
        }
    }

    func grassGround(geo: GeometryProxy, grassLine: CGFloat) -> some View {
        VStack(spacing: 0) {
            Color.clear.frame(height: grassLine)
            Rectangle()
                .fill(LinearGradient(
                    colors: [
                        Color(red: 0.40, green: 0.65, blue: 0.25),
                        Color(red: 0.35, green: 0.60, blue: 0.22)
                    ],
                    startPoint: .top, endPoint: .bottom))
        }
    }

    func grassTuftsLayer(geo: GeometryProxy, grassLine: CGFloat) -> some View {
        ZStack {
            ForEach(0..<grassPositions.count, id: \.self) { i in
                grassTuft.position(grassPositions[i])
            }
        }
    }

    func generateGrassPositions(geo: GeometryProxy, grassLine: CGFloat) {
        guard grassPositions.isEmpty else { return }
        let count = Int(geo.size.width * geo.size.height / 14000)
        let safeBottom = geo.size.height * 0.82
        grassPositions = (0..<max(15, count)).map { _ in
            CGPoint(
                x: CGFloat.random(in: 24...(geo.size.width  - 24)),
                y: CGFloat.random(in: (grassLine + 10)...safeBottom)
            )
        }
    }

    var grassTuft: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 0.30, green: 0.50, blue: 0.20))
                .frame(width: 3, height: 12)
            Rectangle()
                .fill(Color(red: 0.28, green: 0.48, blue: 0.18))
                .frame(width: 3, height: 8)
                .offset(x: -3, y: -2)
            Rectangle()
                .fill(Color(red: 0.32, green: 0.52, blue: 0.22))
                .frame(width: 3, height: 10)
                .offset(x: 3, y: -4)
        }
    }

    func startAnimations(screenWidth: CGFloat) {
        let target = screenWidth + 160

        withAnimation(.linear(duration: 28).repeatForever(autoreverses: false)) { cloudOffset1 = target }
        withAnimation(.linear(duration: 34).repeatForever(autoreverses: false)) { cloudOffset2 = target }
        withAnimation(.linear(duration: 40).repeatForever(autoreverses: false)) { cloudOffset3 = target }
        withAnimation(.linear(duration: 60).repeatForever(autoreverses: false)) { sunRotation  = 360 }
        withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) { skyPhase = .pi * 2 }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.move(to:    CGPoint(x: rect.midX, y: rect.minY))
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        p.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        p.closeSubpath()
        return p
    }
}


