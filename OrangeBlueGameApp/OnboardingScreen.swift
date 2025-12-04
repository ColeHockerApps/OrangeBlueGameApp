import Combine
import SwiftUI

struct OnboardingScreen: View {
    @ObservedObject var viewModel: OnboardingViewModel
    let onFinish: () -> Void

    var body: some View {
        ZStack {
            AppTheme.gradientBackground
                .ignoresSafeArea()

            VStack {
                Spacer()

                card

                Spacer()

                controls
                    .padding(.horizontal, StyleTokens.paddingLarge)
                    .padding(.bottom, StyleTokens.paddingLarge)
            }
        }
    }

    private var card: some View {
        VStack(spacing: 20) {
            Image(systemName: viewModel.currentPage.iconSystemName)
                .font(.system(size: 48, weight: .semibold))
                .foregroundColor(AppTheme.accentPrimary)
                .padding(18)
                .background(
                    Circle()
                        .fill(AppTheme.surfaceStrong)
                )

            Text(viewModel.currentPage.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(AppTheme.textMain)
                .multilineTextAlignment(.center)
                .padding(.horizontal, StyleTokens.paddingLarge)

            Text(viewModel.currentPage.message)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(AppTheme.textDimmed)
                .multilineTextAlignment(.center)
                .padding(.horizontal, StyleTokens.paddingLarge)

            indicators
                .padding(.top, 6)
        }
        .padding(.vertical, StyleTokens.paddingLarge)
        .frame(maxWidth: 360)
        .background(
            RoundedRectangle(cornerRadius: StyleTokens.cornerLarge, style: .continuous)
                .fill(AppTheme.surface)
                .shadow(color: AppTheme.shadowSoft,
                        radius: StyleTokens.shadowRadius,
                        x: 0,
                        y: StyleTokens.shadowYOffset)
        )
        .padding(.horizontal, StyleTokens.paddingLarge)
    }

    private var indicators: some View {
        HStack(spacing: 8) {
            ForEach(viewModel.pages.indices, id: \.self) { index in
                let isActive = index == viewModel.currentIndex
                Capsule()
                    .fill(isActive ? AppTheme.accentPrimary : AppTheme.surfaceStrong)
                    .frame(width: isActive ? 22 : 10, height: 6)
                    .animation(.easeInOut(duration: 0.2), value: viewModel.currentIndex)
            }
        }
    }

    private var controls: some View {
        HStack(spacing: 12) {
            Button {
                onFinish()
            } label: {
                Text("Skip")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppTheme.textDimmed)
                    .frame(maxWidth: .infinity)
                    .frame(height: StyleTokens.buttonHeight)
                    .background(
                        RoundedRectangle(cornerRadius: StyleTokens.cornerMedium, style: .continuous)
                            .fill(AppTheme.surface)
                    )
            }

            Button {
                if viewModel.isLastPage {
                    onFinish()
                } else {
                    viewModel.goNext()
                }
            } label: {
                Text(viewModel.isLastPage ? "Start" : "Next")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: StyleTokens.buttonHeight)
                    .background(
                        LinearGradient(
                            colors: [AppTheme.accentPrimary, AppTheme.accentSecondary],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: StyleTokens.cornerMedium, style: .continuous)
                        )
                    )
            }
        }
    }
}
