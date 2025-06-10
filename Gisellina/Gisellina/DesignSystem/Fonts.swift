import SwiftUI

// MARK: - 커스텀 폰트 시스템 정의 파일
// 이 파일은 Pretendard 커스텀 폰트를 SwiftUI 프로젝트에서 일관되게 사용할 수 있도록 도와주는 유틸리티입니다.

extension Font {
    /// Pretendard 폰트 패밀리의 다양한 굵기를 enum으로 정의
    /// 해당 enum의 rawValue를 통해 폰트 이름을 일관성 있게 관리할 수 있습니다.
    enum FontWeight: String {
        case appFontBold = "Pretendard-Bold"
        case appFontSemiBold = "Pretendard-SemiBold"
        case appFontMedium = "Pretendard-Medium"
        case appFontRegular = "Pretendard-Regular"
    }
}

// MARK: - 앱 내에서 사용할 커스텀 텍스트 스타일 정의
// 이름만 봐도 용도를 알 수 있게 스타일을 정의함
enum AppFontStyle {
    case display1   // 네비게이션 타이틀
    case title1     // 카드 제목
    case title2     // 시트 제목
    case body1      // 본문 텍스트
    case body2      // 네비게이션 서브타이틀
    case body3      // 시트 본문
    case label1     // 상단 탭뷰 레이블
    case label2     // 기록 카드 레이블(상단 설명)
    case label3     // 기록 카드 레이블(상단 설명)
    case label4     // 기록 카드 레이블(제목)
    case caption1   // 기록 페이지 카드 날짜
    
    
    /// 스타일에 따라 사용할 폰트 이름 반환
    var name: String {
        switch self {
        case .display1:
            return Font.FontWeight.appFontBold.rawValue
        case .title1, .title2, .label1, .label2, .caption1:
            return Font.FontWeight.appFontSemiBold.rawValue
        case .body1, .label3:
            return Font.FontWeight.appFontMedium.rawValue
        case .body2, .body3, .label4:
            return Font.FontWeight.appFontRegular.rawValue
        }
    }
    
    /// 스타일에 따라 사용할 폰트 크기 설정
    var size: CGFloat {
        switch self {
        case .display1: return 22   // 네비게이션 타이틀
        case .title1: return 22     // 카드 제목
        case .title2: return 20     // 시트 제목
        case .body1: return 16      // 본문 텍스트
        case .body2: return 16      // 네비게이션 서브타이틀
        case .body3: return 16      // 시트 본문
        case .label1: return 20     // 상단 탭뷰 레이블
        case .label2: return 18     // 기록 카드 레이블(상단 설명)
        case .label3: return 18     // 기록 카드 레이블(상단 설명)
        case .label4: return 16     // 기록 카드 레이블(제목)
        case .caption1: return 14   // 기록 페이지 카드 날짜
        }
    }
}

// MARK: - ViewModifier를 이용한 커스텀 폰트 적용
// SwiftUI의 .modifier()를 통해 폰트 스타일을 적용할 수 있게 함
struct CustomFontModifier: ViewModifier {
    let style: AppFontStyle
    
    func body(content: Content) -> some View {
        // 설정된 폰트 이름과 크기를 사용하여 커스텀 폰트 적용
        content.font(.custom(style.name, size: style.size))
    }
}

// MARK: - View 확장
// .customFont(.title1) 형태로 폰트 스타일을 쉽게 적용할 수 있도록 도와주는 확장
extension View {
    func customFont(_ style: AppFontStyle) -> some View {
        self.modifier(CustomFontModifier(style: style))
    }
}
