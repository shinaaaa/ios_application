//
//  MyCard.swift
//  SwiftUI-Practice
//
//  Created by shin kim on 2021/03/18.
//

import SwiftUI

struct MyCardView : View {
    
    var icon : String
    var title : String
    var start : String
    var end : String
    var bgColor : Color
    
    var body: some View {
        
        HStack(spacing:20) {
            Image(systemName:icon)
                .font(.system(size:40))
                .foregroundColor(Color.white)
             
            /**
             alignment -> 정렬
             .leading -> 좌측 정렬
             .trailing -> 우측 정렬
             .center -> 중앙 정렬
             (Text의 경우 속성이 적용됨)
             */
            VStack(alignment: .leading, spacing: 0) {
                Divider().opacity(0)
                // Text
                Text(title)
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 5)
                Text("\(start) - \(end)")
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                
            }
        }.padding(30)    // background보다 먼저 작성해야함
        .background(bgColor)   // 배경색
        .cornerRadius(20)   // 둥글게, background보다 나중에 작성
        
        
    }
    
    struct MyCardView_Previews: PreviewProvider {
        static var previews: some View {
            MyCardView(icon: "doc.fill", title: "책읽기", start: "1시", end: "3시", bgColor: Color.green)
        }
    }
}

