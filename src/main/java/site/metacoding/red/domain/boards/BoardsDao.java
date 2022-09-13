package site.metacoding.red.domain.boards;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BoardsDao {
	public void insert(Boards boards);
	public List<Boards> findAll();
	public List<MainDto> findAll(int startNum, String keyword);
	public Boards findById(Integer id);
	public void update(Boards boards);
	public void deleteById(Integer id);
	public void updateByUsersId(Integer usersId);
	public PagingDto paging(@Param("page") Integer page, @Param("keyword") String keyword);
}
