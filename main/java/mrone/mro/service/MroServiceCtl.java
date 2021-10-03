package mrone.mro.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;

import mrone.teamone.beans.ClientInfoBean;
import mrone.teamone.beans.MroOrderBean;
import mrone.teamone.beans.MroOrderDetailBean;
import mrone.teamone.beans.OrderDetailBean;
import mrone.teamone.beans.ProductBean;
import mrone.teamone.beans.RequestOrderBean;
import mrone.teamone.beans.SupplyInfoBean;
import mrone.teamone.utill.ProjectUtils;

@Service
class MroServiceCtl {
	@Autowired
	MroDao dao;
	@Autowired
	ProjectUtils pu;
	
	boolean mroRequestCtl(RequestOrderBean ro, String type) {
		ro.setRe_state(type);
		return this.mroRequestProcess(ro);
	}

	boolean mroRequestProcess(RequestOrderBean ro) {
		boolean tran = false;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar cal = Calendar.getInstance();
		ro.setRe_date(sdf.format(cal.getTime()));
		if(ro.getRe_origin()==null)ro.setRe_origin("");
		if (dao.insMroRequestOrder(ro)) {
			int tranCount = 0;
			for (int i = 0; i < ro.getRd().size(); i++) {
				ro.getRd().get(i).setRd_recode(dao.getRequestOrderData(ro));
				if (!dao.insMroRequestOrderDetail(ro.getRd().get(i))) {
					break;
				}
				tranCount++;
			}
			System.out.println("msc_mroRequestProcess"+tranCount + ":" + ro.getRd().size());
			if (tranCount == ro.getRd().size()) {
				tran = true;
				 // dao.getOrderData(co);
			}

		}
		return tran;
	}

	List<ProductBean> getRequestRegisterNewProductList() {
		return dao.getRequestRegisterNewProductList();
	}

	ProductBean mroGetNewProductDetail(ProductBean pb) {
		return dao.mroGetNewProductDetail(pb);
	}

	String mroResponseNewProduct(ProductBean pb) {
		String message = null;
		if (dao.mroResponseNewProduct(pb)) {
			message = "success!";
		} else {
			message = "fail!";
		}
		return message;
	}

	List<ProductBean> callModifyRequestList() {
		return dao.callModifyRequestList();
	}

	ProductBean mroGetModifyProductDetail(ProductBean pb) {
		return dao.mroGetModifyProductDetail(pb);
	}

	String mroResponseModifyProduct(ProductBean pb) {
		String message = null;
		boolean tran = false;
		pu.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,
				TransactionDefinition.ISOLATION_READ_COMMITTED, false);

		if (pb.getPr_stcode().equals("PC")) {// 수정요청 수락
			if (dao.updatePCToPD(pb)) {// 해당 상품코드 AND PC인 애를 PD로
				if (dao.mroResponseModifyProduct(pb)) {// 해당상품코드 AND MR인 애를 PC로
					tran = true;
				}
			}
		} else if (pb.getPr_stcode().equals("RF")) { // 수정요청 거절
			if (dao.stcodeCheck(pb)) { // 해당 코드and stcode가 RF인 컬럼이 있는지 체크
				if (dao.deleteStcode(pb)) {// 해당코드의 stcode가 RF인 컬럼을 삭제
					if (dao.mroResponseModifyProduct(pb)) {// 해당 상품코드AND MR인 애를 RF로
						tran = true;
					}
				}
			} else {
				if (dao.mroResponseModifyProduct(pb)) {// 해당 상품코드AND MR인 애를 RF로
					tran = true;
				}
			}

		} else if (pb.getPr_stcode().equals("DA")) {// 삭제요청 수락
			if (dao.mroResponseDeleteProduct(pb)) {// 해당 삭제요청 상품코드 AND DR인 애를 DA로
				if (dao.updatePCToPD(pb)) { // 해당 삭제요청 상품코드 AND PC인 애를 PD로
					tran = true;
				}
			}
		} else {// 삭제요청 거절
			if (dao.stcodeCheck(pb)) {// 해당 코드and stcode가 DF인 컬럼이 있는지 체크
				if (dao.deleteStcode(pb)) {// 해당코드의 stcode가 DF인 컬럼을 삭제
					if (dao.mroResponseDeleteProduct(pb)) {// 해당 삭제요청 상품코드 AND DR인 애를 DF로
						tran = true;
					}
				}
			} else {
				dao.mroResponseDeleteProduct(pb);
				tran = true;
			}
		}

		pu.setTransactionResult(tran);

		message = tran ? "success!" : "fail!";

