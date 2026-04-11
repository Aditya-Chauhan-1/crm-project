package in.sp.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.sp.main.entity.CustEnquiry;

@Repository
public interface CustEnquiryRepository extends JpaRepository<CustEnquiry, Integer> {

	boolean existsByPhoneno(String phoneno);
	
	List<CustEnquiry> findAllByPhoneno(String phoneno);
}
