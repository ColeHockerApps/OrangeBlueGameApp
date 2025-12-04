import Combine
import SwiftUI

struct StyleTokens {
    static let cornerLarge: CGFloat = 28
    static let cornerMedium: CGFloat = 20
    static let cornerSmall: CGFloat = 12

    static let paddingLarge: CGFloat = 24
    static let paddingMedium: CGFloat = 16
    static let paddingSmall: CGFloat = 10

    static let buttonHeight: CGFloat = 54

    static let shadowRadius: CGFloat = 10
    static let shadowYOffset: CGFloat = 6

    static let playPulseScale: CGFloat = 1.08
    static let playPulseDuration: Double = 1.4
    static let playPressScale: CGFloat = 0.93

    static func cardBackground() -> some View {
        RoundedRectangle(cornerRadius: cornerLarge, style: .continuous)
            .fill(AppTheme.surface)
            .shadow(color: AppTheme.shadowSoft,
                    radius: shadowRadius,
                    x: 0,
                    y: shadowYOffset)
    }
}
