//
//  VerdadReto.swift
//  PlayWithFriends
//
//  Created by Yorgi Del Rio on 11/16/23.
//
import SwiftUI


///Vistas

///Vista principal VerdadReto
struct VerdadReto: View {
    @Binding var listOfPlayers: [String]
    @State private var playerID = UUID()
    @State var isShowingVerdadView: Bool = false
    @State var isShowingRetoView: Bool = false
    @State var name: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                ///Vista de Triangulo con pico pa abajo
                TriangleUp()
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .purple]), startPoint: .top, endPoint: .bottom))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(TriangleUp())
                    .onTapGesture {
                        self.isShowingVerdadView = true
                    }
                    .background(NavigationLink("", destination: VerdadView(), isActive: $isShowingVerdadView))
                    
                ///Vista de Triangulo con pico pa arriba
                TriangleDown()
                    .fill(LinearGradient(gradient: Gradient(colors: [.init(red: 0.000, green: 0.188, blue: 1.000), .purple]), startPoint: .bottom, endPoint: .top))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(content: {
                            Text("Verdad")
                                .foregroundColor(.white)
                                .font(.system(size: 100, weight: .bold, design: .rounded))
                                .offset(x: -140, y: -140)
                                .rotationEffect(.degrees(61))
                        })
                        .overlay(content: {
                            Text("Reto")
                                .foregroundColor(.white)
                                .font(.system(size: 100, weight: .bold, design: .rounded))
                                .offset(x: 80, y: 130)
                                .rotationEffect(.degrees(61))
                        })
                        .contentShape(TriangleDown())
                        .onTapGesture {
                            self.isShowingRetoView = true
                        }
                        .background(NavigationLink("", destination: RetoView(), isActive: $isShowingRetoView))
                Button("\(name)'s turn"){
                    name = listOfPlayers.randomElement() ?? ""
                    playerID = UUID()
                }
                    .padding(20)
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(20)
                    .rotationEffect(.degrees(61))
                    .id(playerID)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [.red, .init(red: 0.000, green: 0.188, blue: 1.000)]), startPoint: .top, endPoint: .bottom))
        }
        .onAppear(perform: {
            name = listOfPlayers.randomElement() ?? ""
                    })
    }
}

///Vista de añadir Players
struct Players :  View {
    @State var listOfPlayers: [String]
    @State var newName: String = ""
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Añade a todos los participantes", text: $newName )
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .padding()
                } header: {
                    HStack {
                        Image(systemName: "gamecontroller.fill").resizable().scaledToFit().frame(width: 60).foregroundColor(.blue)
                        VStack{
                            Text("Verdad").foregroundColor(.blue).bold().font(.title)
                            Text("Reto").foregroundColor(.red).bold().font(.title)
                        }
                        
                    }
                    HStack {
                        Button("Añadir"){
                            if !newName.isEmpty {
                                listOfPlayers = listOfPlayers.filter { !$0.isEmpty }
                                listOfPlayers.append(newName)
                                newName = ""
                            }
                        }.buttonStyle(.borderedProminent).tint(.pink)
                        Spacer()
                        NavigationLink("Listo") {
                            VerdadReto(listOfPlayers: $listOfPlayers)
                        }.buttonStyle(.borderedProminent).tint(.blue)
                    }
                }
                List{
                    Section {
                        ForEach(listOfPlayers, id: \.self) { participante in
                            Text("\(participante)").foregroundColor(.green).bold().font(.title2)
                        }
                    } header: {
                        Label("Participantes", systemImage: "person.3.sequence.fill")

                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
    }
}







///Vista de Canvas
struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Players(listOfPlayers: [""])
    }
}


