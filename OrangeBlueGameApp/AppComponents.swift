import Combine
import SwiftUI

struct AppPrimaryButton: View {
    let title: String
    let iconSystemName: String?
    let action: () -> Void

    init(title: String, iconSystemName: String? = nil, action: @escaping () -> Void) {
        self.title = title
        self.iconSystemName = iconSystemName
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 10) {
                if let name = iconSystemName {
                    Image(systemName: name)
                        .font(.system(size: 16, weight: .semibold))
                }

                Text(title)
                    .font(.system(size: 16, weight: .semibold))

                Spacer(minLength: 0)
            }
            .foregroundColor(.white)
            .padding(.horizontal, StyleTokens.paddingMedium)
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
            .shadow(color: AppTheme.shadowSoft,
                    radius: StyleTokens.shadowRadius,
                    x: 0,
                    y: StyleTokens.shadowYOffset)
        }
    }
}

struct AppSecondaryButton: View {
    let title: String
    let iconSystemName: String?
    let action: () -> Void

    init(title: String, iconSystemName: String? = nil, action: @escaping () -> Void) {
        self.title = title
        self.iconSystemName = iconSystemName
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 10) {
                if let name = iconSystemName {
                    Image(systemName: name)
                        .font(.system(size: 16, weight: .semibold))
                }

                Text(title)
                    .font(.system(size: 16, weight: .semibold))

                Spacer(minLength: 0)
            }
            .foregroundColor(AppTheme.textMain)
            .padding(.horizontal, StyleTokens.paddingMedium)
            .frame(height: StyleTokens.buttonHeight)
            .background(
                RoundedRectangle(
                    cornerRadius: StyleTokens.cornerMedium,
                    style: .continuous
                )
                .fill(AppTheme.surface)
            )
            .shadow(color: AppTheme.shadowSoft,
                    radius: StyleTokens.shadowRadius,
                    x: 0,
                    y: StyleTokens.shadowYOffset)
        }
    }
}

struct AppSectionCard<Content: View>: View {
    let title: String?
    let subtitle: String?
    let content: Content

    init(title: String? = nil,
         subtitle: String? = nil,
         @ViewBuilder content: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            if let title = title {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(AppTheme.textMain)
            }

            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(AppTheme.textDimmed)
            }

            content
        }
        .padding(StyleTokens.paddingLarge)
        .background(
            RoundedRectangle(
                cornerRadius: StyleTokens.cornerLarge,
                style: .continuous
            )
            .fill(AppTheme.surface)
            .shadow(color: AppTheme.shadowSoft,
                    radius: StyleTokens.shadowRadius,
                    x: 0,
                    y: StyleTokens.shadowYOffset)
        )
    }
}

extension View {
    func appCardStyle() -> some View {
        self
            .padding(StyleTokens.paddingLarge)
            .background(
                RoundedRectangle(
                    cornerRadius: StyleTokens.cornerLarge,
                    style: .continuous
                )
                .fill(AppTheme.surface)
                .shadow(color: AppTheme.shadowSoft,
                        radius: StyleTokens.shadowRadius,
                        x: 0,
                        y: StyleTokens.shadowYOffset)
            )
    }
}
