USE digital_jsp;

DELIMITER ;

CALL loginCheck('id001', 'pw001');

DELIMITER //
	CREATE TRIGGER after_delete_member
    AFTER DELETE ON mvc_member
    FOR EACH ROW
    BEGIN
    -- NEW 새로 작성된 행정보
    -- OLD 기존 행정보
		INSERT INTO mvc_member_backup
        VALUES(OLD.num, OLD.id, OLD.pass, OLD.name, OLD.age, OLD.gender, OLD.regdate, now());
	END //
 DELIMITER ;
 
-- AFTER UPDATE ON mvc_member
UPDATE mvc_member SET pass = '12345' WHERE id = 'id001';
-- BEGIN
	 NEW.pass == '12345'
     OLD.PASS == 변경되기 전 행에 존재하는 비밀번호
-- END //
