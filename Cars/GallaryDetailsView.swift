//
//  GallaryDetailsView.swift
//  Cars
//
//  Created by RMP on 18/11/1447 AH.
//

import SwiftUI

struct GallaryDetailsView: View {
    
    @Binding var article: GallaryCar
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: []) var favorits: FetchedResults<GallaryCar_Entity>
    
    @Binding var addingToFavorites: Bool
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    
                    // main title
                    Text(article.mainTitle).font(.headline)
                    
                    
                    // main image
                    Image(article.mainImage).resizable().aspectRatio(contentMode: .fit).frame(minWidth: 50, maxWidth: .infinity, minHeight: 200).cornerRadius(20)
                    
                    
                    // main article
                    Text("\(article.mainArticle)\n").font(.subheadline)
                    
                    
                    // ForEach
                    ForEach(article.gallaryImageAndArticle) { brand in
                        
                        VStack(alignment: .leading) {
                            Text(brand.title).font(.headline).tint(.black)
                            Image(brand.image).resizable().aspectRatio(contentMode: .fit).frame(minWidth: 50, maxWidth: .infinity, minHeight: 200).cornerRadius(20)
                            Text("\(brand.article)\n").font(.subheadline)
                            
                        }
                        
                    }
                    
                    // main article link
                    Link(destination: URL(string: article.articleLink) ?? URL(string: "https://google.com")!) {
                        
                        Text("\n\nFor more information visit:\n\(article.articleLink)").font(.subheadline).multilineTextAlignment(.leading)
                        
                    }
                    
                }
                
            }.toolbar(content: {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        
                        dismiss.callAsFunction()
                        
                    } label: {
                        
                        Image(systemName: "chevron.down").foregroundColor(.accentColor)
                        
                    }

                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        
                        addingToFavorites.toggle()
                        
                        if addingToFavorites == true {
                            
                            let gallaryCar = GallaryCar_Entity(context: managedObjectContext)
                            gallaryCar.id = article.id
                            gallaryCar.mainImage = article.mainImage
                            gallaryCar.mainTitle = article.mainTitle
                            gallaryCar.mainArticle = article.mainArticle
                            gallaryCar.articleLink = article.articleLink
                            gallaryCar.gallaryImageAndArticle = article.gallaryImageAndArticle as NSObject
                            gallaryCar.tag = Int16(article.tag)
                            
                            try? managedObjectContext.save()
                            
                        } else {
                            
                            let elementsShouldDelete = favorits.filter { e in

                                return e.mainTitle == article.mainTitle
                                
                            }
                            
                            for element in elementsShouldDelete {
                                
                                managedObjectContext.delete(element)
                                
                            }
                            
                            try? managedObjectContext.save()
                            
                        }
                        
                    } label: {
                        
                        if addingToFavorites == true {
                            
                            Image(systemName: "heart.fill")
                            
                        } else {
                            
                            Image(systemName: "heart")
                            
                        }
                        
                    }

                }
                
            }).padding()
            
        }
        
        
    }
}

//struct GallaryDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        GallaryDetailsView(article: .constant(GallaryCar(mainTitle: "", mainArticle: "", mainImage: "", gallaryImageAndArticle: [], articleLink: "", tag: 0)))
//    }
//}
