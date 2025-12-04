import Combine
import SwiftUI

struct RulesScreen: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.gradientBackground
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Rules")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(AppTheme.textMain)
                            .padding(.bottom, 4)

                        sectionTitle("1. General")
                        bodyText("Titano is a casual game wrapped in a simple app. Tap Play, enjoy the game, and come back whenever you like.")

                        sectionTitle("2. Internet connection")
                        bodyText("The game content is loaded from the internet. A stable connection is required. If the connection is lost, you may need to restart the game from the main screen.")

                        sectionTitle("3. Progress")
                        bodyText("Your in-game progress is managed by the game itself. The app does not control or modify what happens inside the game screen.")
                        bodyText("Closing the app or losing connection may reset the current game session depending on how the game works.")

                        sectionTitle("4. Fair play")
                        bodyText("Play honestly and do not try to exploit bugs, automation tools, or other methods that change the normal gameplay experience.")

                        sectionTitle("5. Content")
                        bodyText("Game visuals, sounds, and mechanics inside the Play screen are provided by the game. The app does not change difficulty or rewards.")

                        sectionTitle("6. Privacy and data")
                        bodyText("The app itself does not ask you to create an account or enter personal data.")
                        bodyText("Details about data handling are described in the Privacy section available from the main screen.")

                        sectionTitle("7. Updates")
                        bodyText("Rules may be adjusted with future updates of Titano. Please check this section again after installing a new version.")

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
                    Text("Rules")
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
