import SwiftUI

struct BrowseItemsView: View {
    @State private var viewModel = BrowseViewModel()
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            AnimatedBackgroundView()
            
            VStack(spacing: 0) {
                enhancedSearchSection
                
                if !viewModel.searchText.isEmpty || viewModel.selectedCategory != "All" {
                    categoryChips
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                if viewModel.filteredItems.isEmpty {
                    emptyState
                } else {
                    itemsList
                }
            }
        }
        .navigationTitle("Browse Items")
        .onAppear {
            withAnimation(.easeOut(duration: 0.6)) {
                showContent = true
            }
        }
    }
    
    var enhancedSearchSection: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    LinearGradient(
                        colors: [AppTheme.primaryGreen, AppTheme.secondaryBlue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .font(.title3)
            
            TextField("Search items...", text: $viewModel.searchText)
                .textFieldStyle(.plain)
            
            if !viewModel.searchText.isEmpty {
                Button {
                    withAnimation(.spring(response: 0.3)) {
                        viewModel.searchText = ""
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .shadow(color: AppTheme.cardShadow, radius: 10, y: 5)
        )
        .padding()
        .scaleEffect(showContent ? 1 : 0.9)
        .opacity(showContent ? 1 : 0)
    }
    
    var categoryChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(Array(viewModel.categories.enumerated()), id: \.element) { index, category in
                    EnhancedCategoryChip(
                        title: category,
                        isSelected: viewModel.selectedCategory == category,
                        delay: Double(index) * 0.1
                    ) {
                        withAnimation(.spring(response: 0.4)) {
                            viewModel.selectedCategory = category
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 8)
    }
    
    var itemsList: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(Array(viewModel.filteredItems.enumerated()), id: \.element) { index, item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        EnhancedItemRowView(item: item, delay: Double(index) * 0.1)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
    }
    
    var emptyState: some View {
        VStack(spacing: 20) {
            Image(systemName: "magnifyingglass.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(
                    LinearGradient(
                        colors: [AppTheme.primaryGreen.opacity(0.6), AppTheme.secondaryBlue.opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("No Items Found")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Try adjusting your search or filters")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}


struct EnhancedCategoryChip: View {
    let title: String
    let isSelected: Bool
    let delay: Double
    let action: () -> Void
    
    @State private var showContent = false
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    Capsule()
                        .fill(
                            isSelected ?
                            LinearGradient(
                                colors: [AppTheme.primaryGreen, AppTheme.secondaryBlue],
                                startPoint: .leading,
                                endPoint: .trailing
                            ) :
                            LinearGradient(
                                colors: [Color.white, Color.white],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .shadow(color: isSelected ? AppTheme.primaryGreen.opacity(0.3) : AppTheme.cardShadow, radius: 8, y: 4)
                )
                .foregroundStyle(isSelected ? .white : .primary)
        }
        .scaleEffect(showContent ? 1 : 0.5)
        .opacity(showContent ? 1 : 0)
        .onAppear {
            withAnimation(.spring(response: 0.5).delay(delay)) {
                showContent = true
            }
        }
    }
}


struct EnhancedItemRowView: View {
    let item: EcoItem
    let delay: Double
    
    @State private var showContent = false
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [item.disposalType.color, item.disposalType.color.opacity(0.6)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 60, height: 60)
                    .shadow(color: item.disposalType.color.opacity(0.4), radius: 8, y: 4)
                
                Image(systemName: item.icon)
                    .font(.title2)
                    .foregroundStyle(.white)
            }
            
            VStack(alignment: .leading, spacing: 6) {
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
                .foregroundStyle(item.disposalType.color)
                .fontWeight(.semibold)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .shadow(color: AppTheme.cardShadow, radius: 10, y: 5)
        )
        .scaleEffect(showContent ? 1 : 0.9)
        .opacity(showContent ? 1 : 0)
        .offset(x: showContent ? 0 : 20)
        .onAppear {
            withAnimation(.spring(response: 0.5).delay(delay)) {
                showContent = true
            }
        }
    }
}
