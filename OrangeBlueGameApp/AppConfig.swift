import Combine
import SwiftUI

struct AppConfig {
    static let onboardingShownKey = "titano.onboarding.shown"
    static let selectedThemeKey = "titano.theme.mode"

    static let playButtonAnimationEnabled = true
    static let allowHaptics = true

    static let defaultHowToText = """
Welcome to Titano.
Tap Play to start your journey.
"""

    static let defaultRulesText = """
Your progress is saved automatically.
Stay focused and enjoy the experience.
"""
}
