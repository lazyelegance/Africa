//
//  CreditsView.swift
//  Africa
//
//  Created by Ezra Bathini on 5/01/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128.0, height: 128.0)
            Text("""
    Copyright © Ezra Bathini
    All rights reserved
    Bowled Inc ♡
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
                
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
