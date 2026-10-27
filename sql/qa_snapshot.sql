-- OSPOS 결제·포인트 정합성 검증용 SQL
-- 실행: docker exec -it mysql mysql -uadmin -ppointofsale ospos

-- 1. 검증용 뷰 (1회 생성)
-- 기프트카드 잔액, 고객 포인트, 재고, 판매 상태, 적립 이력을 한 표에 세로로 모은다.
-- 특정 번호를 고정하지 않아 고객·판매가 늘어나도 자동으로 모두 표시된다.
CREATE OR REPLACE VIEW qa_snapshot AS
SELECT 'giftcard_balance' AS item, giftcard_number AS target_id, value AS current_value FROM ospos_giftcards
UNION ALL SELECT 'customer_points', person_id, points      FROM ospos_customers
UNION ALL SELECT 'item_stock',      item_id,   quantity    FROM ospos_item_quantities
UNION ALL SELECT 'sale_status',     sale_id,   sale_status FROM ospos_sales
UNION ALL SELECT 'points_earned',   sale_id,   earned      FROM ospos_sales_reward_points;

-- 2. 매 단계 확인 (결제 전 / 결제 후 / 취소 후)
SELECT * FROM qa_snapshot;

-- sale_status: 0 완료, 1 보류, 2 취소

-- 3. 비교 실험 준비
-- 고객 B를 고객 A와 같은 패키지로 맞추고, 포인트 초기값만 0으로 다르게 한다.
UPDATE ospos_customers SET package_id = 2, points = 0 WHERE person_id = 3;
