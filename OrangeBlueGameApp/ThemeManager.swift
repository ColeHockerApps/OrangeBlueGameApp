import Combine
import SwiftUI

final class ThemeManager: ObservableObject {
    @Published var activeColorScheme: ColorScheme?

    private let settings: SettingsStore

    init(settingsStore: SettingsStore) {
        self.settings = settingsStore
        updateMode(from: settingsStore.selectedTheme)
    }

    func updateMode(from mode: ThemeMode) {
        switch mode {
        case .light:
            activeColorScheme = .light
        case .dark:
            activeColorScheme = .dark
        case .system:
            activeColorScheme = nil
        }
    }

    func applyTheme(_ mode: ThemeMode) {
        settings.setTheme(mode)
        updateMode(from: mode)
    }
}
