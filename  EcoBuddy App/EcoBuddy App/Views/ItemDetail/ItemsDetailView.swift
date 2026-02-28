import SwiftUI

struct ItemDetailView: View {
    let item: EcoItem
    @State private var selectedTab = 0
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            AnimatedBackgroundView()
            
            VStack(spacing: 0) {
                enhancedHeader
                animatedTabPicker
                tabContent
            }
        }
        .navigationTitle(item.name)
        .onAppear {
            withAnimation(.easeOut(duration: 0.6)) {
                showContent = true
            }
        }
    }
    
    var enhancedHeader: some View {
        VStack(spacing: 16) {
            ZStack {
              
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                item.disposalType.color.opacity(0.3),
                                item.disposalType.color.opacity(0.1),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: 80
                        )
                    )
                    .frame(width: 160, height: 160)
                    .blur(radius: 10)
                
                Image(systemName: item.icon)
                    .font(.system(size: 80))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [item.disposalType.color, item.disposalType.color.opacity(0.6)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .scaleEffect(showContent ? 1 : 0.5)
                    .rotationEffect(.degrees(showContent ? 0 : -180))
            }
            
            VStack(spacing: 8) {
                Text(item.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(showContent ? 1 : 0)
                
                HStack(spacing: 12) {
                    Label(item.category, systemImage: "tag.fill")
                        .font(.subheadline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(Color.secondary.opacity(0.1))
                        )
                        .foregroundStyle(.secondary)
                    
                    Label(item.disposalType.rawValue, systemImage: item.disposalType.icon)
                        .font(.subheadline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(item.disposalType.color.opacity(0.15))
                        )
                        .foregroundStyle(item.disposalType.color)
                }
                .opacity(showContent ? 1 : 0)
                .offset(y: showContent ? 0 : 10)
            }
        }
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [item.disposalType.color.opacity(0.1), Color.clear],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
    
    var animatedTabPicker: some View {
        HStack(spacing: 0) {
            EnhancedTabButton(
                title: "EcoLens",
                icon: "globe.americas.fill",
                color: AppTheme.accentOrange,
                isSelected: selectedTab == 0,
                delay: 0.2
            ) {
                withAnimation(.spring(response: 0.4)) {
                    selectedTab = 0
                }
            }
            
            EnhancedTabButton(
                title: "SecondLife",
                icon: "arrow.circlepath",
                color: AppTheme.primaryGreen,
                isSelected: selectedTab == 1,
                delay: 0.3
            ) {
                withAnimation(.spring(response: 0.4)) {
                    selectedTab = 1
                }
            }
            
            EnhancedTabButton(
                title: "TrashRight",
                icon: "trash.fill",
                color: item.disposalType.color,
                isSelected: selectedTab == 2,
                delay: 0.4
            ) {
                withAnimation(.spring(response: 0.4)) {
                    selectedTab = 2
                }
            }
        }
        .padding(.vertical, 4)
        .background(Color(red: 0.95, green: 0.95, blue: 0.97))
    }
    
    var tabContent: some View {
        Group {
            switch selectedTab {
            case 0:
                EcoLensView(item: item)
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .move(edge: .leading).combined(with: .opacity)
                    ))
            case 1:
                SecondLifeView(item: item)
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .move(edge: .leading).combined(with: .opacity)
                    ))
            case 2:
                TrashRightView(item: item)
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .move(edge: .leading).combined(with: .opacity)
                    ))
            default:
                EcoLensView(item: item)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// Enhanced Tab Button
struct EnhancedTabButton: View {
    let title: String
    let icon: String
    let color: Color
    let isSelected: Bool
    let delay: Double
    let action: () -> Void
    
    @State private var showContent = false
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(isSelected ? color : .secondary)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(isSelected ? .semibold : .regular)
                    .foregroundStyle(isSelected ? color : .secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? .white : Color.clear)
                    .shadow(color: isSelected ? color.opacity(0.3) : .clear, radius: 8, y: 4)
            )
            .scaleEffect(isSelected ? 1.05 : 1.0)
        }
        .scaleEffect(showContent ? 1 : 0.5)
        .opacity(showContent ? 1 : 0)
        .onAppear {
            withAnimation(.spring(response: 0.5).delay(delay)) {
                showContent = true
            }
        }
    }
}

