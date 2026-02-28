import SwiftUI

struct TrashRightView: View {
    let item: EcoItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                sectionHeader
                binTypeCard
                instructionsCard
                recyclingTipsSection
                binTypesReference
            }
            .padding()
        }
    }
    
    var sectionHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "trash.fill")
                    .foregroundStyle(item.disposalType.color)
                Text("Dispose Correctly")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Text("Learn the right way to dispose of this item")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    var binTypeCard: some View {
        VStack(spacing: 16) {
            Image(systemName: item.disposalType.icon)
                .font(.system(size: 60))
                .foregroundStyle(.white)
                .frame(width: 120, height: 120)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [item.disposalType.color, item.disposalType.color.opacity(0.7)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                )
            
            VStack(spacing: 8) {
                Text(item.disposalType.binDescription)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Text("Use this bin for \(item.name.lowercased())")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(item.disposalType.color.opacity(0.1))
        )
    }
    
    var instructionsCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("How to Dispose", systemImage: "list.bullet.clipboard.fill")
                .font(.headline)
                .foregroundStyle(.blue)
            
            Text(item.disposalInstructions)
                .font(.body)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
        )
    }
    
    var recyclingTipsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Recycling Tips", systemImage: "lightbulb.fill")
                .font(.headline)
                .foregroundStyle(.orange)
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(item.recyclingTips, id: \.self) { tip in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundStyle(.orange)
                        
                        Text(tip)
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.orange.opacity(0.1))
        )
    }
    
    var binTypesReference: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("All Bin Types")
                .font(.headline)
            
            VStack(spacing: 8) {
                ForEach(DisposalType.allCases, id: \.self) { type in
                    BinTypeRow(disposalType: type)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 0.95, green: 0.95, blue: 0.97))
        )
    }
}

