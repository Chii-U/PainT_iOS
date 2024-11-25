//
//  painRecordUnitySwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//
//  3D 신체 페이지

import SwiftUI

struct painRecordUnitySwiftUIView: View {
//    @State var location: [String] = ["척추 중간에서 살짝 아래 부분"]
    @State var locations: [String] = []
    @State var locationName: String = ""
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        Text("어느 부위에 통증이 발생했나요?")
            .fontWeight(.semibold)
            .font(.system(size:20))
        TextField("직접 입력해주세요", text: $locationName, onCommit: {
            if !locationName.isEmpty {
                locations.append(locationName)
            }
        })
            .focused($isTextFieldFocused)
            .padding(20)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(height: 1)
                    .padding(.top, 40) // 텍스트필드의 위쪽 패딩과 겹치지 않도록 조정
                    .padding(.bottom, -10) // 텍스트필드의 아래쪽 패딩과 겹치지 않도록 조정
            )
        Text("통증 부위를 입력한 후, Enter를 눌러주세요")
            .padding(.top, 10)
            .foregroundStyle(Color(hex: 0x252525))
        Spacer()
        NavigationLink(destination: painRecordInfoTriggerSwiftUIView(location: locations)) {
            Text("다음")
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color("AccentColor"))
                .foregroundColor(.white)
        } // NavigationLink
//        .navigationTitle("통증 기록")
    }
}
