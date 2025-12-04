import Combine
import SwiftUI
import StoreKit

struct RateScreen: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.gradientBackground
                    .ignoresSafeArea()

                VStack {
                    Spacer(minLength: 0)

                    card

                    Spacer(minLength: 0)
                }
                .padding(StyleTokens.paddingLarge)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Rate Titano")
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

    private var card: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Enjoying the game?")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(AppTheme.textMain)

            Text("Your rating helps Titano grow and reach more players. It takes just a moment.")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(AppTheme.textDimmed)
                .fixedSize(horizontal: false, vertical: true)

            HStack(spacing: 8) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(AppTheme.accentSecondary)
                }
            }
            .padding(.top, 4)

            VStack(spacing: 10) {
                Button {
                    requestReview()
                    dismiss()
                } label: {
                    Text("Rate now")
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
                                RoundedRectangle(
                                    cornerRadius: StyleTokens.cornerMedium,
                                    style: .continuous
                                )
                            )
                        )
                }

                Button {
                    dismiss()
                } label: {
                    Text("Maybe later")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(AppTheme.textDimmed)
                        .frame(maxWidth: .infinity)
                        .frame(height: StyleTokens.buttonHeight)
                        .background(
                            RoundedRectangle(
                                cornerRadius: StyleTokens.cornerMedium,
                                style: .continuous
                            )
                            .fill(AppTheme.surface)
                        )
                }
            }
            .padding(.top, 8)
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

    private func requestReview() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        SKStoreReviewController.requestReview(in: scene)
    }
}
