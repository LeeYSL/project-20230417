package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Cart;
import model.CartMybatisDao;
import model.Goods;
import model.GoodsMybatisDao;
import model.Member;
import model.MemberMybatisDao;
import model.OrderInfoMybatisDao;
import model.OrderItem;
import model.OrderItemMybatisDao;
import model.Orderinfo;

@WebServlet(urlPatterns = { "/market/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class MarketController extends MskimRequestMapping {
	private GoodsMybatisDao dao = new GoodsMybatisDao();
	private CartMybatisDao cartdao = new CartMybatisDao();
	private MemberMybatisDao mdao = new MemberMybatisDao();
	private OrderItemMybatisDao itemdao = new OrderItemMybatisDao();
	private OrderInfoMybatisDao infodao = new OrderInfoMybatisDao();
	/*
	 * @RequestMapping("buyForm") public String buyForm(HttpServletRequest request,
	 * HttpServletResponse response) { String id = (String)
	 * request.getSession().getAttribute("login"); Member mem = dao.selectOne(id);
	 * request.setAttribute("mem", mem); return "market/buyForm"; }
	 */

	@RequestMapping("marketList")
	public String marketList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Goods> list = dao.list(); // 굿즈 상품들 보임
		request.setAttribute("list", list);
		return "market/marketList";
	}

	@RequestMapping("marketForm")
	public String marketForm(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login"); // session의 login값 가져온다.

		if (login == null || !login.equals("admin")) {// 로그인이 안돼있거나 관리자가 아니라면
			request.setAttribute("msg", "관리자만 글쓰기가 가능합니다.");
			request.setAttribute("url", request.getContextPath() + "/market/marketList");
			return "alert/alert";
		}
		return "market/marketForm";
	}

	@RequestMapping("market")
	public String write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/") + "/upload/goods/";
		// getServletContext() : ServletContext 객체를 가져온다
		// getRealPath("/") : 지정한 path에 해당되는 실제 경로를 반환
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, size, "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		} // 파일업로드끝
			// 파라미터 Board 객체에 저장
		Goods goods = new Goods(); // db goods의 객체를 만든다?
		goods.setGoodsCode(Integer.parseInt(multi.getParameter("num")));
		goods.setGoodsPrice(Integer.parseInt(multi.getParameter("price")));
		goods.setGoodsName(multi.getParameter("name"));// name이 content인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		goods.setGoodsImg(multi.getFilesystemName("file"));// name이 file인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		String id = (String) request.getSession().getAttribute("login");
		request.getSession().setAttribute("goods", goods); // 세션저장

		if (goods.getGoodsImg() == null)
			goods.setGoodsImg(""); // 업로드 파일이 없는 경우 빈문자열
//		int num = dao.maxnum(); // 등록된 게시글의 최대 num 값
//		goods.setGoodsNum(++num); // 최대값 +1
		if (dao.insert(goods)) { // board 테이블에 게시물 등록했을경우
			return "redirect:marketList"; // 등록되면 list로 전달
		}
		// 게시물 등록 실패시 실행되는 부분
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", request.getContextPath() + "/market/marketForm");
		return "alert/alert";
	}

	@RequestMapping("cart") // 장바구니 추가 누르면 여기로 옴
	public String cart(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Cart cart = new Cart();
//		Goods goodsCode = (Goods) request.getSession().getAttribute("goods");
		String memId = (String) request.getSession().getAttribute("login");
		int code = Integer.parseInt(request.getParameter("code"));
		cart.setMemId(memId);
		cart.setGoodsCode(code);
		cart.setCartQuantity(1);
		System.out.println(cart);
		// request.getSession().setAttribute("cart1", cart);
		if (cartdao.insert(cart)) { // cart 테이블에 게시물 등록했을경우
			request.setAttribute("msg", "장바구니 추가 완료");
			request.setAttribute("url", request.getContextPath() + "/market/marketList");
			return "alert/alert";
			// return "redirect:marketList"; // 등록되면 list로 전달
		}
		request.setAttribute("msg", "장바구니에 있는 상품입니다.");
		request.setAttribute("url", request.getContextPath() + "/market/marketList");
		return "alert/alert";
	}

	@RequestMapping("cartForm")
	public String cartForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memId = (String) request.getSession().getAttribute("login"); // session의 login값 가져온다.

		if (memId == null) {// 로그인이 안돼있거나 관리자가 아니라면
			request.setAttribute("msg", "로그인 해야 합니다..");
			request.setAttribute("url", request.getContextPath() + "/market/marketList");
			return "alert/alert";
		}

		System.out.println("memId:" + memId);

		Cart cart = new Cart();
		System.out.println(cart);

		List<Cart> cartlist = cartdao.cartlist(memId);
		System.out.println("cartlist:" + cartlist);

		request.setAttribute("cartlist", cartlist);

		return "market/cartForm";
	}

	@RequestMapping("delete")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		Cart cart = new Cart();
		String id = (String) request.getSession().getAttribute("login");
		int code = Integer.parseInt(request.getParameter("code"));
		cart.setMemId(id);
		cart.setGoodsCode(code);

		if (cartdao.delete(cart)) {
			request.setAttribute("msg", "삭제 완료");
			request.setAttribute("url", request.getContextPath() + "/market/cartForm");
			return "alert/alert";
		}
		request.setAttribute("msg", "삭제 실패.");
		request.setAttribute("url", request.getContextPath() + "/market/cartForm");
		return "alert/alert";
	}

