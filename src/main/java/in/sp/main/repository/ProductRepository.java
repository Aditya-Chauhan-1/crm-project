package in.sp.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import in.sp.main.entity.Product;
import jakarta.transaction.Transactional;
import java.util.List;


@Repository
@Transactional
public interface ProductRepository extends JpaRepository<Product, Integer>{
	Product findByCoursename(String coursename);
	
	@Query("select coursename from Product")
	List<String> findCourseName();
	
}