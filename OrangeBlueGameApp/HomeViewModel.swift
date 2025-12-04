import Combine
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var isPlayPressed: Bool = false
    @Published var animatePulse: Bool = AppConfig.playButtonAnimationEnabled

    private let haptics: HapticsManager

    init(haptics: HapticsManager = .shared) {
        self.haptics = haptics
    }

    func playPressed() {
        haptics.press()
        withAnimation(.easeOut(duration: 0.15)) {
            isPlayPressed = true
        }
    }

    func playReleased(appState: AppState) {
        withAnimation(.easeOut(duration: 0.15)) {
            isPlayPressed = false
        }
        haptics.tap()
        appState.enterGame()
    }

    func pulseAnimation() -> Animation {
        Animation
            .easeInOut(duration: StyleTokens.playPulseDuration)
            .repeatForever(autoreverses: true)
    }
}
