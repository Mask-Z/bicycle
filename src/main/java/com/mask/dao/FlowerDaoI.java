package com.mask.dao;

import com.mask.bean.Flower;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Mr丶周 on 2016/12/8.
 */
@Repository
public interface FlowerDaoI extends JpaRepository<Flower,Integer> {
	//根据花名查询ID
	@Query("select f.id from Flower f where f.name=:qname")
	public int  findIdByName(@Param("qname") String name);

	//根据花名查询ID
	@Query("select f from Flower f where f.name=:qname")
	public Flower  findFlowerByName(@Param("qname") String name);


	@Modifying      // 说明该方法是修改操作
	@Transactional  // 说明该方法是事务性操作
	@Query("update Flower us set us.name=:qname, us.price =:qprice, us.foregift=:qforegift, us.amount=:qamount where us.id=:qId")
	public void updateFlower(@Param("qname") String name, @Param("qprice") Double price, @Param("qforegift") Double foregift,
						   @Param("qamount") Integer amount, @Param("qId") Integer id);
}
