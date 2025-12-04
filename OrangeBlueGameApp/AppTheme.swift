import Combine
import SwiftUI

struct AppTheme {
    static let backgroundTop = Color(red: 0.07, green: 0.12, blue: 0.25)
    static let backgroundBottom = Color(red: 0.12, green: 0.20, blue: 0.42)

    static let accentPrimary = Color(red: 0.98, green: 0.54, blue: 0.10)
    static let accentSecondary = Color(red: 0.99, green: 0.67, blue: 0.22)

    static let textMain = Color.white
    static let textDimmed = Color.white.opacity(0.7)

    static let surface = Color.white.opacity(0.08)
    static let surfaceStrong = Color.white.opacity(0.18)

    static let shadowSoft = Color.black.opacity(0.25)

    static var gradientBackground: LinearGradient {
        LinearGradient(
            colors: [backgroundTop, backgroundBottom],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
