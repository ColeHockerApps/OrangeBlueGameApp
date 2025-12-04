import Combine
import SwiftUI

struct HowToScreen: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.gradientBackground
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("How to play")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(AppTheme.textMain)
                            .padding(.bottom, 4)

                        sectionTitle("1. Starting the game")
                        bodyText("Open Titano and tap the big Play button in the center of the home screen.")
                        bodyText("The game will load inside the app. Make sure you have an active internet connection.")

                        sectionTitle("2. Basic controls")
                        bodyText("All game actions happen inside the Play screen. Use taps and normal touch gestures supported by the game.")
                        bodyText("If the game shows its own buttons or menus, use them as usual. The app does not change how the game controls work.")

                        sectionTitle("3. Returning to the main menu")
                        bodyText("To leave the Play screen and go back to the main menu, use the Menu button at the top of the game view.")
                        bodyText("From the main screen you can open How to play, Rules, Privacy, Settings and Rate sections.")

                        sectionTitle("4. Refreshing the game")
                        bodyText("If the game looks stuck or does not respond, you can pull down inside the game view to refresh it.")
                        bodyText("Refreshing reloads the game from the internet. Current in-game progress may be reset depending on how the game works.")

                        sectionTitle("5. Settings and theme")
                        bodyText("Open Settings from the main screen to switch between light, dark or system theme for Titano.")
                        bodyText("Theme changes affect the app interface around the game, not the game visuals themselves.")

                        sectionTitle("6. Privacy and data")
                        bodyText("Use the Privacy button on the main screen to read the full privacy information inside the app.")
                        bodyText("The app itself does not ask you to create an account or enter personal data. Any additional prompts are provided by the game content.")

                        sectionTitle("7. Simple tips")
                        bodyText("For the best experience, keep your internet connection stable while playing.")
                        bodyText("If something feels wrong, return to the main menu, reopen Play, or restart the app and try again.")

                        Spacer(minLength: 0)
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
                    .padding(StyleTokens.paddingLarge)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("How to play")
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

    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(AppTheme.textMain)
            .padding(.top, 8)
    }

    private func bodyText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 15, weight: .regular))
            .foregroundColor(AppTheme.textDimmed)
            .fixedSize(horizontal: false, vertical: true)
    }
}
