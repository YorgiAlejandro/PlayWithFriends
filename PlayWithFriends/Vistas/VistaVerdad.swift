import SwiftUI

///Vista de Verdades
struct VerdadView: View {
@State private var listo = ""
@State private var isActive = true
@State private var preguntaID = UUID()  // Variable que cambia para forzar la actualización de la vista
var arrayOfQuestions:[String] = ["Cual es la persona que más te ha gustado en la vida?",
                                 "En escala de 1 a 10 valora a los demas jugadores?",
                                 "A quien detestas más entre los demas jugadores?",
                                 "Con quien estuvistes por última vez?"]

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
                listo = "Gracias por decir la verdad"
                preguntaID = UUID()
            }.buttonStyle(.borderedProminent).tint(.green).shadow(color: .black, radius: 5, x: 5, y: 5)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("fondoverdad"))
    }
}
}
