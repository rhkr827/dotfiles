# Windows PowerShell Oh-My-Posh Dotfiles

Windows PowerShell 7 환경을 위한 **Oh My Posh 테마 및 생산성 설정**입니다.

---

## ⚡ 빠른 시작 (1-Click 설치)

### 방법 1: 배치 파일 실행
`setup_theme.bat` 파일을 우클릭하여 **[관리자 권한으로 실행]** 또는 더블 클릭하여 실행합니다.

### 방법 2: PowerShell 스크립트 실행
PowerShell 콘솔에서 다음 명령어를 실행합니다:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\setup_theme.ps1
```

---

## 📦 구성 요소

1. **Oh My Posh 테마 (`powershell/my.omp.json`)**
   - 세련된 다이아몬드/파워라인 스타일 프롬프트
   - Git 브랜치, 변경/스테이징 상태 실시간 표시
   - 실행 시간 및 디렉터리 경로 최적화

2. **PowerShell 프로필 (`powershell/user_profile.ps1`)**
   - **posh-git**: Git 명령어 자동완성 및 상태 표시
   - **Terminal-Icons**: 폴더 및 파일 확장자별 아이콘 렌더링
   - **PSFzf**: 퍼지 검색 (`Ctrl+F`: 파일 검색, `Ctrl+R`: 명령어 히스토리 검색)
   - **PSReadLine**: Emacs 스타일 키바인딩 (`Ctrl+D`: 글자 삭제), 히스토리 자동완성 제안
   - **which 함수**: 리눅스 스타일 명령어 경로 조회 유틸리티

---

## 🔤 권장 폰트 (Nerd Font)

프롬프트의 특수 아이콘(Git, 폴더 아이콘 등)이 정상 표시되려면 **Nerd Font**가 필요합니다.

```powershell
oh-my-posh font install
# Meslo 또는 Hack Nerd Font 선택 권장
```

설치 후 Windows Terminal 설정에서 기본 글꼴을 설치한 Nerd Font로 지정해 주세요.
