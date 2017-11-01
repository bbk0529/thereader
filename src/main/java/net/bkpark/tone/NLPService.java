package net.bkpark.tone;

import java.util.Date;
import java.util.List;

public interface NLPService {
	void insertEmail(EmailVO vo);
	EmailVO detail(int no);
	int wordCount(String text);
	String[] getSender();
	Date[] getemaildate();
	
	List<EmailVO> searchData(String keyword);
	
	void insertPI(PIVO vo);
	
	PIVO readPI(String sender);
	String[] getSenderW();
}
