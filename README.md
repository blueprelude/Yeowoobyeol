# 📚 여우별 도서관

JDBC + Spring Boot + Gradle 기반 **풀스택 전자 도서관 서비스**  
사용자 → 로그인·검색·대여·반납  
관리자 → 회원·도서 관리 + 시스템 유지보수  

---

## 🌟 프로젝트 소개
- 📅 **개발 기간**: 2025.08.21 ~ 2025.09.03  
- **팀 구성**: 김태경(팀장) · 황윤윤 · 김은채 · 조홍규
- **팀 역할**:
  - 김태경(팀장): 프로젝트 총괄, 관리자 페이지 UI/UX, 다크 모드 기능, 프로젝트 문서 정리, 발표 자료 제작
  - 황윤윤: 사용자 목록 및 도서 목록 DB 처리, DB 설계
  - 김은채: 로그인 및 회원 가입 페이지 UI/UX, 내 정보 페이지 UI/UX, 로그인 및 회원 가입 기능, 내 정보 조회 및 수정 기능
  - 조홍규: 홈 화면 UI/UX, 검색 결과 조회 기능, 도서 대여 기능, 도서 대여 및 반납 내역 조회 기능
- **핵심 기능**  
  - **도서 대여** 및 **도서 반납** 기능
  - **다크 모드** 기능
- **노션**: [프로젝트 상세 보고서](https://www.notion.so/Project1-Team-4-24f5547a5bd58023a23ae066de19e18e)

---

## ⚡ 기술 스택
| 영역 | 기술 |
|------|------|
| 🎨 Frontend | HTML, CSS, JavaScript (Vanilla) |
| 🔧 Backend | Spring Boot (Java 17) |
| 🗄️ Database | Oracle (JDBC 연동) |
| 📦 Build Tool | Gradle |
| 🤝 협업 | GitHub, Notion |

---

## 💻 UI 미리보기

### 📖 메인
![main png](./docs/main.png)

### 🔑 로그인 & 회원가입
| 로그인 | 회원가입 |
|--------|-----------|
| ![login png](./docs/login.png) | ![register png](./docs/register.png) |

### 📚 도서 검색 & 대여
| 검색 | 대여 | 반납 |
|------|------|------|
| ![search png](./docs/result.png) | ![rent png](./docs/rent.png) | ![return png](./docs/return.png) |

### 🛠 관리자 페이지
| 도서 관리 | 사용자 관리 |
|-----------|-------------|
| ![booklist png](./docs/booklist.png) | ![userlist png](./docs/userlist.png) |

---

## 🎥 시연 GIF

### 🔑 로그인 & 회원가입  
![login gif](./docs/loginregister.gif)  

### 📚 도서 검색 & 대여  
![search and rent_gif](./docs/searchrent.gif)

### 🛠 관리자 페이지  
![admin_gif](./docs/admin.gif)
