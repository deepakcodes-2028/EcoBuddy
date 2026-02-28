import SwiftUI

struct SecondLifeView: View {
    let item: EcoItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                sectionHeader
                reuseIdeasList
                tipsSection
            }
            .padding()
        }
    }
    
    var sectionHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "arrow.circlepath")
                    .foregroundStyle(.blue)
                Text("Give It a Second Life")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Text("Creative ways to reuse instead of throwing away")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    var reuseIdeasList: some View {
        VStack(spacing: 16) {
            ForEach(item.reuseIdeas) { idea in
                ReuseIdeaCard(idea: idea)
            }
        }
    }
    
    var tipsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Pro Tips", systemImage: "lightbulb.fill")
                .font(.headline)
                .foregroundStyle(.orange)
            
            VStack(alignment: .leading, spacing: 8) {
                TipRow(text: "Clean items thoroughly before reusing")
                TipRow(text: "Get creative - there are endless possibilities!")
                TipRow(text: "Share your ideas with friends and family")
                TipRow(text: "Safety first - ensure reused items are safe")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.orange.opacity(0.1))
        )
    }
}

struct TipRow: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.green)
                .font(.caption)
            
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.primary)
        }
    }
}

