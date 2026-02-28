import SwiftUI

struct StatCard: View {
    let number: String
    let label: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
            
            Text(number)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(color: .black.opacity(0.05), radius: 5, y: 2)
        )
    }
}

#Preview {
    HStack(spacing: 12) {
        StatCard(number: "8", label: "Items", icon: "cube.box.fill", color: .blue)
        StatCard(number: "4", label: "Bins", icon: "trash.fill", color: .green)
        StatCard(number: "2", label: "Games", icon: "gamecontroller.fill", color: .orange)
    }
    .padding()
}
