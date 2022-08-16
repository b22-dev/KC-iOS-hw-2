

import SwiftUI

struct ContentView: View {
    @State var amount = 0.0
    @State var m1 = 0
    @State var m1price = 1.85
    @State var m2 = 0
    @State var m2price = 1.30
    @State var m3 = 0
    @State var m3price = 1.45
    
    @State var money = ""
    @State var status = ""
    @State var bm = 0.0
    @State var meal = "Meals"
    
    
    @State private var alert = false
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack{
                topBar()
                
                Text("قائمة الطعام")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("red"))
                    .font(.system(size: 20))
                    .padding(20)
                
            ZStack{
                Color("gray")
                VStack(alignment: .center){
                Color.white
                    .frame(width: 350, height: 400)
                    .cornerRadius(20)
                    }
                Spacer()
                VStack{
                    HStack{
                        Image("Mix Duo Meal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                        Text("Mix Duo Meal")
                            .fontWeight(.bold)
                        
                        Spacer()
                        HStack{
                        Text(String(format: "%.3f", m1price))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("yellow"))
                            Text(" K.D")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("yellow"))
                                .offset(x: -7)
                            }
                        }
                    
                    Stepper("\(m1) \(meal)", value: $m1, in: 0...10)

                    
                    Color.gray
                        .frame(width: 300, height: 1)
                    //m2
                    HStack{
                        Image("Chicken Mac")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                        Text("Chicken Mac")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        HStack{
                        Text(String(format: "%.3f", m2price))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("yellow"))
                            Text(" K.D")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("yellow"))
                                .offset(x: -7)
                            }
                    
                        }
                    
                    Stepper("\(m2) \(meal)", value: $m2, in: 0...10)

                    Color.gray
                        .frame(width: 300, height: 1)
                    
                    //m3
                    HStack{
                        Image("Big Tasty")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                        Text("Big Tasty")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        HStack{
                        Text(String(format: "%.3f", m3price))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("yellow"))
                            Text(" K.D")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("yellow"))
                                .offset(x: -7)
                            }
                    
                        }
                    
                    Stepper("\(m3) \(meal)", value: $m3, in: 0...10)
                    
                    
                    }
                .padding()
                .frame(width: 350)
                
                
                }

                
                VStack{
                    HStack{
                    TextField("المبلغ", text: $money)
                        .multilineTextAlignment(.center)
                        .frame(width: 50, height: 30)
                    Text("ادخل المبلغ الذي لديك:")
                        
                    }

                    HStack{
                        HStack{
                            Text("K.D ")
                                .font(.system(size: 11))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .offset(x: 5)
                            Text(String(format: "%.3f", amount))
                            .font(.system(size: 11))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            
                            Text("المبلغ الاجمالي:")
                                .font(.system(size: 11))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            }
                    }


                ZStack{
                    Color("red")
                        .frame(width: 230, height: 50)
                        .cornerRadius(50)
                    Text("حساب الفاتورة")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                } .shadow(radius: 5)
                    .onTapGesture {

                        // final price
                        amount = (m1price * (Double(m1) )) + (m2price * (Double(m2) )) + (m3price * (Double(m3) ))
                        bm = (Double(money) ?? 0.0) - amount

                        // calculate the price
                        if (Double(money) ?? 0.0) >= amount {
                            
                            status = "تمت العملية بنجاح!"
                            alert = true

                        } else if (Double(money) ?? 0.0) <= amount {
                            status = "عذرا! ليس لديك مال كافي"
                            alert = true
                        }
                        
                        if money == "" {
                            status = "يرجي ادخال قيمة المبلغ الذي تمتلكه"
                            alert = true
                        }

                        
                    }
                    .alert(isPresented: $alert) {
                        Alert(title: Text(status), message: Text("الباقي: \(bm)"), dismissButton: .default(Text("تم")))
                    }
//                    Text("\(status)")
//                        .foregroundColor(Color("red"))
//                        .fontWeight(.bold)
//                        .font(.system(size: 20))
                }
            }
        }
}

    
    struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
