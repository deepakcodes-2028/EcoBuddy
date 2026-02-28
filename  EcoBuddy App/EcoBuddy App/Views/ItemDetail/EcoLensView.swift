import SwiftUI

struct EcoLensView: View {
    let item: EcoItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                sectionHeader
                impactCard
                decompositionCard
                carbonCard
                callToAction
            }
            .padding()
        }
    }
    
    var sectionHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "globe.americas.fill")
                    .foregroundStyle(.green)
                Text("Environmental Impact")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Text("Understand how this item affects our planet")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    var impactCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Impact Overview", systemImage: "exclamationmark.triangle.fill")
                .font(.headline)
                .foregroundStyle(.orange)
            
            Text(item.environmentalImpact)
                .font(.body)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.orange.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    var decompositionCard: some View {
        HStack(spacing: 16) {
            Image(systemName: "clock.fill")
                .font(.title)
                .foregroundStyle(.blue)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .fill(Color.blue.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Decomposition Time")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(item.decompositionTime)
                    .font(.headline)
                    .foregroundStyle(.primary)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
        )
    }
    
    var carbonCard: some View {
        HStack(spacing: 16) {
            Image(systemName: "cloud.fill")
                .font(.title)
                .foregroundStyle(.purple)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .fill(Color.purple.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Carbon Footprint")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(item.carbonFootprint)
                    .font(.headline)
                    .foregroundStyle(.primary)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
        )
    }
    
    var callToAction: some View {
        VStack(spacing: 12) {
            Image(systemName: "leaf.fill")
                .font(.largeTitle)
                .foregroundStyle(.green)
            
            Text("Every Action Counts")
                .font(.headline)
            
            Text("By making conscious choices, you're contributing to a healthier planet.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [Color.green.opacity(0.1), Color.blue.opacity(0.1)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }
}

