package in.sp.main.service;

import java.util.List;

import in.sp.main.entity.CustFollowUp;

public interface CustFollowupService {

	public boolean addCustFollowupDateService(CustFollowUp custFollowUp);
	
	public List<CustFollowUp> getCustFollowUpForProvidedDate(String date);
}
