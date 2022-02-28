//
//  OnBoarding.swift
//  UI-485
//
//  Created by nyannyan0328 on 2022/02/28.
//

import SwiftUI

struct OnBoarding: View {
    
    @State var offfset : CGFloat = 0

    var body: some View {
        
        OffsetPageTabView(offset: $offfset) {
            
            HStack(spacing:0){
                
                ForEach(boadingScreens){screen in
                    
                    
                    VStack(spacing:20){
                        
                        Image(screen.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                            .offset(y: -160)
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text(screen.title)
                                .font(.largeTitle.weight(.bold))
                              
                            
                            
                            Text(screen.decription)
                                .font(.caption.weight(.semibold))
                              
                        
                            
                            
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity,alignment:.leading)
                        
                        
                    }
                    .padding()
                    .frame(width:getScreenBounds().width)
                    
                    
                }
                
                
                
            }
          
            
            
        }
        .background(
        
        RoundedRectangle(cornerRadius: 50)
            .fill(.white)
            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
            .scaleEffect(2)
            .rotationEffect(.init(degrees: 25))
            .rotationEffect(.init(degrees: getRotaion()))
            .offset(y: -getScreenBounds().width + 20)
        
        
        ,alignment: .leading
        
        
        )
        .background(Color("screen\(getIndex() + 1)").animation(.easeInOut, value: getIndex()))
        .ignoresSafeArea()
        .overlay(alignment: .bottom) {
            
            
            VStack{
                
                
                HStack{
                    
                    
                    Button {
                        
                    } label: {
                        
                        Text("Login With Jacob")
                            .font(.callout.weight(.semibold))
                            .foregroundColor(.black)
                            .padding(.vertical,13)
                            .padding(.horizontal,20)
                            .background(.white,in: RoundedRectangle(cornerRadius: 8))
                            .frame(maxWidth:.infinity,alignment: .center)
                          
                    }
                    
                 
                    
                    
                    
                    Button {
                        
                    } label: {
                        
                        Text("Login With Jacob")
                            .font(.callout.weight(.semibold))
                            .foregroundColor(.black)
                            .padding(.vertical,13)
                            .padding(.horizontal,20)
                            .background(.white,in: RoundedRectangle(cornerRadius: 8))
                            .frame(maxWidth:.infinity,alignment: .center)
                          
                    }

                }
                
                
                HStack{
                    
                    
                    Button {
                        
                        offfset = max(offfset - getScreenBounds().width, getScreenBounds().width * 3)
                        
                    } label: {
                        
                        
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                    
                    HStack{
                        
                        
                        ForEach(boadingScreens.indices,id:\.self){index in
                            
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 9, height: 9)
                                .opacity(index == getIndex() ? 1 : 0.5)
                                .scaleEffect(index == getIndex() ? 2 : 1)
                                .animation(.linear, value: getIndex())
                            
                            
                        }
                        
                        
                        
                        
                    }
                    .frame(maxWidth:.infinity,alignment: .center)
                    .padding(.top,15)
                    
                    
                    Button {
                        
                        
                        offfset = min(offfset + getScreenBounds().width, getScreenBounds().width * 3)
                        
                    } label: {
                        
                        
                        Text("Next")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }

                }
            }
            .padding(.top,10)
            .padding(.horizontal,20)
            
            
            
            
            
        }
    }
    
    func getRotaion()->Double{
        
        let progress = offfset / (getScreenBounds().width * 4)
        
        let rotation = progress * 360
        
        
        return rotation
        
        
        
    }
    
    func getIndex()->Int{
        
        let progress = (offfset / getScreenBounds().width).rounded()
        
        return Int(progress)
        
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getScreenBounds()->CGRect{
        
      return UIScreen.main.bounds
    }
}
