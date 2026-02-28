import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @State private var showContent = false
    @State private var pulseAnimation = false
    
    var body: some View {
        ZStack {
            AnimatedBackgroundView()
            
            VStack(spacing: 0) {
                animatedHeader
                
                ScrollView {
                    VStack(spacing: 24) {
                        heroSection
                        navigationCards
                        quickStatsSection
                    }
                    .padding()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(viewModel.appName)
                    .font(.headline)
                    .foregroundStyle(.primary)
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button {
                    viewModel.toggleInfo()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundStyle(
                            LinearGradient(
                                colors: [AppTheme.primaryGreen, AppTheme.secondaryBlue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .scaleEffect(pulseAnimation ? 1.1 : 1.0)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulseAnimation)
                }
            }
        }
        .sheet(isPresented: $viewModel.showingInfo) {
            AboutView()
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) {
                showContent = true
            }
            pulseAnimation = true
        }
    }
    
    var animatedHeader: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [AppTheme.primaryGreen.opacity(0.3), AppTheme.secondaryBlue.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                    .blur(radius: 10)
                
                Image(systemName:"leaf.fill")
                    .font(.system(size:50))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [AppTheme.primaryGreen, AppTheme.secondaryBlue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .rotationEffect(.degrees(showContent ? 0 : -180))
                    .scaleEffect(showContent ? 1 : 0.5)
            }
            .padding(.top, 20)
            
            Text(viewModel.appTagline)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .opacity(showContent ? 1 : 0)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 10)
    }
    
    var heroSection: some View {
        VStack(spacing: 12) {
            Text("Make a Difference")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [AppTheme.primaryGreen, AppTheme.secondaryBlue],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Every small action counts toward a sustainable future")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: AppTheme.cardShadow, radius: 15, y: 8)
        )
        .scaleEffect(showContent ? 1 : 0.8)
        .opacity(showContent ? 1 : 0)
        .offset(y: showContent ? 0 : 20)
    }
    
    var navigationCards: some View {
        VStack(spacing: 16) {
            // Browse Items
            NavigationLink(destination: BrowseItemsView()) {
                EnhancedNavigationCard(
                    icon: "magnifyingglass",
                    title: "Browse Items",
                    subtitle: "Learn about everyday objects",
                    gradient: [AppTheme.secondaryBlue, Color.cyan],
                    delay: 0.2
                )
            }
            .opacity(showContent ? 1 : 0)
            .offset(x: showContent ? 0 : -50)
            
            // Play & Learn (NOW GOES TO PlayLearnView, NOT DIRECTLY TO GAME)
            NavigationLink(destination: PlayLearnView()) {
                EnhancedNavigationCard(
                    icon: "gamecontroller.fill",
                    title: "Play & Learn",
                    subtitle: "Fun eco-friendly games",
                    gradient: [AppTheme.primaryGreen, Color.mint],
                    delay: 0.4
                )
            }
            .opacity(showContent ? 1 : 0)
            .offset(x: showContent ? 0 : 50)
        }
    }
    
    var quickStatsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Quick Facts")
                .font(.headline)
                .padding(.horizontal)
            
            HStack(spacing: 12) {
                EnhancedStatCard(
                    number: "\(EcoItemsData.allItems.count)",
                    label: "Items",
                    icon: "cube.box.fill",
                    color: AppTheme.secondaryBlue,
                    delay: 0.6
                )
                
                EnhancedStatCard(
                    number: "4",
                    label: "Bin Types",
                    icon: "trash.fill",
                    color: AppTheme.primaryGreen,
                    delay: 0.7
                )
                
                EnhancedStatCard(
                    number: "3",
                    label: "Levels",
                    icon: "gamecontroller.fill",
                    color: AppTheme.accentOrange,
                    delay: 0.8
                )
            }
            .padding(.horizontal)
        }
        .opacity(showContent ? 1 : 0)
        .offset(y: showContent ? 0 : 30)
    }
}

// Enhanced Navigation Card Component
struct EnhancedNavigationCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let gradient: [Color]
    let delay: Double
    
    @State private var isPressed = false
    @State private var showContent = false
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: gradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 70, height: 70)
                    .shadow(color: gradient[0].opacity(0.5), radius: 10, y: 5)
                
                Image(systemName: icon)
                    .font(.system(size: 28))
                    .foregroundStyle(.white)
            }
            .scaleEffect(isPressed ? 0.9 : 1.0)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(
                    LinearGradient(
                        colors: gradient,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .fontWeight(.semibold)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: AppTheme.cardShadow, radius: isPressed ? 5 : 15, y: isPressed ? 2 : 8)
        )
        .scaleEffect(isPressed ? 0.97 : 1.0)
        .onAppear {
            withAnimation(.easeOut(duration: 0.6).delay(delay)) {
                showContent = true
            }
        }
    }
}

// Enhanced Stat Card Component (NO ROTATION)
struct EnhancedStatCard: View {
    let number: String
    let label: String
    let icon: String
    let color: Color
    let delay: Double
    
    @State private var showContent = false
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.15))
                    .frame(width: 60, height: 60)
                
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(color)
            }
            
            Text(number)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(color)
            
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .shadow(color: AppTheme.cardShadow, radius: 10, y: 5)
        )
        .scaleEffect(showContent ? 1 : 0.5)
        .opacity(showContent ? 1 : 0)
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7).delay(delay)) {
                showContent = true
            }
        }
    }
}

