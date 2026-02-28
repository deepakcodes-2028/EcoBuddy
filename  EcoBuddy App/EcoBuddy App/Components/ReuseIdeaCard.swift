import SwiftUI

struct ReuseIdeaCard: View {
    let idea: ReuseIdea
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: idea.icon)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        Circle()
                            .fill(difficultyColor)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(idea.title)
                        .font(.headline)
                    
                    DifficultyBadge(difficulty: idea.difficulty)
                }
                
                Spacer()
            }
            
            Text(idea.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
        )
    }
    
    private var difficultyColor: Color {
        switch idea.difficulty {
        case .easy: return .green
        case .medium: return .orange
        case .advanced: return .red
        }
    }
}

struct DifficultyBadge: View {
    let difficulty: ReuseDifficulty
    
    var body: some View {
        Text(difficulty.rawValue)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(
                Capsule()
                    .fill(badgeColor.opacity(0.2))
            )
            .foregroundStyle(badgeColor)
    }
    
    private var badgeColor: Color {
        switch difficulty {
        case .easy: return .green
        case .medium: return .orange
        case .advanced: return .red
        }
    }
}

#Preview {
    ReuseIdeaCard(
        idea: ReuseIdea(
            title: "Plant Watering Can",
            description: "Poke holes in the cap to create a simple watering can for plants.",
            difficulty: .easy,
            icon: "drop.fill"
        )
    )
    .padding()
}
