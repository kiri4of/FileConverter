
import UIKit
import SwiftUI

class OnboardingViewController: UIHostingController<OnboardingView> {
    required init?(coder: NSCoder) {
        let viewModel = OnboardingViewModel()
        let rootView = OnboardingView(viewModel: viewModel)
        super.init(coder: coder, rootView: rootView)
        
        viewModel.onFinish = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    }
}
