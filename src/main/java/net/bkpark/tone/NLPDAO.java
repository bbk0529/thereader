package net.bkpark.tone;

import java.util.Date;
import java.util.List;

public interface NLPDAO {
	void insertEmail(EmailVO vo);
	List<EmailVO> searchData(String keyword);

	String[] getSender();
	String[] getSenderW();
	
	Date[] getEmailDate();
	
	EmailVO getDetail(int no);
	
	void insertPI(PIVO vo);
	PIVO readPI(String sender);
	
}
