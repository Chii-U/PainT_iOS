//
//  eulaSwiftUIView.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/9/24.
//

import SwiftUI

struct eulaSwiftUIView: View {
    @Binding var stack : [StackView<Any>]
    
    @State private var isAgreed1 = false
    @State private var isAgreed2 = false
    @State private var isAgreed3 = false
    @State private var isAgreed4 = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                EulaComponent(isChecked: $isAgreed1, text: eula1)
                EulaComponent(isChecked: $isAgreed2, text: eula1)
                EulaComponent(isChecked: $isAgreed3, text: eula1)
                EulaComponent(isChecked: $isAgreed4, text: eula1)
                
                Spacer(minLength: 30)
                
                Button("다음") {
                    stack.append(StackView(type: .sign, content: isAgreed4))
                }
                    .buttonStyle(NoColorButtonStyle())
                    .background(isAgreed1 && isAgreed2 && isAgreed3 ? Color.accentColor.cornerRadius(10) : Color(.systemGray5).cornerRadius(10))
                    .disabled(!isAgreed1)
                
                
//                    NavigationLink(destination: signUpSwiftUIView(stack:$stack , isAgreed4: isAgreed4)) {
//                        Text("다음")
//                    }
//                    .buttonStyle(NoColorButtonStyle())
//                    .background(isAgreed1 && isAgreed2 && isAgreed3 ? Color.accentColor.cornerRadius(10) : Color(.systemGray5).cornerRadius(10))
//                    .disabled(!isAgreed1)
            }
        
        } // ScrollView
        .navigationTitle("약관 동의")
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("appIcon")
            }
        }
        .navigationBarBackButtonHidden()
    
        
       
        
    }
}

struct EulaComponent: View {
    @Binding var isChecked: Bool
    var text: String

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical, showsIndicators: false){
                Text(text)
                    .frame(alignment: .leading)
                    .padding()
                    .multilineTextAlignment(.leading)
            }
            .background(Color(.systemGray5).cornerRadius(10))
            .padding(.vertical,10)
            .frame(maxWidth: .infinity, maxHeight: 300)
            
            Toggle(isOn: $isChecked) {
                Text("동의합니다.")
            }
            .toggleStyle(checkboxStyle())
        }
        
    }
}

