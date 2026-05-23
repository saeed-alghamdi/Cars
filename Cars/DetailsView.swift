//
//  DetailsView.swift
//  Cars
//
//  Created by RMP on 13/10/1447 AH.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: []) var favorits: FetchedResults<CarBrand_Entity>
    
    @Binding var id: UUID
    @Binding var image: String
    @Binding var topic: String
    @Binding var details: String
    @Binding var otherImage: String?
    @Binding var moreDetails: String?
    @Binding var articleLink: String
    @Binding var tag: Int
    
    @Binding var addingToFavorites: Bool
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    
                    if otherImage != nil  && moreDetails != nil {
                        
                        Text(topic).font(.headline)
                        
                        Image(image).resizable().aspectRatio(contentMode: .fit).frame(minWidth: 50, maxWidth: .infinity, minHeight: 200).cornerRadius(20)
                        
                        Text(details).font(.subheadline)
                        
                        Image(otherImage!).resizable().aspectRatio(contentMode: .fit).frame(minWidth: 50, maxWidth: .infinity, minHeight: 200).cornerRadius(20)
                        
                        Text(moreDetails!).font(.subheadline)
                        
                        
                        Link(destination: URL(string: articleLink) ?? URL(string: "https://google.com")!) {
                            
                            Text("For more information visit:\n\(articleLink)").font(.subheadline).multilineTextAlignment(.leading)
                            
                        }
                        
                        
                    } else {
                        
                        Text(topic).font(.headline)
                        
                        Image(image).resizable().aspectRatio(contentMode: .fit).frame(minWidth: 50, maxWidth: .infinity, minHeight: 200).cornerRadius(20)
                        
                        Text(details).font(.subheadline)
                        
                        Link(destination: URL(string: articleLink)!) {
                            Text("For more information visit:\n\(articleLink)").font(.subheadline).multilineTextAlignment(.leading)
                        }
                        
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
                            let carBrand = CarBrand_Entity(context: managedObjectContext)
                            carBrand.id = id
                            carBrand.image = image
                            carBrand.topic = topic
                            carBrand.details = details
                            carBrand.otherImage = otherImage
                            carBrand.moreDetails = moreDetails
                            carBrand.articleLink = articleLink
                            carBrand.tag = Int16(tag)
                            try? managedObjectContext.save()
                            
                        } else {
                            
                            let elementsShouldDelete = favorits.filter { e in
                                return e.topic == topic
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
