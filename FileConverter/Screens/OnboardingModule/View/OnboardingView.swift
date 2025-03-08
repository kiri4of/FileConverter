
import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        TabView(selection: $viewModel.currentPage) {
            ForEach(0..<viewModel.pages.count, id: \.self) { index in
                VStack {
                    OnboardingDescriptionView(titleBluePart: viewModel.pages[index].titleBluePart,
                                              titleBlackPart: viewModel.pages[index].titleBlackPart,
                                              firstLine: viewModel.pages[index].firstLine,
                                              secondLine: viewModel.pages[index].secondLine)
                    .padding(.top, 20)

                    Image(viewModel.pages[index].imageName)
                        .resizable()
                        .scaledToFit()
                    
                    Button(action: {
                        viewModel.nextButtonTapped()
                    }) {
                        Text(viewModel.currentPage == viewModel.pages.count - 1 ? "Get Started" : "Continue")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 344, height: 68)
                            .background(Color(AppColor.lightBlue))
                            .cornerRadius(16)
                            .shadow(radius: 4)
                    }

                    
                    HStack(spacing: 55) {
                        Button("Privacy") {
                            //
                        }
                     
                        Button("Restore") {
                            //
                        }
                        
                        Button("Terms") {
                            //
                        }
                    }
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct OnboardingPage {
    let titleBluePart: String
    let titleBlackPart: String
    let firstLine: String
    let secondLine: String
    let imageName: String
}