//	@RequestMapping("buy")
//	public String buy(HttpServletRequest request, HttpServletResponse response) {
//		OrderItem item = new OrderItem();
//		String id = (String) request.getSession().getAttribute("login");
//		int code = Integer.parseInt(request.getParameter("code"));
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
//		int num = Integer.parseInt(request.getParameter("num"));
//		
//		
//		int limit = 10;
//		int orderCount = item.orderCount(id);
//		
//		int maxpage = (int) ((double) orderCount / limit + 0.95);
//		int pageNum =1;
//		int ordercode= orderCount - (pageNum-1) * limit; 
//		item.setMemId(id);
//		item.setGoodsCode(code);
//		item.setCartQuantity(quantity);
//
//		if (itemdao.insert(item)) {
//			request.setAttribute("msg", "성공");
//			request.setAttribute("url", request.getContextPath() + "/market/buyForm");
//			return "alert/alert";
//		}
//		request.setAttribute("msg", "오류.");
//		request.setAttribute("url", request.getContextPath() + "/market/cartForm");
//		return "alert/alert";
//	}

	@RequestMapping("buy")
	public String buy(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("login");
		OrderItem item = new OrderItem();
//		Orderinfo info = new Orderinfo();
		int code = Integer.parseInt(request.getParameter("goodsname"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int num = itemdao.maxnum(); // 등록된 게시글의 최대 num값
		item.setOrderCode(++num);// 최대값+1
		item.setGoodsCode(code);
		item.setCartQuantity(quantity);
		item.setMemId(id);
		System.out.println("item" + item);
		
//		num = infodao.maxnum(); // 등록된 게시글의 최대 num값
//		info.setOrderCode(++num);// 최대값+1
//		info.setMemId(id);
		
		
		
		if (itemdao.insert(item)) {
			request.setAttribute("msg", "성공");
			request.setAttribute("url", request.getContextPath() + "/market/buyList");
			return "alert/alert";
		}
		request.setAttribute("msg", "오류.");
		request.setAttribute("url", request.getContextPath() + "/market/cartForm");
		return "alert/alert";
	}

	@RequestMapping("buyForm")
	public String buyForm(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("login");
		Member mem = mdao.selectOne(id);
		request.setAttribute("mem", mem);
		int code = Integer.parseInt(request.getParameter("code"));
		Goods goods = dao.selectOne(code);
		Cart cart = cartdao.selectOne(code, id);
		request.setAttribute("goods", goods);
		request.setAttribute("cart", cart);
		return "market/buyForm";
	}

	@RequestMapping("purchase")
	public String purchase(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		OrderItem item = new OrderItem();
//		String memId = (String) request.getSession().getAttribute("login");
//		System.out.println("memId="+memId);
//		item.setMemId(memId);
//		Goods goodsCode = (Goods) request.getSession().getAttribute("goods");
//		System.out.println("goodsCode="+goodsCode);
//		item.setGoodsCode(goodsCode);
//		
//		
//		
//		
//		if (cartdao.insert(item)) { // cart 테이블에 게시물 등록했을경우
//		request.setAttribute("msg", "주문 완료");
//		request.setAttribute("url", request.getContextPath() + "/market/buyList");
//		return "alert/alert";
//	}
//	request.setAttribute("msg", "주문 오류.");
//	request.setAttribute("url", request.getContextPath() + "/market/buyList");
		return "alert/alert";

	}

	@RequestMapping("buyList")
	public String buyList(HttpServletRequest request, HttpServletResponse response) {
	
		String id =(String)request.getSession().getAttribute("login");
		List<OrderItem> list = itemdao.list(id); // 굿즈 상품들 보임
		request.setAttribute("list", list);
		System.out.println("list:" + list);
		return "market/buyList";

	}

}
