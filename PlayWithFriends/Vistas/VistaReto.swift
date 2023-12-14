import SwiftUI
///Vista de Retos
struct RetoView: View {
    @State private var listo = ""
    @State private var isActive = true
    @State private var preguntaID = UUID()  // Variable que cambia para forzar la actualización de la vista
    var arrayOfQuestions:[String] = ["Salta igual que una rana",
                                     "Dale un beso a otro jugador en el cuello",
                                     "Quitate una prenda",
                                     "Simula una posicion vergonsoza"]
    
    var body: some View {
        
        NavigationView {
            VStack{
                Text("\(arrayOfQuestions.randomElement() ?? "")")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                    .id(preguntaID)  // Este modificador fuerza la actualización de la vista cuando preguntaID cambia
                Text("\(listo)").foregroundColor(.green).bold().font(.title)
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                Button("Listo"){
                    listo = "Gracias por cumplir el reto"
                    preguntaID = UUID()
                }.buttonStyle(.borderedProminent).tint(.green).shadow(color: .black, radius: 5, x: 5, y: 5)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("fondoreto"))
        }
    }
}
