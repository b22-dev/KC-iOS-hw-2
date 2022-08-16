

import SwiftUI

struct topBar: View {
    var body: some View {
        VStack{
            HStack{
                Image("mc")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .shadow(radius: 20)
                Spacer()
            Text("ماكدونالدز")
                .fontWeight(.bold)
                .foregroundColor(.yellow)
                .font(.system(size: 30))
            } .padding()
            Color.gray
                .frame(width: 350, height: 0.5)
                .cornerRadius(50)

        }
    }
}

struct topBar_Previews: PreviewProvider {
    static var previews: some View {
        topBar()
    }
}
