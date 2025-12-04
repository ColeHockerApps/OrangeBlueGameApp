import Combine
import SwiftUI

final class AppState: ObservableObject {
    @Published var showOnboarding: Bool
    @Published var isInGame: Bool = false

    private let settings: SettingsStore

    init(settingsStore: SettingsStore) {
        self.settings = settingsStore
        self.showOnboarding = settingsStore.onboardingShown == false
    }

    func markOnboardingCompleted() {
        settings.setOnboardingShown(true)
        showOnboarding = false
    }

    func enterGame() {
        isInGame = true
    }

    func exitGame() {
        isInGame = false
    }
}