		return message;
	}

	List<SupplyInfoBean> SupplyList() {
		List<SupplyInfoBean> list;
		list = dao.getSupplyList();

		return list;
	}

	List<ClientInfoBean> ClientList() {
		List<ClientInfoBean> list;
		list = dao.getClientList();

		return list;
	}

	List<MroOrderBean> getWaitOrderList() {
		List<MroOrderBean> waitOrderList;
		waitOrderList = dao.getWaitOrderList();

		for (int i = 0; i < waitOrderList.size(); i++) {
			if (waitOrderList.get(i).getOs_state().equals("OR")) {
				waitOrderList.get(i).setOs_state("주문대기");
			}else if(waitOrderList.get(i).getOs_state().equals("OA")) {
				waitOrderList.get(i).setOs_state("주문수락");
			}
		}

		// System.out.println(waitOrderList);
		return waitOrderList;
	}
	

	List<MroOrderDetailBean> getOrderDetail(String osCode) {
		List<MroOrderDetailBean> od;
		od = dao.getOrderDetail(osCode);

		for (int i = 0; i < od.size(); i++) {
			if (od.get(i).getOd_stcode().equals("OC")) {
				od.get(i).setOd_stcode("구매확정");
			} else if (od.get(i).getOd_stcode().equals("RR")) {
				od.get(i).setOd_stcode("반품요청");
			} else if (od.get(i).getOd_stcode().equals("ER")) {
				od.get(i).setOd_stcode("교환요청");
			} else if (od.get(i).getOd_stcode().equals("OR")) {
				od.get(i).setOd_stcode("주문대기");
			}else if (od.get(i).getOd_stcode().equals("OA")) {
				od.get(i).setOd_stcode("주문수락");
			}else if (od.get(i).getOd_stcode().equals("RA")) {
				od.get(i).setOd_stcode("반품수락");
			}else if (od.get(i).getOd_stcode().equals("EA")) {
				od.get(i).setOd_stcode("교환수락");
			}else if (od.get(i).getOd_stcode().equals("OF")) {
				od.get(i).setOd_stcode("주문거절");
			}else if (od.get(i).getOd_stcode().equals("RF")) {
				od.get(i).setOd_stcode("반품거절");
			}else if (od.get(i).getOd_stcode().equals("EF")) {
				od.get(i).setOd_stcode("교환거절");
			}else if (od.get(i).getOd_stcode().equals("RC")) {
				od.get(i).setOd_stcode("반품처리");
			}else if (od.get(i).getOd_stcode().equals("EC")) {
				od.get(i).setOd_stcode("교환처리");
			}
		}

		return od;
	}
	
	//완료리스트
	List<MroOrderBean> getCompleteOrderList(){
		List<MroOrderBean> cList = dao.getCompleteOrderList();
		
		for (int i = 0; i < cList.size(); i++) {
			if (cList.get(i).getOs_state().equals("OF")) {
				cList.get(i).setOs_state("주문거절");
			}else if(cList.get(i).getOs_state().equals("OC")) {
				cList.get(i).setOs_state("구매확정");
			}
		}
		
		return cList;
	}


	List<MroOrderBean> getRefundList() {
		List<MroOrderBean> list = dao.getRefundList();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getOs_state().equals("RR")) {
				list.get(i).setOs_state("반품요청");
			}else if(list.get(i).getOs_state().equals("RA")) {
				list.get(i).setOs_state("반품수락");
			}
		}
		return list;
	}
	
	List<MroOrderBean> getCompleteRefundList() {
		List<MroOrderBean> list = dao.getCompleteRefundList();
		
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getOs_state().equals("RC")) {
				list.get(i).setOs_state("반품처리");
			}else if(list.get(i).getOs_state().equals("FF")) {
				list.get(i).setOs_state("반품거절");
			}
		}
		return list;
	}

	
	List<MroOrderBean> getExchangeList() {
		List<MroOrderBean> list = dao.getExchangeList();
		
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getOs_state().equals("ER")) {
				list.get(i).setOs_state("교환요청");
			}else if(list.get(i).getOs_state().equals("EA")) {
				list.get(i).setOs_state("교환수락");
			}
		}
		return list;
	}
	
	List<MroOrderBean> getCompleteExchangeList() {
		List<MroOrderBean> list = dao.getCompleteExchangeList();
		
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getOs_state().equals("EC")) {
				list.get(i).setOs_state("교환처리");
			}else if(list.get(i).getOs_state().equals("EF")) {
				list.get(i).setOs_state("교환거절");
			}
		}
		return list;
	}
	
	//new
	 List<SupplyInfoBean> mroSearchSupplyList(String word) {
		
		return dao.mroSearchSupplyList(word);
	}
	 
	 //new
	 List<ClientInfoBean> mroSearchClientList(String word) {
		
		return dao.mroSearchClientList(word);
	}

	 //new
	 String mroDelClient(String code) {
		 String message=null;
		
		 if(dao.mroDelClient(code)) {//delet가 true
			 message ="회원이 정상적으로 삭제 되었습니다.";
		 }else {
			 message="회원 삭제에 실패했습니다. 잠시후 다시 시도해주세요.";
		 }
		 
		return message;
	}
	 //new
	 String mroDelSupply(String code) {
		String message=null;
			
		if(dao.mroDelSupply(code)) {
			 message ="회원이 정상적으로 삭제 되었습니다.";
		}else {
			message="회원 삭제에 실패했습니다. 잠시후 다시 시도해주세요.";
		}
		return message;
	}
	 
		List<OrderDetailBean> getRanking() {
			List<OrderDetailBean> list = dao.getRanking();
			int lcount = list.size();
			if(lcount < 5) {
				for(int i=0 ; i < 5-lcount ; i++) {
					OrderDetailBean ob = new OrderDetailBean();
					ob.setPr_name("구매내역없음");
					ob.setOd_quantity(0);
					list.add(ob);
				}
			}

			return list;
		}

}
