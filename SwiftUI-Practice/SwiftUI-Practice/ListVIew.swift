//
//  ListVIew.swift
//  SwiftUI-Practice
//
//  Created by shin kim on 2021/03/14.
//

import SwiftUI

struct ListView : View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(systemName: "line.horizontal.3")
                        .font(.largeTitle)
                    Spacer()
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                }.padding(20)
                
                Text("할일 목록")
                    .font(.system(size:40))
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                ScrollView {
                    VStack {
                        MainCardView()
                        MyCardView(icon: "book.fill", title: "책읽기", start: "1시", end: "3시", bgColor: Color.green)
                        MyCardView(icon: "doc.fill", title: "문서 정리하기", start: "3시", end: "4시", bgColor: Color.pink)
                        MyCardView(icon: "tray.fill", title: "책상 정리하기", start: "4시", end: "5시", bgColor: Color.purple)
                        MyCardView(icon: "tv.fill", title: "책상 정리하기", start: "5시", end: "6시", bgColor: Color.blue)
                        
                    }.padding()
                }
            }
            
            Circle()
                .foregroundColor(Color.yellow)
                .frame(width:60, height: 60)
                .overlay(
                    Image(systemName:"plus")
                        .font(.system(size:30))
                        .foregroundColor(.white)
                )
                .padding(.trailing, 10)
                .shadow(radius:20)
        }
    }
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }
}

