import Foundation
import SwiftUI
import StoreKit


class OnboardingViewModel: ObservableObject {
    //array of data
    let pages: [OnboardingPage] = [
        OnboardingPage(titleBluePart: "Your Ultimate", titleBlackPart: "PDF Editing Tool", firstLine: "Modify text,add sign, annotate", secondLine: "and more - all in one app", imageName: "onboarding1"),
        OnboardingPage(titleBluePart: "Convert &", titleBlackPart: "Compress", firstLine: "Modify text,add sign, annotate", secondLine: "and more - all in one app", imageName: "onboarding2"),
        OnboardingPage(titleBluePart: "Sign & Protect", titleBlackPart: "Your Files", firstLine: "E-sign documents and", secondLine: "reorder, add or delete pages", imageName: "onboarding3"),
        OnboardingPage(titleBluePart: "Sign & Protect", titleBlackPart: "Your Files", firstLine: "E-sign documents and", secondLine: "reorder, add or delete pages", imageName: "onboarding4")
    ]
    
    @Published var currentPage: Int = 0
    
    private(set) var didShowRating = false
    
    //close onboarding
    var onFinish: (() -> Void)?
    
    func nextButtonTapped() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        }
        else {
            if !didShowRating {
                SKStoreReviewController.requestReview()
                didShowRating = true
            } else {
                //last page
                onFinish?()
            }
        }
    }
    
}
