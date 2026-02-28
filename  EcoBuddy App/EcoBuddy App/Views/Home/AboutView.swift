import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("About EcoBuddy")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("EcoBuddy is your companion for learning sustainable living habits. Discover how to properly dispose of items, find creative reuse ideas, and understand environmental impact.")
                        .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Features")
                            .font(.headline)
                        
                        FeatureRow(icon: "magnifyingglass", text: "Browse eco-friendly item database")
                        FeatureRow(icon: "arrow.3.trianglepath", text: "Learn proper disposal methods")
                        FeatureRow(icon: "lightbulb.fill", text: "Discover creative reuse ideas")
                        FeatureRow(icon: "gamecontroller.fill", text: "Play educational games")
                    }
                    
                    Divider()
                    
                    Text("App created by Deepak Balan")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(.green)
                .frame(width: 24)
            
            Text(text)
                .font(.subheadline)
        }
    }
}


