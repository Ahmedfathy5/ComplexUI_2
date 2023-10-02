//
//  ContentView.swift
//  Nike
//
//  Created by Ahmed Fathi on 02/10/2023.
//

import SwiftUI

struct ContentView: View {
    let width = UIScreen.main.bounds.width
    @State var more = false
    @State var gender = "Male"
    @State var size = 6
    @State var added: Bool = false
    var body: some View {
        ScrollView {
            VStack{
                
                ZStack {
                    HStack {
                        Button(action:{} ) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Color("red"))
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
                        }
                        Spacer()
                        Button(action:{} ) {
                            Image(systemName: "suit.heart")
                                .font(.system(size: 22))
                                .foregroundColor(.black)
                                .frame(width: 40, height: 40)
                                .background(.white)
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
                        }
                    }
                    Image("nike")
                        .resizable()
                        .frame(width: 55, height: 55)
                }
                .padding()
                Image("shoe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width - (more ? 200 : 100))
                    .padding(.top , 25)
                
                ZStack {
                    Color.white
                        .clipShape(CustomShape())
                       .shadow(color: .black.opacity(0.12), radius: 5, x: -5, y: -10)
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Nike Air Huarache For Women")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            Spacer()
                            Text("$ 168")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("red"))
                        }
                        .padding(.top , 25 )
                        .padding(.trailing)
                        VStack(alignment: .leading  , spacing: -15) {
                            Text("dflldfkhgdflvdfhlkuvbdfklvgdflvudfsovdnovldfnolvdfujlfdvdflujnldfdsfislnedfivfnedfvinpefviefnvefpivgprdkflnlsdjkngldfjvgdkjglkfjglfdkjfdlkjfdlgkjdglkhjdfglhndfgl,knhdfhdghfgjdfhgndlfjvgndfljvgndf lvkjdfvgdf;lkvdflkvnbdflknsdlkfsdkjflksjglfhgkjhdfkgjhdfkgjhdskjfghdkfjghdkfhgkdfjhgkdfjhgdkf")
                                .padding(.trailing)
                                .lineLimit(more ? nil : 3)
                                .foregroundColor(.black.opacity(0.5))
                            Button(action: { withAnimation {
                                more.toggle()
                            }}){
                                
                                Text("Read more")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("red"))
                                    .padding([.vertical , .trailing])
                            }
                        }
                        HStack(spacing: 15) {
                            Text("Gender")
                                .fontWeight(.heavy)
                                .frame(width: 75,alignment:.leading)
                            GenderButton(gender: $gender, title: "Male")
                            GenderButton(gender: $gender, title: "Female")
                        }
                        HStack(spacing: 15) {
                            Text("Size")
                                .fontWeight(.heavy)
                                .frame(width: 75,alignment:.leading)
                            ForEach(sizes,id:\.self) { title in
                                SizeButton(size: $size, title: title)
                            }
                        }
                        .padding(.top , 15 )
                        .padding(.trailing)
                        Spacer()
                        Button(action: {added.toggle() }) {
                            Label {
                                Text( added ? "Added" : "Add To Bag")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                            } icon: {
                                Image(systemName: added ? "checkmark.circle.fill": "cart.fill")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.vertical , 12)
                        .frame(width: width - 75)
                        .background(added ? .green : .red)
                        .clipShape(Capsule())
                        .padding(.leading , -45)
                        .padding(.bottom)
                    
                        
                       
                    }
                    .padding(.leading , 45)
                }
                .padding(.top , 30)
            }
            .padding(.top , -30)
        }
        
    }
    }
struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: 85, height: 85))
        return Path(path.cgPath)
    }
}
struct GenderButton : View {
    @Binding var gender: String
    var title :String
    var body: some View {
        Button {
            gender = title
        } label: {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(gender == title ? .white : .black)
                .padding(.vertical , 10)
                .frame(width: 80)
                .background(gender == title ? Color("red") : Color.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
        }

    }
}
struct SizeButton : View {
    @Binding var size: Int
    var title :Int
    var body: some View {
        Button {
            size = title
        } label: {
            Text("\(title)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(size == title ? .white : .black)
                
                .frame(width: 25, height: 25)
                .background(size == title ? Color("red") : Color.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
        }

    }
}
var sizes = [6,7,8,9,10]
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

