//
//  GraficaView.swift
//  Examen iOS1
//
//  Created by Aeron on 29/03/22.
//
 
import SwiftUI
struct GraficaView: View {
    
private var viewModel: ViewModel = ViewModel()
    
    var body: some View {
   
        
    ZStack{
    Image("verdeBack")
        VStack{
        Image("grafica")
    VStack{
        Text("Graficas")
            .foregroundColor(.green)
            .textContentType(.emailAddress)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background(Color.black)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5))
            .padding()
        
        Button("Preciona aqui,Para consulta de graficas") {
            viewModel.executeAPI()
            }
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 5))
        .background(Color.black)
        .foregroundColor(.green)
        
    }
     }
    
  }
}
}
struct GraficaView_Previews: PreviewProvider {
    static var previews: some View {
        GraficaView()
    }
}
