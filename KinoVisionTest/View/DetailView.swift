//
//  DetailView.swift
//  KinoVisionTest
//
//  Created by Dominik Ilijević on 28.11.2023..
//

import SwiftUI

struct DetailView: View {

    var title: String
    var pictureUrl: String
    var genres: String

    var body: some View {
        GeometryReader { reader in
            HStack {
                AsyncImage(url: URL(string: pictureUrl))

                VStack(alignment: .leading, spacing: 20) {
                    Text(title)
                        .font(.system(size: 54))
                    Text(genres)
                        .font(.system(size: 48))
                        .foregroundStyle(Color.init(white: 0.8))
                    Spacer()
                }

                .padding(.top, 44)
                .padding(.horizontal, 24)

                Spacer()
            }
        }
    }
}

#Preview {
    let title = "Superman"
    let picUrl = "https://d3sourxycqfpzg.cloudfront.net/production/tv_shows/posters/24652/small.jpg"
    let genres = "Drama, sci-fi, fantasy, comedy"
    return DetailView(title: title, pictureUrl: picUrl, genres: genres)
}
