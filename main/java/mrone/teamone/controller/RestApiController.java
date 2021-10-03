package mrone.teamone.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import mrone.client.service.ClientServiceEntrance;
import mrone.mro.service.MroServiceEntrance;
import mrone.supply.service.SupplyServiceEntrance;
import mrone.teamone.beans.CGBean;
import mrone.teamone.beans.ClientInfoBean;
import mrone.teamone.beans.ClientOrderBean;
import mrone.teamone.beans.ClientOrderDecide;
import mrone.teamone.beans.DeliveryBean;
import mrone.teamone.beans.DriverLocationBean;
import mrone.teamone.beans.MroOrderBean;
import mrone.teamone.beans.MroOrderDetailBean;
import mrone.teamone.beans.ProductBean;
import mrone.teamone.beans.RequestOrderBean;
import mrone.teamone.beans.RequestOrderDetailBean;
import mrone.teamone.beans.SupplyInfoBean;
import mrone.teamone.beans.SupplySearchBean;
import mrone.teamone.beans.TaxBean;
import mrone.teamone.utill.ProjectUtils;

@RestController
@RequestMapping("/vue")
public class RestApiController {
	@Autowired
	private SupplyServiceEntrance sse;
	@Autowired
	private ClientServiceEntrance cse;
	@Autowired
	private MroServiceEntrance mse;
	@Autowired
	private ProjectUtils pu;
	
	/* test */
	@PostMapping("/DeliveryTest")
    public List<DeliveryBean> deliveryTest(){
       return sse.deliveryTest();
    }
    @PostMapping("/Insertsdcode")
    public void insertsdcode(@RequestBody DeliveryBean db){
       sse.insertsdcode(db);
    }
    
    @CrossOrigin
    @PostMapping("/clientOrderDecide")
    public String updOrderDecide(@RequestBody ClientOrderDecide cd) {
    	return cse.updOrderDecide(cd);
    } 
	
	   //해당 회사 상품 PC 가져오기
    @PostMapping("/SupplyAllProductList")
    public List<ProductBean> supplyAllProductList(){
       return sse.supplyAllProductList();
    }
	
	
	//신청한요청들 취소하기
	@PostMapping("/SupplyRequestCancel")
	public String supplyRequestCancel(@RequestBody ProductBean pb){
		return sse.supplyRequestCancel(pb);
	}
	
	
	//해당 회사 상품 PR AF 가져오기
	@PostMapping("/SupplyPRAFProductList")
	public List<ProductBean> supplyPRAFProductList(){
		return sse.supplyPRAFProductList();
	}
	
	//해당 회사 상품 MR DR DA 가져오기
	@PostMapping("/SupplyMRDRDAProductList")
	public List<ProductBean> supplyMRDRDAProductList(){
		return sse.supplyMRDRDAProductList();
	}
	
