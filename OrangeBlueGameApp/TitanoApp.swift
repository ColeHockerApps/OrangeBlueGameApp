import Combine
import SwiftUI

@main
struct TitanoApp: App {
    @StateObject private var settingsStoreState: SettingsStore
    @StateObject private var themeManagerState: ThemeManager
    @StateObject private var appStateState: AppState
    @StateObject private var pathsState: RealmPaths

    init() {
        let settings = SettingsStore()
        let theme = ThemeManager(settingsStore: settings)
        let appState = AppState(settingsStore: settings)
        let paths = RealmPaths()

        _settingsStoreState = StateObject(wrappedValue: settings)
        _themeManagerState = StateObject(wrappedValue: theme)
        _appStateState = StateObject(wrappedValue: appState)
        _pathsState = StateObject(wrappedValue: paths)
    }

    var body: some Scene {
        WindowGroup {
            RootScreen()
                .environmentObject(settingsStoreState)
                .environmentObject(themeManagerState)
                .environmentObject(appStateState)
                .environmentObject(pathsState)
                .preferredColorScheme(themeManagerState.activeColorScheme)
        }
    }
}
