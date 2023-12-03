//
//  VerdadReto.swift
//  PlayWithFriends
//
//  Created by Yorgi Del Rio on 11/16/23.
//

import SwiftUI

struct VerdadReto: View {
    
    @State var isShowingVerdadView: Bool = false
    @State var isShowingRetoView: Bool = false
    
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
                        print("Verdad was pushed")
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
                            print("Reto was pushed")
                        }
                        .background(NavigationLink("", destination: RetoView(), isActive: $isShowingRetoView))
                Button("Yorgi's turn"){
                    print("Yorgi button was pushed")
                }.padding(20)
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(20)
                    .rotationEffect(.degrees(61))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [.red, .init(red: 0.000, green: 0.188, blue: 1.000)]), startPoint: .top, endPoint: .bottom))
        }
    }
}
//Struct de triangulo con pico pa arriba
struct TriangleDown: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

//Struct de triangulo con pico pa abajo
struct TriangleUp: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

//Vista de Preguntas
struct VerdadView: View {
    @State var pregunta: String = ""
    let arrayOfQuestions:[String] = ["Cual es la persona que más te ha gustado en la vida?",
                                     "En escala de 1 a 10 valora a los demas jugaores",
                                     "A quien detestas más entre los demas jugaodres",
                                     "Con quien estuvistes por última vez"]
    if let randomQuestion = arrayOfQuestions.randomElement() {
        pregunta = randomQuestion
    }
    var body: some View {
        Text("\(pregunta)")
        
    }
}

//Vista de Retos
struct RetoView: View{
    var body: some View{
        Text("Este es el Reto View")
    }
}

//Vista de Canvas
struct VerdadReto_Previews: PreviewProvider {
    static var previews: some View {
        VerdadReto()
    }
}
