import SwiftUI

struct AppTheme {
    
    static let primaryGreen = Color(red: 0.2, green: 0.78, blue: 0.35)
    static let secondaryBlue = Color(red: 0.2, green: 0.6, blue: 0.86)
    static let accentOrange = Color(red: 1.0, green: 0.58, blue: 0.0)
    static let accentPurple = Color(red: 0.69, green: 0.32, blue: 0.87)
    
    static let backgroundGradientStart = Color(red: 0.95, green: 0.98, blue: 0.95)
    static let backgroundGradientEnd = Color(red: 0.92, green: 0.96, blue: 0.98)
    
   
    static let cardBackground = Color.white
    static let cardShadow = Color.black.opacity(0.08)
    
    static let textPrimary = Color.primary
    static let textSecondary = Color.secondary
    
    
    static let recyclableBlue = Color(red: 0.0, green: 0.48, blue: 0.8)
    static let organicGreen = Color(red: 0.2, green: 0.78, blue: 0.35)
    static let hazardousRed = Color(red: 0.96, green: 0.26, blue: 0.21)
    static let generalGray = Color(red: 0.56, green: 0.56, blue: 0.58)
}


struct AnimatedBackgroundView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    AppTheme.backgroundGradientStart,
                    AppTheme.backgroundGradientEnd
                ],
                startPoint: animate ? .topLeading : .bottomLeading,
                endPoint: animate ? .bottomTrailing : .topTrailing
            )
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.easeInOut(duration: 8).repeatForever(autoreverses: true)) {
                    animate.toggle()
                }
            }
            
            Circle()
                .fill(AppTheme.primaryGreen.opacity(0.1))
                .frame(width: 200, height: 200)
                .offset(x: animate ? -100 : 100, y: animate ? -150 : 150)
                .blur(radius: 20)
            
            Circle()
                .fill(AppTheme.secondaryBlue.opacity(0.1))
                .frame(width: 150, height: 150)
                .offset(x: animate ? 150 : -150, y: animate ? 200 : -200)
                .blur(radius: 15)
        }
    }
}

