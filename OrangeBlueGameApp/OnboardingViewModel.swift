import Combine
import SwiftUI

struct OnboardingPage {
    let iconSystemName: String
    let title: String
    let message: String
}

final class OnboardingViewModel: ObservableObject {
    @Published var currentIndex: Int = 0

    let pages: [OnboardingPage]

    private let haptics: HapticsManager

    init(haptics: HapticsManager = .shared) {
        self.haptics = haptics

        pages = [
            OnboardingPage(
                iconSystemName: "sparkles",
                title: "Welcome to Titano",
                message: "Relax, tap Play, and dive into a smooth game experience in orange and blue tones."
            ),
            OnboardingPage(
                iconSystemName: "hand.tap.fill",
                title: "Simple controls",
                message: "Everything starts from one Play button in the center. Just tap and enjoy the flow."
            ),
            OnboardingPage(
                iconSystemName: "paintbrush.pointed.fill",
                title: "Custom look",
                message: "Switch themes and keep Titano looking fresh while you play as much as you like."
            )
        ]
    }

    var isLastPage: Bool {
        currentIndex >= pages.count - 1
    }

    var currentPage: OnboardingPage {
        pages[currentIndex]
    }

    func goNext() {
        guard isLastPage == false else { return }
        currentIndex += 1
        haptics.select()
    }

    func goBack() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
        haptics.select()
    }

    func jumpToLast() {
        guard pages.isEmpty == false else { return }
        currentIndex = pages.count - 1
        haptics.select()
    }
}
