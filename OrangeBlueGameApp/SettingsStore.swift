import Combine
import SwiftUI

final class SettingsStore: ObservableObject {
    @Published var onboardingShown: Bool
    @Published var selectedTheme: ThemeMode

    init() {
        let defaults = UserDefaults.standard

        onboardingShown = defaults.bool(forKey: AppConfig.onboardingShownKey)

        if let raw = defaults.string(forKey: AppConfig.selectedThemeKey),
           let mode = ThemeMode(rawValue: raw) {
            selectedTheme = mode
        } else {
            selectedTheme = .system
        }
    }

    func setOnboardingShown(_ value: Bool) {
        onboardingShown = value
        UserDefaults.standard.set(value, forKey: AppConfig.onboardingShownKey)
    }

    func setTheme(_ mode: ThemeMode) {
        selectedTheme = mode
        UserDefaults.standard.set(mode.rawValue, forKey: AppConfig.selectedThemeKey)
    }
}

enum ThemeMode: String {
    case light
    case dark
    case system
}
