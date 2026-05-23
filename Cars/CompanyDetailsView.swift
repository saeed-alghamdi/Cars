//
//  CompanyDetailsView.swift
//  Cars
//
//  Created by RMP on 24/07/1445 AH.
//

import SwiftUI

struct CompanyDetailsView: View {
    
    @Binding var carBrandName: String
    @Binding var carBrand: [CarBrand]
    
    @State var showingDetailsView: Bool = false
    
    @State var images = ""
    @State var topic = ""
    @State var details = ""
    @State var moreDetails: String?
    @State var otherImage: String?
    @State var articleLink = ""
    @State var tag = 0
    @State var id = UUID()
    
    @State var addingToFavorites = false
    
    
    var body: some View {
        
        if carBrand.isEmpty {
            
            Text("Nothing Here")
            
            
        } else {
            
            NavigationView {
                
                List {
                    
                    ForEach(carBrand) { brand in
                        
                        Button {
                            
                            // pass the info to next view
                            images = brand.image
                            topic = brand.topic
                            details = brand.details
                            articleLink = brand.articleLink
                            moreDetails = brand.moreDetails
                            otherImage = brand.otherImage
                            tag = brand.tag
                            id = brand.id
                            addingToFavorites = false
                            showingDetailsView = true
                            
                            
                        } label: {
                            
                            Image(brand.image).resizable().aspectRatio(contentMode: .fit).frame(minWidth: 50, maxWidth: .infinity, minHeight: 200).cornerRadius(20)
                            
                        }.listRowSeparator(.hidden)
                        
                    }
                    

                }.navigationTitle(carBrandName).listStyle(.grouped)
                
            }.fullScreenCover(isPresented: $showingDetailsView) {
                
                DetailsView(id: $id, image: $images, topic: $topic, details: $details, otherImage: $otherImage, moreDetails: $moreDetails, articleLink: $articleLink, tag: $tag, addingToFavorites: $addingToFavorites)
                
            }
            
        }
          
    }
    
}

struct CompanyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyDetailsView(carBrandName: .constant("bmw"), carBrand: .constant([CarBrand(image: "bmw1", topic: "There Are Five Ways To Open The BMW i7's Doors", details: "I'm a big believer in the freedom of choice and the pursuit of happiness — the ability to do what you want to do in an effort to make yourself happy. Well, as it turns out, BMW is also really into freedom of choice. Specifically, those wacky Germans are giving you the freedom of choice when it comes to opening the doors from the inside of your BMW i7 M70. I'm sure that in your boring peasant car, there are maybe one or two ways to open the door from the inside. On the i7, however, there are now fewer than five. Hell, there could be even more that we just haven't discovered yet. Why have four levels of redundancy? Because Germany, that's why. And, while all of these systems may serve the same primary function, they all go about it in incredibly different ways. Keep in mind, we're not even going to get into all of the i7 M70's door closing functions or all the ways to open it from the outside, because I think Jalopnik's backend website would literally run out of space.Still, with five different ways to open the doors, this i7 M70's $192,075 asking price means you're only paying about $38,415 per door operating procedure. That's not too bad if you ask me.\n\n", articleLink: "https://www.jalopnik.com/2132395/bmw-i7-five-ways-to-open-doors/", tag: 0)]))
    }
}


