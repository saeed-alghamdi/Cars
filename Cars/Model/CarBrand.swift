//
//  CarBrand.swift
//  Cars
//
//  Created by RMP on 26/06/1444 AH.
//

import SwiftUI
import Foundation

struct CarBrand: Identifiable {
    
    @State var id = UUID()
    @State var carBrandName: String = ""
    @State var image: String = ""
    @State var topic: String = ""
    @State var details: String = ""
    @State var otherImage: String?
    @State var moreDetails: String?
    @State var articleLink = ""
    @State var tag: Int = 0
    
}

struct GallaryPhoto: Identifiable {
    
    let id = UUID()
    let image: String
    let tag: Int
    
}

struct SubGallaryCar: Identifiable {
    
    let id = UUID()
    let title: String
    let article: String
    let image: String
    
}

struct GallaryCar: Identifiable {
    
    let id = UUID()
    let mainTitle: String
    let mainArticle: String
    let mainImage: String
    let gallaryImageAndArticle: [SubGallaryCar]
    let articleLink: String
    let tag: Int
    
}
