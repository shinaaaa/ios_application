//
//  MainCardView.swift
//  SwiftUI-Practice
//
//  Created by shin kim on 2021/03/14.
//

import SwiftUI

struct MainCardView : View {
    var body: some View {
        
        /**
         alignment -> 정렬
         .leading -> 좌측 정렬
         .trailing -> 우측 정렬
         .center -> 중앙 정렬
         (Text의 경우 속성이 적용됨)
         */
        VStack(alignment: .leading, spacing: 0) {
            Rectangle().frame(height:0)
            // Text
            Text("테스트")
                .font(.system(size: 23))
                .fontWeight(.bold)
                .padding(.bottom, 5)
            Text("1-10")
                .font(.system(size: 23))
                .fontWeight(.bold)
            
            // 공간 띄우기
            Spacer().frame(height:30)
            
            HStack {
                Image("user1")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .overlay(   // layout 겹치기
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.red))
                
                Image("user2")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.red))
                
                Image("user3")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.red))
                
                Spacer()
                
                Text("확인")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(20)
                    .frame(width: 80)
                    .background(Color.blue)
                    .cornerRadius(20)
            }

        }
        .padding(30)    // background보다 먼저 작성해야함
        .background(Color.yellow)   // 배경색
        .cornerRadius(20)   // 둥글게, background보다 나중에 작성
    }
    
    struct MainCardView_Previews: PreviewProvider {
        static var previews: some View {
            MainCardView()
        }
    }
}

