import SwiftUI
struct ListView: View {
    @State private var EscribeNombre: String = ""
var body: some View {
    
    
    NavigationView {
    
    List {
        if !EscribeNombre.isEmpty {
        }
        TextField("            Escribe Nombre", text: $EscribeNombre)
            .foregroundColor(.white)
            .padding()
            .background(Color.cyan)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
        ZStack{
            Text("TOMAR FOTO")
                .fontWeight(.black)
                .foregroundColor(Color.black)
                .padding(.all)
            NavigationLink(destination: CamaraView()) {
            Button("")
                {
                    
            }
                
            }
        }
        ZStack{
            Text(" GRAFICAS")
                .fontWeight(.black)
                .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0))
                .padding(.all)
            NavigationLink(destination: GraficaView()) {
            Button("") {
              }
            
        }
    }
}
    .colorInvert()
    .padding(.all)
    .navigationTitle("Prueba Tecnica iOS ")
        
        Image("pai")
        
      }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
  }

