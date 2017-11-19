package cn.smbms.service.Impl;

import cn.smbms.dao.IBillDao;
import cn.smbms.entity.Bill;
import cn.smbms.service.IBillService;
import cn.smbms.util.page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by linlin on 2017/8/22.
 */
@Service("billService")
public class IBillServiceImpl implements IBillService{
    @Resource(name="IBillDao")
    IBillDao billdao;

    public int count() throws IOException {
        return billdao.count();
    }

    public List<Bill> BillLimit(@Param("from") Integer from, @Param("pagesize") Integer pagesize) throws IOException {
        return billdao.BillLimit(from,pagesize);
    }

    public int Billdel(int id) {
        return billdao.Billdel(id);
    }

    public int addBill(Bill bill) throws IOException {
        return billdao.addBill(bill);
    }

    public Bill selectBillByid(int id) throws IOException {
        return null;
    }

    public List<Bill> billselectlist() {
        return billdao.billselectlist();
    }

    public List<Bill> Billselect(@Param("productName") String productName, @Param("productUnit") String productUnit, @Param("isPayment") Integer isPayment, @Param("from") Integer from, @Param("pagesize") Integer pagesize) {
        return billdao.Billselect(productName,productUnit,isPayment,from,pagesize);
    }
   /* public int count() throws IOException {
        return billdao.count();
    }

    public page BillLimit(int pageIndex, int pageSize) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageIndex", pageIndex * pageSize);
        map.put("pageSize", pageSize);
        page p = new page();
        p.setPageindex(pageIndex);
        p.setPagesize(pageSize);
        int totalCount = billdao.count();
        p.setPagetotalpages(totalCount);
        int totalPages = p.getPagetotalpages() % p.getPagesize() == 0 ? p.getPagetotalpages() / p.getPagesize() : p.getPagetotalpages() / p.getPagesize() + 1;
        p.setTotalPages(totalPages);
        List<Bill> listbill = billdao.BillLimit(map);
        p.setListbill(listbill);
        return p;
    }

    public page BillLimit(int pageIndex, int pageSize, Bill b) throws IOException {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("pageIndex", pageIndex * pageSize);
        map.put("pageSize", pageSize);
        map.put("productName",b.getProductName());
        map.put("productUnit",b.getProductUnit());
        map.put("isPayment",b.getIsPayment());
        page p = new page();
        p.setPageindex(pageIndex);
        p.setPagesize(pageSize);
        if (b!=null){
           p.setPagetotalpages(billdao.getTotalCountByUserName(b.getProductName(),b.getProductUnit(),b.getIsPayment()));
        }else{
            p.setTotalPages(billdao.count());
        }
        int totalPages = p.getPagetotalpages() % p.getPagesize() == 0 ? p.getPagetotalpages() / p.getPagesize() : p.getPagetotalpages() / p.getPagesize() + 1;
        p.setTotalPages(totalPages);
        //为什么dao层方法的入参我写成map？？？
        List<Bill> list = billdao.BillLimit(map);
        p.setListbill(list);
        return p;
    }

    public List<Bill> billselectlist() {
        return billdao.billselectlist();
    }


    public page BillBillSelect(String productName, String productUnit, int isPayment, int pageIndex, int pageSize) throws IOException {

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageIndex", pageIndex * pageSize);
        map.put("pageSize", pageSize);
        map.put("productName",productName);
        map.put("productUnit",productUnit);
        map.put("isPayment",isPayment);
        page p = new page();
        p.setPageindex(pageIndex);
        p.setPagesize(pageSize);
        int totalCount = billdao.count();
        p.setPagetotalpages(totalCount);
        int totalPages = p.getPagetotalpages() % p.getPagesize() == 0 ? p.getPagetotalpages() / p.getPagesize() : p.getPagetotalpages() / p.getPagesize() + 1;
        p.setTotalPages(totalPages);
        List<Bill> list1 = billdao.likeBillName(map);
        p.setListbill(list1);
        return p;
    }

    public int getTotalCountByUserName(String productName, String productUnit, int isPayment) {
        return billdao.getTotalCountByUserName(productName,productUnit,isPayment);
    }
*/

}
