package site.metacoding.red.web.dto.response.boards;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MainDto {
	private Integer id;
	private String title;
	private String username;

//	public String getUsername() {
//		return username == null ? "탈퇴한 회원입니다" : username;
//	}
}
