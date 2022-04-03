//
//  SplashView.swift
//  Examen iOS1
//
//  Created by Aeron on 30/03/22.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
    
            ZStack{
                    Color.cyan
                        .edgesIgnoringSafeArea(.all)
        Image("apple")
                    .padding(002)
                
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

}
