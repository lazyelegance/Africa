//
//  ExternalWebLink.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import SwiftUI

struct ExternalWebLink: View {
    let linkName: String
    let link: String
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Link(linkName, destination: URL(string: link) ?? URL(string: "https://en.wikipedia.org/wiki/Special:Search?search=\(linkName)")!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
                
            }
        }
    }
}

struct ExternalWebLink_Previews: PreviewProvider {
    static var previews: some View {
        ExternalWebLink(linkName: testAnimals[3].name, link: testAnimals[3].link).previewLayout(.sizeThatFits).padding()
    }
}
