//
//  HomeView.swift
//  Dino-world-3D
//
//  Created by Abundent on 03/11/24.
//

import SwiftUI

@MainActor
struct HomeView: View {
    @Environment(\.openWindow) private var openWindow
	
	@Environment(\.openImmersiveSpace) private var openImmersiveSpace
	@Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    var body: some View {

        VStack {
            Text("Welcome to Dino World 3D")
                .font(.title)
            VStack {
               
                HStack {
                     //DinoCard
                    Button(
                        action: {
                            openWindow(id: Dino_world_3DApp.dinoCard)
                        },
                        label: {
                            VStack(spacing: 10) {
                                Image("Velociraptor")
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .frame(width: 150, height: 150)
                                Text("Velociraptor Card")
                            }  //vstack-label
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                        }
                    )  //:Button
                    .buttonBorderShape(.roundedRectangle(radius: 25))
                    .gridColumnAlignment(.listRowSeparatorTrailing)

                    //DinoPortalCard
                    Button(
                    action: {
                        openWindow(id: Dino_world_3DApp.dinoPortalCard)
                    },
                    label: {
                        VStack(spacing: 10) {
                            Image("Triceratops")
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .frame(width: 150, height: 150)
                            Text("Triceratops Portal Card")
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    }
                )
                .buttonBorderShape(.roundedRectangle(radius: 25))
                }  //hstack-DinoCard-DinoPortalCard
                .frame(height: 220)
                

                HStack {
                    //stegosaurusModel3D
                    //stegosaurusRealityView
                    //brachiosaurusImmersive

                }//hstack-stegosaurusModel3D-stegosaurusRealityView
                .frame(height: 220)

                 HStack {
                    //findADino
                    

                }//hstack-findADino
                .frame(height: 220)

            }  //vstack-button
        }  //vstack-Card
        .padding(100)
    }

	//openSpace
     func openSpace(id: String) async {
        
        //dismiss any open immersive space first
        await dismissImmersiveSpace()
        
        switch await openImmersiveSpace(id: id) {
        case .opened:
            print("Immersive space \(id) successfully opened")
        case .error:
            fatalError("Error opening immersive space with id: \(id)")
        case .userCancelled:
            print("User cancelled")
        default:
            break
        }
    }
}

#Preview {
    HomeView()
}
