import Combine
import SwiftUI

struct SettingsScreen: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var settingsStore: SettingsStore
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.gradientBackground
                    .ignoresSafeArea()

                VStack(spacing: StyleTokens.paddingLarge) {
                    themeCard
                    Spacer(minLength: 0)
                }
                .padding(StyleTokens.paddingLarge)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(AppTheme.textMain)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(AppTheme.textMain)
                            .padding(8)
                            .background(
                                Circle()
                                    .fill(AppTheme.surfaceStrong)
                            )
                    }
                }
            }
        }
    }

    private var themeCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Theme")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(AppTheme.textMain)

            Text("Choose how Titano looks on your device.")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(AppTheme.textDimmed)

            Picker("", selection: Binding(
                get: { settingsStore.selectedTheme },
                set: { mode in
                    themeManager.applyTheme(mode)
                }
            )) {
                Text("Light")
                    .tag(ThemeMode.light)
                Text("Dark")
                    .tag(ThemeMode.dark)
                Text("System")
                    .tag(ThemeMode.system)
            }
            .pickerStyle(.segmented)
        }
        .padding(StyleTokens.paddingLarge)
        .background(
            RoundedRectangle(cornerRadius: StyleTokens.cornerLarge, style: .continuous)
                .fill(AppTheme.surface)
                .shadow(color: AppTheme.shadowSoft,
                        radius: StyleTokens.shadowRadius,
                        x: 0,
                        y: StyleTokens.shadowYOffset)
        )
    }
}
