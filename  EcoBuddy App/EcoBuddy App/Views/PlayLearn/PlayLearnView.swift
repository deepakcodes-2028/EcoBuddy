import SwiftUI

struct PlayLearnView: View {
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.95, green: 0.93, blue: 0.98),
                    Color(red: 0.98, green: 0.95, blue: 0.93)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 30) {
                    
                    headerSection
                    gameCard
                    benefitsSection
                    gameGuideSection   // ✅ Added Guide Section
                }
                .padding()
            }
        }
        .navigationTitle("Play & Learn")
        .onAppear {
            withAnimation(.easeOut(duration: 0.6)) {
                showContent = true
            }
        }
    }
    
    // MARK: - Header Section
    
    var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.purple.opacity(0.3), Color.orange.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .blur(radius: 10)
                
                Image(systemName: "gamecontroller.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.purple, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .scaleEffect(showContent ? 1 : 0.5)
            }
            
            VStack(spacing: 8) {
                Text("Learn While You Play")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Master eco-friendly habits through fun")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .opacity(showContent ? 1 : 0)
        }
    }
    
    // MARK: - Game Card
    
    var gameCard: some View {
        NavigationLink(destination: WasteCollectionView()) {
            HStack(spacing: 16) {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                colors: [Color.green, Color.mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 80, height: 80)
                        .shadow(color: Color.green.opacity(0.4), radius: 10, y: 5)
                    
                    Image(systemName: "trash.fill")
                        .font(.system(size: 35))
                        .foregroundStyle(.white)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Waste Collection")
                            .font(.headline)
                            .foregroundStyle(.primary)
                        
                        Spacer()
                        
                        Text("Fun")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(
                                Capsule()
                                    .fill(Color.green.opacity(0.2))
                            )
                            .foregroundStyle(.green)
                    }
                    
                    Text("Pick up waste and sort into bins")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.08), radius: 10, y: 5)
            )
        }
        .scaleEffect(showContent ? 1 : 0.9)
        .opacity(showContent ? 1 : 0)
    }
    
    // MARK: - Benefits Section
    
    var benefitsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Why Play?")
                .font(.headline)
            
            BenefitRow(icon: "brain.head.profile", text: "Learn through practice", color: .purple)
            BenefitRow(icon: "star.fill", text: "Earn high scores", color: .orange)
            BenefitRow(icon: "clock.fill", text: "Beat the timer", color: .blue)
            BenefitRow(icon: "leaf.fill", text: "Save the planet", color: .green)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: .black.opacity(0.08), radius: 10, y: 5)
        )
    }
    

    var gameGuideSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("How to Play ?")
                .font(.headline)
            
            GuideRow(icon: "target", text: "Objective: Collect eco waste and sort into correct bins before time runs out.")
            
            GuideRow(icon: "hand.draw", text: "Move: Drag anywhere on screen to move the character.")
            
            GuideRow(icon: "trash", text: "Pick Up: Double tap a waste item to collect it.")
            
            GuideRow(icon: "hand.point.up.left", text: "Drop: Double tap the character to drop the held waste.")
            
            GuideRow(icon: "arrow.triangle.2.circlepath", text: "Sorting: Drop waste into the correct matching bin.")
            
            GuideRow(icon: "star", text: "Score: Correct bin increases score. Wrong bin decreases score.")
            
            GuideRow(icon: "clock", text: "Timer: Finish before time runs out to complete the level.")
            
            GuideRow(icon: "exclamationmark.triangle", text: "Rule: You can carry only one waste item at a time.")
            GuideRow(icon: "figure.walk", text: "Rule: Move the character one step away from the waste item before double tapping to collect it. ")
        }
        .font(.subheadline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: .black.opacity(0.08), radius: 10, y: 5)
        )
        .opacity(showContent ? 1 : 0)
    }
}


struct BenefitRow: View {
    let icon: String
    let text: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.15))
                    .frame(width: 40, height: 40)
                
                Image(systemName: icon)
                    .foregroundStyle(color)
                    .font(.system(size: 18))
            }
            
            Text(text)
                .font(.subheadline)
            
            Spacer()
        }
    }
}

// MARK: - Guide Row

struct GuideRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(.green)
                .frame(width: 24)
            
            Text(text)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
    }
}


