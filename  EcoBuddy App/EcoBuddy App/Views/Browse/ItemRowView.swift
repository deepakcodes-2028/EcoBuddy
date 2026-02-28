import SwiftUI

struct ItemRowView: View {
    let item: EcoItem
    
    var body: some View {
        HStack(spacing: 16) {
          
            Image(systemName: item.icon)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 50, height: 50)
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
            
           
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                HStack(spacing: 8) {
                    Label(item.category, systemImage: "tag.fill")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Circle()
                        .fill(.secondary)
                        .frame(width: 3, height: 3)
                    
                    Label(item.disposalType.rawValue, systemImage: item.disposalType.icon)
                        .font(.caption)
                        .foregroundStyle(item.disposalType.color)
                }
            }
            
            Spacer()
            
           
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white.opacity(0.5))
                .shadow(color: .black.opacity(0.05), radius: 5, y: 2)
        )
    }
}

#Preview {
    ItemRowView(item: EcoItemsData.allItems[0])
        .padding()
}
