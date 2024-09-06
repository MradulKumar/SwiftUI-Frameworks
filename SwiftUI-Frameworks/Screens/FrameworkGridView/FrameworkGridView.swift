//
//  ContentView.swift
//  SwiftUI-Frameworks
//
//  Created by Mradul Kumar  on 04/09/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.colums, content: {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                })
            }
            .navigationTitle("Frameworks")
        }
        .foregroundColor(Color(.label))
        .sheet(isPresented: $viewModel.isShowingDetailView, content: {
            FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                                isShowingDetailView: $viewModel.isShowingDetailView)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}
