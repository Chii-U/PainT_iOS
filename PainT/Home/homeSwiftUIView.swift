//
//  homeSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//
// 홈 페이지

import SwiftUI

struct homeSwiftUIView: View {
    @State var diseaseName: String = "척추관 협착증"
    @State var count: String = "3"
    @State var percent: CGFloat = 10
    @State var exercises: [String] = ["Wall_Squats", "Seated_Hamstring_Stretch"]
    @State var exerciseTimes: [String] = ["15sec", "15sec"]
    @State var totalTime: String = "30초"
    
    // 캘린더용
    @State private var date = Date()
    @State private var isModalPresented = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // 질환명
                HStack(spacing: 0) {
                    Text("질환명 | ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text("\(diseaseName)")
                        .font(.system(size: 20))
                } // HStack
                .padding(.bottom, 25.0)
                .padding(.horizontal, 20.0)
                
                // 치유 달성도
                VStack {
                    // 제목 & 횟수
                    GeometryReader { geometry in
                        HStack(alignment: .center, spacing: 0) {
                            Text("오늘의 치유 달성도")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
//                                .padding(.trailing, 80)
                            Spacer()
//                            Text("\(count)")
//                                .font(.system(size: 24))
//                                .fontWeight(.bold)
//                            Text("번째 치유 중")
                        } // HStack
                        .frame(width: geometry.size.width)
                    } // GeometryReader
                    .padding(.bottom, 17.0)
                    
                    // 막대 & 퍼센트
                    HStack(alignment: .center) {
                        // 막대
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                // 전체 바
                                Rectangle()
                                    .fill(Color(red: 0.63, green: 0.63, blue: 0.63))
                                    .frame(height: 10)
                                    .clipShape(RoundedRectangle(cornerRadius: 100))
                                
                                // 퍼센트 바
                                Rectangle()
                                    .fill(Color("AccentColor"))
                                    .frame(width: geometry.size.width * (percent / 100), height: 10)
                                    .clipShape(RoundedRectangle(cornerRadius: 100))
                            } // ZStack
                        } // GeometryReader
                        .padding(.top, 5.0)
                        
                        // 퍼센트 텍스트
                        Text("\(Int(percent))%")
                    } // HStack
                } // VStack
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                
                // 구분선1
                Rectangle()
                    .foregroundStyle(Color(hex: 0xF0F0F0))
                    .frame(width: UIScreen.main.bounds.width, height: 2)
                
                // 캘린더
                    // 캘린더 title
                Text("통증 달력")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding([.leading,.top], 20)
                
                    // 캘린더 뷰
                VStack {
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .onChange(of: date) {
                        isModalPresented = true
                    }
                } // VStack
                .padding(.horizontal, 20)
                .sheet(isPresented: $isModalPresented, onDismiss: {
                    isModalPresented = false
                }) {
                    modalView(selectedDate: $date)
                        .presentationDetents([.fraction(0.8)])
                        .presentationDragIndicator(.visible)
                }
                
                // 구분선2
                Rectangle()
                    .foregroundStyle(Color(hex: 0xF0F0F0))
                    .frame(width: UIScreen.main.bounds.width, height: 2)
                    .padding(.bottom, 20)
                
                // 추천 가이드 루틴
                    // 가이드 title
                Text("치유 가이드")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding([.leading, .bottom], 20)
                    
                    // 가이드 list
                VStack(alignment: .center, spacing: 0) {
                    HStack {
                        // 개수 & 시간
                        Text("총 \(exercises.count)개 | 🕒 \(totalTime)")
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        // [버튼] 추천 가이드 시작하기
                        NavigationLink(destination: guideSwiftUIView()) {
                            Text("추천 가이드 시작하기")
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: 0x252525)) // 글씨 색상
                                .padding(14)
                                .background(Color("AccentColor"))
                                .cornerRadius(14)
                        }
                        .padding(.trailing, 20)
                    } // HStack
                    .padding(.top, 20)
                    
                    // 루틴 리스트
                    ForEach(0..<exercises.count, id: \.self) { idx in
                        exerciseRow(exerciseName: exercises[idx], exerciseTime: exerciseTimes[idx], isLast: idx == exercises.count-1)
                    }
                } // VStack
                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.bottom, 20.0)
                .padding(.horizontal, 20)
            } // VStack
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("appIcon")
                }
            }
        } // ScrollView
    } // body
    
    // Exercise Row
    func exerciseRow(exerciseName: String, exerciseTime: String, isLast: Bool) -> some View {
        var body: some View {
            let destination: AnyView
            
            if isLast == true {
                destination = AnyView(lastGuideSwiftUIView())
            } else {
                destination = AnyView(guideSwiftUIView())
            }
            
            return NavigationLink(destination: destination) {
                HStack {
                    AsyncImage(url: URL(string: "http://chi-iu.com/videos/download/image/\(exerciseName)")) { result in
                        result
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 70, height: 70)
                    .padding(.leading, 20)
                    .padding(.vertical, 15)
                    Text("\(exerciseName)")
                        .padding(.leading, 20)
                        .foregroundColor(Color(.black))
                    Spacer()
                    Text("\(exerciseTime)")
                        .padding(.trailing, 20)
                        .foregroundColor(Color(.black))
                } // HStack
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(hex: 0x9E9E9E)),
                    alignment: .bottom
                )
            } // NavigationLink
        } // body
        return body
    } //
} // homeSwiftUIView

struct modalView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 10) {
                    Text("통증 기록")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.top, 30)
                    
                    // 날짜를 원하는 형식의 문자열로 변환
                    let dateFormatter: DateFormatter = {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "YYYY년 MM월 dd일"
                        return formatter
                    }()
                    
                    Text("\(dateFormatter.string(from: selectedDate))")
                    
                    // 통증 기록 리스트
                    ForEach(0..<3) { _ in
                        VStack(alignment: .leading) {
                            Text("통증 위치")
                            HStack {
                                Text("쑤시는 느낌")
                                Text("원인 모름")
                                Text("고통 8")
                            } // HStack
                        } // VStack
                        .background(Color("AccentColor").opacity(0.5))
                    } // List
                } // VStack
                .frame(minWidth: geometry.size.width*0.7)
            } // GeometryReader
        } // ScrollView
    }
}

#Preview {
    homeSwiftUIView()
}
