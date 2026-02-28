import Foundation

@Observable
class HomeViewModel {
    var showingInfo: Bool = false
    
    let appName = "EcoBuddy"
    let appTagline = "Learn eco-friendly habits"
    
    func toggleInfo() {
        showingInfo.toggle()
    }
}
