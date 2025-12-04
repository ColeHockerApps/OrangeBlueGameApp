import Combine
import SwiftUI
import StoreKit

final class SettingsViewModel: ObservableObject {
    @Published var selectedTheme: ThemeMode

    private let settings: SettingsStore
    private let haptics: HapticsManager

    init(settingsStore: SettingsStore, haptics: HapticsManager = .shared) {
        self.settings = settingsStore
        self.haptics = haptics
        self.selectedTheme = settingsStore.selectedTheme
    }

    func selectTheme(_ mode: ThemeMode) {
        selectedTheme = mode
        settings.setTheme(mode)
        haptics.select()
    }

    func openRate() {
        haptics.tap()
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        SKStoreReviewController.requestReview(in: scene)
    }
}
