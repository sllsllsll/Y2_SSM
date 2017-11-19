package cn.smbms.service;

import cn.smbms.entity.Bill;
import cn.smbms.util.page;
import org.apache.ibatis.annotations.Param;

import java.io.IOException;
import java.util.List;

/**
 * Created by linlin on 2017/8/22.
 */
public interface IBillService {
  /*  //分页的查询用户管理
    public int count() throws IOException;//总记录数
    //简单分页用户管理
    public page BillLimit(int pageIndex, int pageSize) throws IOException;

    public page BillLimit(int pageIndex, int pageSizem,Bill b) throws IOException;
    //查询所有的供应商
    public List<Bill> billselectlist();


    public page BillBillSelect(String productName,String productUnit,int isPayment,int pageIndex, int pageSize) throws IOException;

    //4.获取带条件的总记录数
    public int getTotalCountByUserName(String productName,String productUnit,int isPayment);*/

    //分页的查询用户管理
    public int count() throws IOException;//总记录数
    //简单分页用户管理
    public List<Bill> BillLimit(@Param("from")Integer from,
                                @Param("pagesize")Integer pagesize) throws IOException;
    public int Billdel(int id);

    public int addBill(Bill bill) throws IOException;
    public Bill selectBillByid(int id) throws IOException;
    //查询所有的供应商
    public List<Bill> billselectlist();
    public List<Bill> Billselect(@Param("productName")String productName,@Param("productUnit")String productUnit,
                                 @Param("isPayment")Integer isPayment,@Param("from")Integer from,
                                 @Param("pagesize")Integer pagesize);
}
