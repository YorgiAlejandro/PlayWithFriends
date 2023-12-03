import SwiftUI

struct RouletteView: View {
    @State private var participants: [Participant] = [Participant(name: "Yorgi"), Participant(name: "Celia")] // Inicializar con la cantidad de participantes especificada
    @State private var winner: Participant? = nil

    var body: some View {
        VStack {
            Image("Ruleta") // Imagen del disco giratorio
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                //.rotationEffect(.degrees(winner == nil ? 0 : 180)) // Girar la imagen si hay un ganador
                .rotationEffect(.degrees(winner == nil ? 0 : 360))
            if winner == nil {
                Text("Presiona el botón para girar la ruleta")
            } else {
                Text("El ganador es \(winner!.name)")
            }

            Button(action: {
                winner = selectWinner()
            }) {
                Text("Girar")
            }
        }
    }
}

struct Ruleta_Previews: PreviewProvider {
    static var previews: some View {
        RouletteView()
    }
}

struct Participant {
    var name: String
    // Agregar cualquier otra propiedad relevante
}

extension RouletteView {
    func selectWinner() -> Participant? {
        return participants.randomElement()
    }
}
