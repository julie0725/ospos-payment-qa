# 증거 자료

| 파일 | 내용 | 사용 문서 |
| --- | --- | --- |
| 00-initial-db.png | 고객 생성 직후 DB. 두 고객 모두 포인트 NULL | findings/01 |
| 01-baseline-db.png | 비교 실험 준비 후 결제 전 DB. 고객 B만 포인트 0으로 설정 | findings/01 |
| 02-midstate-giftcard.png | 기프트카드 결제 추가 후 Complete 전. 화면은 '잔액 30,000', DB는 50,000. 화면의 Points Available 0 | test-plan, findings/01 |
| 03-receipt-sale1.png | 판매 1 영수증 (고객 A, 기프트카드 잔액 30,000) | findings/02 |
| 04-receipt-sale2.png | 판매 2 영수증 (고객 B, 기프트카드 잔액 10,000) | findings/02 |
| 05-after-payment-db.png | 판매 2건 후 DB. 고객 A NULL, 고객 B 2,000, 기프트카드 10,000 | findings/01, 02 |
| 06-daily-sales.png | 취소 직전 Daily Sales 목록. 기프트카드 결제 합계 40,000 | findings/02 |
| 07-after-cancel-db.png | 취소 후 `qa_snapshot`. 기프트카드 10,000, 고객 B 2,000 그대로, 재고 10 복원 | findings/02 |
| 08-docker-restarting.png | 공식 설정으로 실행 시 `Restarting (1)`과 throttle.key 저장 실패 로그 | findings/03 |
| 09-dotenv-fatal.png | `.env` 연결 제거 후 Fatal error 화면과 재현 과정 | findings/03 |
| db-session-log.txt | 결제 전부터 취소 후까지 MariaDB 작업 원본 로그 | - |
