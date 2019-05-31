package guestbook;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class GuestBookTest {

	public static void main(String[] args) {
		GuestBookDAO dao = new GuestBookDAO();
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		//passwdCheck(dao);

	}

	private static void passwdCheck(GuestBookDAO dao) {
		Map map = new HashMap();
		map.put("no", 1);
		map.put("passwd", "12345");
		
		if(dao.passwdCheck(map)) {
			p("올바른 패스워드 입니다.");
		}else {
			p("잘못된 패스워드 입니다.");
		}
	}
	
	private static void p(String string) {
		System.out.println(string);
	}

	private static void p(GuestBookDTO dto) {
		p("번호: " + dto.getNo());
		p("이름: " + dto.getName());
		p("성별: " + dto.getGender());
		p("제목: " + dto.getTitle());
		p("내용: " + dto.getContent());
		p("날짜: " + dto.getRegdate());
		p("구분: " + dto.getPartstr());
	}



	private static void create(GuestBookDAO dao) {
		GuestBookDTO dto = new GuestBookDTO();
		dto.setName("김길동");
		dto.setGender("남자");
		dto.setTitle("123");
		dto.setContent("123");
		//dto.setRegdate("1 ");
		dto.setRegdate("1992-02-08");
		dto.setPartstr("제3자");
		dto.setPasswd("12345");

		if (dao.create(dto)) {
			p("생성 성공");
		} else {
			p("생성 실패");
		}

	}
	
	private static void read(GuestBookDAO dao) {
		GuestBookDTO dto = dao.read(1);
		p(dto);
	}
	
	private static void update(GuestBookDAO dao) {
		GuestBookDTO dto = dao.read(1);
		dto.setName("황길동");
		dto.setTitle("제목변경 안녕");
		dto.setContent("내용변경 안녕");
		dto.setPartstr("고등학교 동창");
		
		if(dao.update(dto)) {
			p("변경 성공");
		}else {
			p("변경 실패");
		}
		
	}

	private static void delete(GuestBookDAO dao) {
		if(dao.delete(1)) {
			p("삭제 성공");
		}else {
			p("삭제 실패");
		}
	}
	
//	private static void list(GuestBookDAO dao) {
//		List<GuestBookDTO>list = dao.list();
//		Iterator<GuestBookDTO>iter = list.iterator();
//		while(iter.hasNext()) {
//			GuestBookDTO dto = iter.next();
//			p(dto);
//			p("--------");
//		}
//	}
}
