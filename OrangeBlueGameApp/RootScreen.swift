import Combine
import SwiftUI

struct RootScreen: View {
    @EnvironmentObject private var settingsStore: SettingsStore
    @EnvironmentObject private var themeManager: ThemeManager
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var paths: RealmPaths

    @StateObject private var onboardingViewModel = OnboardingViewModel()
    @StateObject private var homeViewModel = HomeViewModel()

    var body: some View {
        ZStack {
            AppTheme.gradientBackground
                .ignoresSafeArea()

            content
        }
        .animation(.easeInOut(duration: 0.25), value: appState.showOnboarding)
        .animation(.easeInOut(duration: 0.25), value: appState.isInGame)
    }

    @ViewBuilder
    private var content: some View {
        if appState.showOnboarding {
            OnboardingScreen(
                viewModel: onboardingViewModel
            ) {
                appState.markOnboardingCompleted()
            }
        } else if appState.isInGame {
            BoardContainer()
        } else {
            HomeScreen(
                viewModel: homeViewModel
            )
        }
    }
}
