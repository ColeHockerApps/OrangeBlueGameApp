import Combine
import SwiftUI

struct HomeScreen: View {
    @ObservedObject var viewModel: HomeViewModel

    @EnvironmentObject private var appState: AppState

    @State private var showHowTo = false
    @State private var showRules = false
    @State private var showSettings = false
    @State private var showPrivacy = false
    @State private var showRate = false

    var body: some View {
        ZStack {
            AppTheme.gradientBackground
                .ignoresSafeArea()

            VStack {
                header

                Spacer()

                PlayButtonView(
                    isPressed: viewModel.isPlayPressed,
                    animatePulse: viewModel.animatePulse,
                    onPressDown: {
                        viewModel.playPressed()
                    },
                    onPressUp: {
                        viewModel.playReleased(appState: appState)
                    }
                )
                .padding(.horizontal, StyleTokens.paddingLarge)

                Spacer()

                menuButtons
                    .padding(.horizontal, StyleTokens.paddingLarge)
                    .padding(.bottom, StyleTokens.paddingLarge)
            }
        }
        .sheet(isPresented: $showHowTo) {
            HowToScreen()
        }
        .sheet(isPresented: $showRules) {
            RulesScreen()
        }
        .sheet(isPresented: $showSettings) {
            SettingsScreen()
        }
        .sheet(isPresented: $showPrivacy) {
            PrivacyScreen()
        }
        .sheet(isPresented: $showRate) {
            RateScreen()
        }
    }

    private var header: some View {
        VStack(spacing: 8) {
            Text("Titano")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(AppTheme.textMain)

            Text("Tap Play to start")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(AppTheme.textDimmed)
        }
        .padding(.top, StyleTokens.paddingLarge)
    }

    private var menuButtons: some View {
        VStack(spacing: 10) {
            primaryButton(title: "How to play") {
                showHowTo = true
            }

            primaryButton(title: "Rules") {
                showRules = true
            }

            primaryButton(title: "Privacy") {
                showPrivacy = true
            }

            primaryButton(title: "Settings") {
                showSettings = true
            }

            primaryButton(title: "Rate the app") {
                showRate = true
            }
        }
    }

    private func primaryButton(title: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppTheme.textMain)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(AppTheme.textDimmed)
            }
            .padding(.horizontal, StyleTokens.paddingMedium)
            .frame(height: StyleTokens.buttonHeight)
            .background(
                RoundedRectangle(cornerRadius: StyleTokens.cornerMedium, style: .continuous)
                    .fill(AppTheme.surface)
                    .shadow(color: AppTheme.shadowSoft,
                            radius: StyleTokens.shadowRadius,
                            x: 0,
                            y: StyleTokens.shadowYOffset)
            )
        }
    }
}