var eula1 = """
제1조(목적) 이 약관은 〇〇은행(이하 “은행”이라 합니다.)과 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써, 거래의 신속하고 효율적인 처리를 도모하고 거래당사자 상호간의 이해관계를 합리적으로 조정하는 것을 목적으로 합니다.

제2조(용어의 정의)
① 이 약관에서 사용하는 용어의 의미는 다음 각 호와 같습니다.
 1. “전자금융거래”라 함은 은행이 전자적 장치를 통하여 제공하는 금융상품 및 서비스를 이용자가 전자적 장치를 통하여 비대면·자동화된 방식으로 직접 이용하는 거래를 말합니다.
 2. “이용자”라 함은 전자금융거래를 위하여 은행과 체결한 계약(이하 "전자금융거래계약"이라 합니다.)에 따라 전자금융거래를 이용하는 고객을 말합니다.
 3. “지급인”이라 함은 전자금융거래에 의하여 자금이 출금되는 계좌(이하 “출금계좌”라 합니다.)의 명의인을 말합니다.
 4. “수취인”이라 함은 전자금융거래에 의하여 자금이 입금되는 계좌(이하 “입금계좌”라 합니다.)의 명의인을 말합니다.
 5. “전자적 장치”라 함은 현금자동지급기, 자동입출금기, 지급용단말기, 컴퓨터, 전화기 그 밖에 전자적 방법으로 전자금융거래정보를 전송하거나 처리하는데 이용되는 장치를 말합니다.
 6. “접근매체”라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진정성을 확보하기 위하여 사용되는 다음 각목의 어느 하나에 해당하는 수단 또는 정보를 말합니다.
  가. 은행이 제공한 전자식 카드 및 이에 준하는 전자적 정보
  나.「전자서명법」에 따른 전자서명생성정보 또는 인증서
  다. 은행에 등록된 이용자 번호
  라. 등록되어 있는 이용자의 생체정보
  마. 가목 또는 나목의 수단이나 정보를 사용하는 데 필요한 비밀번호
 7. “전자문서”라 함은 「전자문서 및 전자거래기본법」 제2조 제1호의 규정에 따라 작성·변환되거나 송신·수신 또는 저장된 정보를 말합니다.
 8. “거래지시”라 함은 이용자가 전자금융거래계약에 의하여 은행에 개별적인 전자금융거래의 처리를 지시하는 것을 말합니다.
 9. “오류”라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 약관(개별약관을 포함합니다.), 전자금융거래계약 또는 이용자가 거래지시한 대로 이행되지 아니한 경우를 말합니다.
 10. “계좌송금”이라 함은 이용자가 자동입출금기를 통하여 자기 또는 타인의 계좌에 자금을 입금하는 것을 말합니다.
 11. “계좌이체”라 함은 지급인의 전자적 장치를 통한 지급지시에 따라 은행이 지급인의 출금계좌에서 자금을 출금하여 같은 은행 또는 다른 은행의 계좌에 입금하는 것을 말합니다.
 12. “예약에 의한 계좌이체”라 함은 계좌이체가 장래의 특정일자에 이루어지도록 이용자가 미리 거래지시하고 은행이 이를 해당일자에 처리하는 것을 말합니다.
 13. “추심이체”라 함은 수취인의 전자적 장치를 통한 추심지시에 따라 은행이 지급인의 출금계좌에서 자금을 출금하여 같은 은행 또는 다른 은행의 계좌에 입금하는 것을 말합니다.
 14. “예약에 의한 추심이체”라 함은 추심이체가 장래의 특정일자에 이루어지도록 이용자가 미리 거래지시하고 은행이 이를 해당일자에 처리하는 것을 말합니다.
 15. “지연이체”라 함은 이용자가 계좌이체 거래지시를 한 시점으로부터 일정시간이 경과한 후에 은행이 이를 처리하는 것을 말합니다.
 16. “영업일”이라 함은 통상 은행이 영업점에서 정상적인 영업을 하는 날을 말합니다.
 17. “단말기 지정 및 이용”이라 함은 이용자가 전자금융거래 시 계좌이체가 가능한 전자적 장치(이하 “단말기”라 합니다.)의 IP주소, MAC주소 등 기기정보를 은행에 등록하고 이용하는 것을 말합니다.
 18. “추가적인 보안조치”라 함은 이용자가 지정하지 않은 단말기를 이용하여 전자금융거래를 하는 경우 제6호의 접근매체 외의 휴대폰 문자 또는 2채널(서로 다른 두 가지 이상의 통신 경로를 이용) 등의 수단으로 본인임을 확인하는 방법을 말합니다.
 19. “전자서명”이라 함은 「전자서명법」 제2조 제2호의 규정에 따른 전자서명을 말합니다.
② 이 약관에서 별도로 정하지 아니한 용어는 「전자금융거래법」 및 관계 법령 등에서 정하는 바에 따릅니다.

제3조(적용되는 거래) 이 약관은 은행과 이용자 사이에 다음 각 호의 전자적 장치를 이용하여 이루어지는 계좌이체(예약에 의한 계좌이체 및 지연이체를 포함합니다. 이하 같습니다.), 추심이체(예약에 의한 추심이체를 포함합니다. 이하 같습니다.), 계좌송금과 관련한 조회, 입금, 출금 등의 전자금융거래에 적용됩니다.

1. 현금자동지급기, 자동입출금기, 지급용단말기에 의한 거래
2. 컴퓨터에 의한 거래
3. 전화기에 의한 거래
4. 기타 전자적 장치에 의한 거래

제4조(전자금융거래계약의 체결 및 해지)
① 이용자가 전자금융거래를 하고자 하는 경우에는 사전에 은행과 별도의 전자금융거래계약을 체결하여야 합니다. 다만, 다음 각 호의 1에 해당하는 경우에는 그러하지 아니합니다.
1. 예금잔액, 예금입출금내역 등 단순조회
2. 현금자동지급기, 자동입출금기, 지급용단말기에 의한 거래
3. 기타 은행이 정하는 거래

"""
