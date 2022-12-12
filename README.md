# flutter_noteapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 12 - 11

1. note 모델 클래스 작성
2. note 모델을 사용하는 abstract repository 작성
3. note 데이터를 db에서 직접 가져올 data_source sqflite 작성
4. 3을 가지고 있는 repository_impl 작성
5. note_db_helper test code 작성

# 12 - 12

1. note model, repository를 활용한 use_case 작성
2. note_view_model을 작성하기 앞서 view에서 발생되기록 예상되는 이벤트는 3가지(노트보기, 노트삭제, 노트되돌리기)그 외에도 발생하는 이벤트에 대해 컨트롤 하기 위해 freezed를 사용하여 note_event클래스 생성
3. viewModel에서는 onEvent 메서드와 freezed의 when만을 사용해서 이벤트 분기처리
