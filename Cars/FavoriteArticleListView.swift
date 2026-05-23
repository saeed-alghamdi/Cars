//
//  ProfileView.swift
//  Cars
//
//  Created by RMP on 24/07/1445 AH.
//

import SwiftUI



struct FavoriteArticleListView: View {
    
    @FetchRequest(sortDescriptors: []) var favorits: FetchedResults<CarBrand_Entity>
    
    @FetchRequest(sortDescriptors: []) var g_favorits: FetchedResults<GallaryCar_Entity>
    
    // favorits
    @State var images = ""
    @State var topic = ""
    @State var details = ""
    @State var moreDetails: String?
    @State var otherImage: String?
    @State var articleLink = ""
    @State var tag = 0
    @State var id = UUID()
    
    // g_favorits
    //@State var g_id = UUID()
    //@State var g_mainImage = ""
    //@State var g_mainTitle = ""
    //@State var g_mainArticle = ""
    //@State var g_articleLink = ""
    //@State var g_tag = 0
    
    @State var articleData: GallaryCar = GallaryCar(mainTitle: "", mainArticle: "", mainImage: "", gallaryImageAndArticle: [], articleLink: "", tag: 0)
    
    
    @State var addingToFavorites = true
    
    @State var showingDetailsView = false
    
    @State var showingGallaryDetialsView = false
    
    var body: some View {
        
        if favorits.isEmpty && g_favorits.isEmpty {
            
            Text("CoreData is empty")
            
            
        } else {
            
            List {
                
                ForEach(favorits) { fav in
                    
                    Button {
                        
                        // pass the info to next view
                        images = fav.image!
                        topic = fav.topic!
                        details = fav.details!
                        articleLink = fav.articleLink!
                        moreDetails = fav.moreDetails
                        otherImage = fav.otherImage
                        tag = Int(fav.tag)
                        id = fav.id!
                        
                        showingDetailsView = true
                        addingToFavorites = true
                        
                        
                    } label: {
                        
                        Image(fav.image ?? "").resizable().aspectRatio(contentMode: .fit).frame(minWidth: 50, maxWidth: .infinity, minHeight: 200).cornerRadius(20)
                        
                    }.listRowSeparator(.hidden)
                    
                }
                
                
                ForEach(g_favorits) { fav in
                    
                    Button {
                        
                        //g_id = fav.id
                        //g_mainImage = fav.mainImage
                        //g_mainTitle = fav.mainTitle
                        //g_mainArticle = fav.mainArticle
                        //g_articleLink = fav.articleLink
                        //g_tag = fav.tag
                        
                        if let gallaryImageAndArticle = fav.gallaryImageAndArticle {
                            
                            let arrayGallaryImageAndArticle = gallaryImageAndArticle as! [SubGallaryCar]
                            
                            articleData = GallaryCar(mainTitle: fav.mainTitle!, mainArticle: fav.mainArticle!, mainImage: fav.mainImage!, gallaryImageAndArticle: arrayGallaryImageAndArticle, articleLink: fav.articleLink!, tag: Int(Int16(fav.tag)))
                            
                        }
                        
                        showingGallaryDetialsView = true
                        addingToFavorites = true
                        
                        
                    } label: {
                        
                        Image(fav.mainImage ?? "").resizable().aspectRatio(contentMode: .fit).frame(minWidth: 50, maxWidth: .infinity, minHeight: 200).cornerRadius(20)
                        
                    }.listRowSeparator(.hidden)
                    
                }
                

            }.navigationTitle("CoreData Saves").listStyle(.grouped).fullScreenCover(isPresented: $showingGallaryDetialsView) {
                GallaryDetailsView(article: $articleData, addingToFavorites: $addingToFavorites)
            }.fullScreenCover(isPresented: $showingDetailsView) {
                
                DetailsView(id: $id, image: $images, topic: $topic, details: $details, otherImage: $otherImage, moreDetails: $moreDetails, articleLink: $articleLink, tag: $tag, addingToFavorites: $addingToFavorites)
                
            }
            
        }
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteArticleListView()
    }
}
