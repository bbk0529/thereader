package net.bkpark.tone;

import java.util.Date;
import java.util.List;

public interface NLPDAO {
	void insertEmail(EmailVO vo);
	List<EmailVO> getList();
	EmailVO getDetail(int no);
	String[] getSender();
	Date[] getEmailDate();
	List<EmailVO> searchData(String keyword);
}
