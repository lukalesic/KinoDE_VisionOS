//
//  ForYouView.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import SwiftUI

struct ComingSoonView: View {
    let repo = ComingSoonRepository()
    var body: some View {
        Text("Hello, Coming soon!")
            .onAppear {
                repo.fetchData()
            }
    }
}

#Preview {
    ComingSoonView()
}
