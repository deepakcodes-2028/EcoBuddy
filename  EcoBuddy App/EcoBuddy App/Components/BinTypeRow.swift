import SwiftUI

struct BinTypeRow: View {
    let disposalType: DisposalType

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: disposalType.icon)
                .foregroundColor(.white)
                .frame(width: 36, height: 36)
                .background(
                    Circle()
                        .fill(disposalType.color)
                )

            VStack(alignment: .leading, spacing: 2) {
                Text(disposalType.rawValue)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(disposalType.binDescription)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.3)) // ✅ SAFE, NO FILL
        )
    }
}

#Preview {
    VStack {
        BinTypeRow(disposalType: .recyclable)
        BinTypeRow(disposalType: .organic)
        BinTypeRow(disposalType: .hazardous)
        BinTypeRow(disposalType: .general)
    }
    .padding()
}

