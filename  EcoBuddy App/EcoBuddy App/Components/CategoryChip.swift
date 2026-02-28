import SwiftUI

struct CategoryChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.green : Color(red: 0.95, green: 0.95, blue: 0.97))
                )
                .foregroundStyle(isSelected ? .white : .primary)
        }
    }
}

#Preview {
    HStack {
        CategoryChip(title: "All", isSelected: true, action: {})
        CategoryChip(title: "Plastic", isSelected: false, action: {})
        CategoryChip(title: "Paper", isSelected: false, action: {})
    }
    .padding()
}