	@PostMapping("/supplyResponseOrder")
	public String supplyResponseOrder(@RequestBody RequestOrderBean ro) {
		return sse.supplyResponseOrder(ro);
	}
	
	
	@GetMapping("/supplyReceiveWaitOrderListForm")
	public ModelAndView supplyReceiveWaitOrderListForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("supplyhomeNSB");
		return mav;

	}
	
	@GetMapping("/issueTaxBillForm")
	public ModelAndView issueTaxBillForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("issueTaxBillForm");
		return mav;

	}
	
	 @PostMapping("/getSupplyReceiveWaitOrderList")
	   public List<RequestOrderBean> supplyReceiveWaitOrderList() {
	      return sse.RequestWaitOrderListCtl();
	   }

	   @PostMapping("/getSupplyReceiveClearOrderList")
	   public List<RequestOrderBean> supplyReceiveClearOrderList() {
	      return sse.RequestClearOrderListCtl();
	   }

	   @PostMapping("/getSupplyReceiveWaitOrderListD")
	   public List<RequestOrderDetailBean> supplyReceiveWaitOrderListD(@RequestBody String recode) {
	      return sse.RequestWaitOrderListCtlD(recode);

	   }

	   @PostMapping("/getSupplyReceiveClearOrderListD")
	   public List<RequestOrderDetailBean> supplyReceiveClearOrderListD(@RequestBody String recode) {
	      return sse.RequestClearOrderListCtlD(recode);

	   }

	   // 수정1
	   @PostMapping("/getSupplyRefuseOrderList")
	   public List<RequestOrderBean> getSupplyRefuseOrderList() {
	      return sse.getSupplyRefuseOrderList();

	   }

	   // 수정1
	   @PostMapping("/getSupplyRefuseOrderD")
	   public List<RequestOrderDetailBean> getSupplyRefuseOrderD(@RequestBody String recode) {
	      return sse.getSupplyRefuseOrderListDetail(recode);

	   }

	   // 수정1
	   @PostMapping("/supplyGoDelivery") // 배송출고시작 => 출고버튼(배송준비중->배송중으로 upd)
	   public String supplyGoDelivery(@RequestBody String recode) {
	      return sse.supplyGoDelivery(recode);

	   }

	   // 수정1
	   @PostMapping("/getTrackDeliveryList") // 배송 상태 확인 (배송중인 주문코드들 확인)
	   public List<DeliveryBean> getTrackDeliveryList() {
	      //System.out.println(sse.getTrackDeliveryList());
	      return sse.getTrackDeliveryList();

	   }
	
	@PostMapping("/getDLlist")
	public List<DeliveryBean> getDLList() {
		return sse.getDLlist();	
	}
	
	@PostMapping("/choiceDV")
	public String updateDL(@RequestBody List<DeliveryBean> list ) {
		return sse.updateDL(list.get(0));
		
	}
	//수정1
	@PostMapping("/getTaxCL")
	public List<ClientInfoBean> getTaxCL() {
		return sse.getTaxCL();			
	}
	
	//세금계산서 고객사 정보기입 수정
	@PostMapping("/getchoiceCLInfo")
	public ClientInfoBean getchoiceCLInfo(@RequestBody String cl_code) {
		return sse.choiceCLInfoCtl(cl_code);	
	}
	
	//세금계산서 세션으로 공급사 정보 자동기입
	@PostMapping("/getChoiceSPInfo")
	public SupplyInfoBean getchoiceSPInfo() {	
		return sse.choiceSPInfoCtl();	
	}
	
	//세금계산서 거래목록
	@PostMapping("/getTaxDeal")
	public List<RequestOrderBean> getTaxdeal() {
		return  sse.getTaxdeal();			
	}
	
	@PostMapping("/getchoiceDillInfo")
	public List<RequestOrderDetailBean> getchoiceDillInfo(@RequestBody List<RequestOrderDetailBean> list ) {
		return sse.choiceDillInfoCtl(list.get(0));	
	}
	
	
	//공급사 반품리스트 뽑아오는 메서드
	@PostMapping("/supplyReceiveRefundListForm")
	public List<RequestOrderBean> supplyReceiveRefundListForm() {
		return sse.supplyReceiveRefundListForm();
	}
	
	//공급사 교환리스트 뽑아오는 메서드
	@PostMapping("/supplyReceiveExchangeListForm")
	
	public List<RequestOrderBean> supplyReceiveExchangeListForm() {
		return sse.supplyReceiveExchangeListForm();
	}
	
	//supply 반품디테일
	@PostMapping("/supplyReceiveAsDetailR")
	public List<RequestOrderDetailBean> supplyReceiveAsDetailR(@ModelAttribute("re_code") String re_code){//re_code=""형태로 프론트에서전달
		return sse.supplyReceiveAsDetailRR(re_code);
	}
	//교환 디테일
	@PostMapping("/supplyReceiveAsDetailE")
	public List<RequestOrderDetailBean> supplyReceiveAsDetailE(@ModelAttribute("re_code") String re_code){//re_code=""형태로 프론트에서전달
		return sse.supplyReceiveAsDetailER(re_code);
	}
	
	//supply 반품 응답
	@PostMapping("/supplyResponseRefund")
	public String supplyResponseRefund(@RequestBody RequestOrderBean ro){
		return sse.supplyResponseRefund(ro);
	}
	
	//supply 검색결과
	@PostMapping("/supplySearchAs")
	
	public List<RequestOrderBean> supplySearchAs(@RequestBody RequestOrderBean re){	
		return sse.supplySearchAs(re);
	}
	
	
	//supply 카테고리를 불러옴
	@PostMapping("/supplyGetCategory")
	public List<ProductBean> supplyGetCategory(){
		return sse.supplyGetCategory();
	}
	
	@PostMapping("/supplyGetBK")
	public List<ProductBean> supplyGetBK(){
		return sse.supplyGetBK();
	}
	
	//supply 카테고리 물품 받아옴
	@PostMapping("/supplyProductList")
	
	public List<ProductBean> supplyProductList(@RequestBody ProductBean pd){
		return sse.supplyProductList(pd);
	}
	
	//supply 검색어로 물품가져옴
	@PostMapping("/supplySearchProduct")
	public List<ProductBean> supplySearchProduct(@RequestBody ProductBean pd){
		return sse.supplySearchProduct(pd);
	}
	
	@PostMapping("/mroSupplyListForm")
	public List<SupplyInfoBean> mroSupplyListForm() {
		return mse.SupplyListCtl();
	}
	
	@PostMapping("/mroClientListForm")
	public List<ClientInfoBean> morClientListForm() {

		return mse.ClientListCtl();
	}
	
	@CrossOrigin
	@PostMapping("/clientOrder")
	public List<String> clientOrderApi(@RequestBody ClientOrderBean co){
		return cse.clientRequestOrder(co);
	}
	
	@CrossOrigin
	@PostMapping("/clientRefund")
	public List<String> clientRefundApi(@RequestBody ClientOrderBean co){	
		return cse.clientRequestRefund(co);
	}
	
	@CrossOrigin
	@PostMapping("/clientExchange")
	public List<String> clientExchangeApi(@RequestBody ClientOrderBean co){
		return cse.clientRequestExchange(co);
	}
	
	@CrossOrigin
	@PostMapping("/clientGetTaxbill")
	public List<TaxBean> clientGetTaxbillApi(@ModelAttribute ClientInfoBean ci) throws Exception {
		return cse.clientGetTaxbill(ci);
	}
	
	@CrossOrigin
	@PostMapping("/clientGetTaxbillDetail")
	public TaxBean clientGetTaxbillDetailApi(@ModelAttribute ClientInfoBean ci) throws Exception {
		return cse.clientGetTaxbillDetail(ci);
	}
	
	@PostMapping("/getSupplyCateProductList")
	public List<ProductBean> getSupplyCateProductList(@RequestBody ProductBean pr){
		return sse.getSupplyCateProductList(pr);
	}
	//--
	
	//주문대기 리스트 받아오기
	@PostMapping("/mroOrderListForm")
	public List<MroOrderBean> mroOrderListForm(){
		return mse.getWaitOrderListCtl();	
	}
	
	@PostMapping("/mroOrderCompleteForm")
	public List<MroOrderBean> mroOrderCompleteForm(){
		return mse.getComplteOrderListCtl();	
	}
		
		//주문대기 상세보기
		@PostMapping("/mroGetOrderDetail")
		public List<MroOrderDetailBean> mroGetOrderDetail(@RequestBody String osCode){
			return mse.getOrderDetail(osCode);
		}
		
		//반품요청 리스트 받아오기
		@PostMapping("/mroRefundListForm")
		public List<MroOrderBean> mroRefundListForm(){
			return mse.getRefundListCtl();
		}
		
		//반품요청 상세보기
		@PostMapping("/mroGetRefundDetail")
		public List<MroOrderDetailBean> mroGetRefundDetail(@RequestBody String osCode){
			return mse.getOrderDetail(osCode);
		}
		
		
		//교환요청 리스트 받아오기
		@PostMapping("/mroExchangeListForm")
		public List<MroOrderBean> mroExchangeListForm(){
			return mse.getExchangeListCtl();
		}
		
		//교환 요청 상세보기
		@PostMapping("/mroGetExchangeDetail")
		public List<MroOrderDetailBean> mroGetExchangeDetail(@RequestBody String osCode){
			return mse.getOrderDetail(osCode);		
		}
	//--
		
		//새 상품 등록 요청리스트 가져오기
		@PostMapping("/GetRequestRegisterNewProductList")
		public List<ProductBean> getRequestRegisterNewProductList(){
			return mse.getRequestRegisterNewProductList();
		}
		
		
		// 새 물건 등록상품 디테일 가져오기
		@PostMapping("/MroGetNewProductDetail")
		public ProductBean mroGetNewProductDetail(@RequestBody ProductBean pb){
			return mse.mroGetNewProductDetail(pb);
		}
		
		//상품등록 수락 거절 응답 업데이트
		@PostMapping("/MroResponseNewProduct")
		public String mroResponseNewProduct(@RequestBody ProductBean pb){
			return mse.mroResponseNewProduct(pb);
		}
		
		//수정요청 리스트 불러오기
		@PostMapping("/CallModifyRequestList")
		public List<ProductBean> callModifyRequestList(){
			return mse.callModifyRequestList();
		}
		
		//해당 수정요청 디테일 가져오기
		@PostMapping("/MroGetModifyProductDetail")
		public ProductBean mroGetModifyProductDetail(@RequestBody ProductBean pb){
			return mse.mroGetModifyProductDetail(pb);
		}
		
		
		// 상품수정 수락 거절 응답 업데이트
		@PostMapping("/MroResponseModifyProduct")
		public String mroResponseModifyProduct(@RequestBody ProductBean pb){
			return mse.mroResponseModifyProduct(pb);
		}

		
		// 서플라이 
		
		//물건 디테일 가져오기
		@PostMapping("/SupplyGetProductDetail")
		public ProductBean supplyGetProductDetail(@RequestBody ProductBean pb){
			return sse.supplyGetProductDetail(pb);
		}
		
		//수정할 물품 입력정보 요청넣기
		@PostMapping("/SupplyRequestModify")
		public String supplyRequestModify(@RequestBody ProductBean pb){
			return sse.supplyRequestModify(pb);
		}
		
		//수량 업데이트
		@PostMapping("/SupplyModifyStock")
		public String supplyModifyStock(@RequestBody ProductBean pb){
			return sse.supplyModifyStock(pb);
		}
		
		//상품 삭제요청
		@PostMapping("/SupplyRequestDelete")
		public String supplyRequestDelete(@RequestBody ProductBean pb){
			return sse.supplyRequestDelete(pb);
		}
		
		//추가할 상품정보 정보 보내기
		@PostMapping("/SupplyRequestNewProduct")
		public String supplyRequestNewProduct(@ModelAttribute ProductBean pb,HttpServletRequest req){
			return sse.supplyRequestNewProduct(pb,req);
		}
	
		
		@GetMapping(
				  value = {"/getImage/{imgName}.{extension}","/getImage/{imgName}"},
				  produces = {MediaType.IMAGE_JPEG_VALUE,MediaType.IMAGE_PNG_VALUE,MediaType.IMAGE_GIF_VALUE}
				)
		public @ResponseBody byte[] getImageWithMediaType(HttpServletRequest req,
				@PathVariable(name = "imgName" , required = false) String imgName,
				@PathVariable(name = "extension" , required = false) String extension)throws IOException {
			String lc = req.getSession().getServletContext().getRealPath("/")+
					".."+File.separator+".."+File.separator+".."+File.separator+"img"+File.separator;
			InputStream ist;
			try {
				ist = new FileInputStream(lc+imgName+"."+extension);
			}catch(Exception e) {
				ist = new FileInputStream(lc+"none.gif");
			}
			byte[] img = IOUtils.toByteArray(ist);
			ist.close();
			return img;
		}
		

		// new
		@PostMapping("/searchSupply")
		public List<SupplyInfoBean> mroSearchSupplyList(@RequestBody String word) {
			return mse.mroSearchSupplyList(word);
		}

		// new
		@PostMapping("/searchClient")
		public List<ClientInfoBean> mroSearchClientList(@RequestBody String word) {
			return mse.mroSearchClientList(word);
		}

		// new
		@PostMapping("/delClient")
		public String mroDelClient(@RequestBody String code) {
			return mse.mroDelClient(code);
		}

		// new
		@PostMapping("/delSupply")
		public String mroDelSupply(@RequestBody String code) {
			return mse.mroDelSupply(code);
		}


		//거래내역가져오기
		@PostMapping("/getSupplyDealList")
		public List<RequestOrderBean> getSupplyDealList() {
			return sse.getSupplyDealList();			
		}

		//거래내역디테일
		@PostMapping("/getSupplyDealDetail")
		public List<RequestOrderDetailBean> getSupplyDealDetail(@RequestBody String re_code) {
			return sse.getSupplyDealDetail(re_code);			
		}
		
		//검색 수정
		@PostMapping("/getSearchSupplyDeal")
			public List<SupplySearchBean> getSearchSupplyDeal(@RequestBody String word) {
				return sse.getSearchSupplyDeal(word);			
			}
		
		//세금계산서인서트
		@PostMapping("/issueTax")
		public String issueTax(@RequestBody TaxBean tb) {
			
			return sse.issueTax(tb);			
		}
		
		//발행된 세금계산서 가져오기
		@PostMapping("/getIssuedTax")
		public List<TaxBean> getIssuedTax() {
			
			return sse.getIssuedTax();			
		}
		
		//세금계산서 디테일
		@PostMapping("/getIssuedTaxDetail")
		public TaxBean getIssuedTaxDetail(@RequestBody String tbcode) {		
			return sse.getIssuedTaxDetail(tbcode);			
		}
		
		@PostMapping("/getChart")
		public List<RequestOrderDetailBean> getChart() {
			return sse.getChart();
		}

		
		@PostMapping("/InsertGPS")
		public String insertGPS(@RequestBody DriverLocationBean dlb) {
			return sse.insertGPS(dlb);
		}
		
		//판매하는 카테고리 가져오기
		@PostMapping("/SupplyGetSellProductCate")
		public List<CGBean> supplyGetSellProductCate() {
					
		return sse.supplyGetSellProductCate();			
		}

}
