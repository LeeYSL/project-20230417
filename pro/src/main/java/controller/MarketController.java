package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.AccountMybatisDao;
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
import model.PointMybatisDao;

@WebServlet(urlPatterns = { "/market/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class MarketController extends MskimRequestMapping {
	private GoodsMybatisDao dao = new GoodsMybatisDao();
	private CartMybatisDao cartdao = new CartMybatisDao();
	private MemberMybatisDao mdao = new MemberMybatisDao();
	private OrderItemMybatisDao itemdao = new OrderItemMybatisDao();
	private OrderInfoMybatisDao infodao = new OrderInfoMybatisDao();
	private AccountMybatisDao accountdao = new AccountMybatisDao();


	@RequestMapping("marketList")
	public String marketList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("pageNum", "1");
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		int limit = 10;

		int goodsCount = dao.goodsCount(); // 게시판 종류별 전체 게시물 수 리턴

		List<Goods> list = dao.list(pageNum, limit);// list를 만들건데 board 타입을 넣어서 만든다.

		int maxpage = (int) ((double) goodsCount / limit + 0.95);
		/*
		 * startpage : 화면에 출력될 시작 페이지 현재페이지 | 시작페이지 1 1 1/10.0 => 0.1 + 0.9 => (int)1.0
		 * -1 => 0 * 10 +1 => 1 10 1 11 11 505 501 int startpage= ((int)(pageNum/10.0 +
		 * 0.9) -1)*10 +1; //10.0 -> 한페이지에 10개 보여줌
		 */
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 +1 ;
		/*
		 * endpage : 화면에 출력할 마지막 페이지 번호. 한 화면에 10개의 페이지를 보여줌
		 */
		int endpage = startpage + 9;
		// endpage 는 maxpage를 넘어가면 안됨
		if (endpage > maxpage)
			endpage = maxpage;

		// 글 번호
		int boardnum = goodsCount - (pageNum - 1) * limit;

		request.setAttribute("list", list);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		

//		List<Goods> list = dao.list(); // 굿즈 상품들 보임
//		request.setAttribute("list", list);
		return "market/marketList";
	}

	@RequestMapping("marketForm")
	public String marketForm(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
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
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String path = request.getServletContext().getRealPath("/") + "goods/file/";
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
		goods.setGoodsNum(Integer.parseInt(multi.getParameter("num")));
		goods.setGoodsPrice(Integer.parseInt(multi.getParameter("price")));
		goods.setGoodsName(multi.getParameter("name"));// name이 content인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		goods.setGoodsImg(multi.getFilesystemName("file"));// name이 file인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		goods.setGoodsDescription(multi.getFilesystemName("description"));// name이 description인 파라미터 값을 보드객체의 BoardTitle에 저장한다.		
		String id = (String) request.getSession().getAttribute("login");
		request.getSession().setAttribute("goods", goods); // 세션저장

		if (goods.getGoodsImg() == null)
			goods.setGoodsImg(""); // 업로드 파일이 없는 경우 빈문자열
		int code = dao.maxcode(); // 등록된 게시글의 최대 num 값
		goods.setGoodsCode(++code); // 최대값 +1
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
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		Cart cart = new Cart();
		String memId = (String) request.getSession().getAttribute("login");
		int code = Integer.parseInt(request.getParameter("code"));
		cart.setMemId(memId);
		cart.setGoodsCode(code);
		cart.setCartQuantity(1);
		System.out.println(cart);

		if(memId == null) {
			request.setAttribute("msg", "로그인 해야 합니다.");
			request.setAttribute("url", request.getContextPath() + "/member/loginForm");
			return "alert/alert";			
		}		
		
		if (cartdao.insert(cart)) { // cart 테이블에 게시물 등록했을경우
			request.setAttribute("msg", "장바구니 추가 완료");
			request.setAttribute("url", request.getContextPath() + "/market/marketList");
			return "alert/alert";
		} else { 
			
		request.setAttribute("msg", "장바구니에 있는 상품입니다.");
		request.setAttribute("url", request.getContextPath() + "/market/marketList");
		return "alert/alert";
		}
	}
	@RequestMapping("cartAdd") // 장바구니 추가 누르면 여기로 옴
	public String cartAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		Cart cart = new Cart();
//		Goods goodsCode = (Goods) request.getSession().getAttribute("goods");
		String memId = (String) request.getSession().getAttribute("login");
		int code = Integer.parseInt(request.getParameter("code"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		cart.setMemId(memId);
		cart.setGoodsCode(code);
		cart.setCartQuantity(quantity);
		System.out.println(cart);
		// request.getSession().setAttribute("cart1", cart);
		if(memId == null) {
			request.setAttribute("msg", "로그인 해야 합니다.");
			request.setAttribute("url", request.getContextPath() + "/member/loginForm");
			return "alert/alert";			
		}
		if (cartdao.cartinsert(cart)) { // cart 테이블에 게시물 등록했을경우
			request.setAttribute("msg", "장바구니 추가 완료");
			request.setAttribute("url", request.getContextPath() + "/market/cartForm");
			return "alert/alert";
			// return "redirect:marketList"; // 등록되면 list로 전달
		} else { 
			
		request.setAttribute("msg", "장바구니에 있는 상품입니다.");
		request.setAttribute("url", request.getContextPath() + "/market/detail?code="+code);
		return "alert/alert";
		}
	}	
	
	@RequestMapping("detail") // 장바구니 추가 누르면 여기로 옴
	public String detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		int code = Integer.parseInt(request.getParameter("code"));
		Goods goods = dao.selectOne(code);
		request.setAttribute("goods", goods);

		return "market/detail";
	}	
	
	
	
	

	@RequestMapping("cartForm")
	public String cartForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String memId = (String) request.getSession().getAttribute("login"); // session의 login값 가져온다.

		if (memId == null) {// 로그인이 안돼있거나 관리자가 아니라면
			request.setAttribute("msg", "로그인 해야 합니다..");
			request.setAttribute("url", request.getContextPath() + "/market/marketList");
			return "alert/alert";
		}

		System.out.println("memId:" + memId);

		Cart cart = new Cart();
		System.out.println(cart);
		
		
		
		request.getSession().setAttribute("pageNum", "1");
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		int limit = 10;

		int goodsCount = cartdao.goodsCount(memId); // 게시판 종류별 전체 게시물 수 리턴

		List<Cart> cartlist = cartdao.cartlist(memId,pageNum, limit);// list를 만들건데 board 타입을 넣어서 만든다.

		int maxpage = (int) ((double) goodsCount / limit + 0.95);
		/*
		 * startpage : 화면에 출력될 시작 페이지 현재페이지 | 시작페이지 1 1 1/10.0 => 0.1 + 0.9 => (int)1.0
		 * -1 => 0 * 10 +1 => 1 10 1 11 11 505 501 int startpage= ((int)(pageNum/10.0 +
		 * 0.9) -1)*10 +1; //10.0 -> 한페이지에 10개 보여줌
		 */
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 +1 ;
		/*
		 * endpage : 화면에 출력할 마지막 페이지 번호. 한 화면에 10개의 페이지를 보여줌
		 */
		int endpage = startpage + 9;
		// endpage 는 maxpage를 넘어가면 안됨
		if (endpage > maxpage)
			endpage = maxpage;

		// 글 번호
		int boardnum = goodsCount - (pageNum - 1) * limit;


		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		
		
		
		

	//	List<Cart> cartlist = cartdao.cartlist(memId);


		request.setAttribute("cartlist", cartlist);

		return "market/cartForm";
	}

	@RequestMapping("delete")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
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


	@RequestMapping("buy")
	public String buy(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id = (String) request.getSession().getAttribute("login");
		OrderItem item = new OrderItem();
		int code = Integer.parseInt(request.getParameter("goodsname"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int num = itemdao.maxnum(); // 등록된 게시글의 최대 num값
		String name = request.getParameter("name"); 
		item.setOrderCode(++num);// 최대값+1
		item.setGoodsCode(code);
		item.setCartQuantity(quantity);
		item.setMemId(id);
		System.out.println("item" + item);
		
		Orderinfo info = new Orderinfo();
		num = infodao.maxnum(); // 등록된 게시글의 최대 num값
		info.setOrderCode(++num);// 최대값+1
		info.setMemId(id);
		String address = (String)request.getParameter("address");
		info.setMemAddress(address);
		System.out.println("info"+info);
		
		Cart cart = new Cart();
		cart.setMemId(id);
		cart.setGoodsCode(code);
		
		
		Member member = new Member();
		int nowpoint = Integer.parseInt(request.getParameter("point"));
		int point  = Integer.parseInt(request.getParameter("afterPoint"));
		member.setMemId(id);
		member.setMemPoint(point); //변경될포인트
		
		int price = Integer.parseInt(request.getParameter("price"));

		
		if (itemdao.insert(item) && infodao.insert(info) && cartdao.delete(cart) && mdao.mupdate(member) && accountdao.minus(member.getMemId(),price,name,nowpoint)) {//동시에 카트에서 굿즈 코드 같은거 없애고 싶음 중요함!!!
			request.setAttribute("msg", "주문완료");
			request.setAttribute("url", request.getContextPath() + "/market/buyList");
			return "alert/alert";
		}
		request.setAttribute("msg", "오류.");
		request.setAttribute("url", request.getContextPath() + "/market/cartForm");
		return "alert/alert";
	}

	@RequestMapping("buyForm")
	public String buyForm(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
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
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id =(String)request.getSession().getAttribute("login");
		
		request.getSession().setAttribute("pageNum", "1");
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		int limit = 10;

		int oderCount = itemdao.oderCount(id); // 게시판 종류별 전체 게시물 수 리턴

		List<OrderItem> buylist = itemdao.buylist(id,pageNum, limit);// list를 만들건데 board 타입을 넣어서 만든다.

		int maxpage = (int) ((double) oderCount / limit + 0.95);
		/*
		 * startpage : 화면에 출력될 시작 페이지 현재페이지 | 시작페이지 1 1 1/10.0 => 0.1 + 0.9 => (int)1.0
		 * -1 => 0 * 10 +1 => 1 10 1 11 11 505 501 int startpage= ((int)(pageNum/10.0 +
		 * 0.9) -1)*10 +1; //10.0 -> 한페이지에 10개 보여줌
		 */
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 +1 ;
		/*
		 * endpage : 화면에 출력할 마지막 페이지 번호. 한 화면에 10개의 페이지를 보여줌
		 */
		int endpage = startpage + 9;
		// endpage 는 maxpage를 넘어가면 안됨
		if (endpage > maxpage)
			endpage = maxpage;

		// 글 번호
		int boardnum = oderCount - (pageNum - 1) * limit;


		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		
		
	//	List<OrderItem> buylist = itemdao.buylist(id); // 굿즈 상품들 보임
		request.setAttribute("buylist", buylist);
		return "market/buyList";

	}
	@RequestMapping("list")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id =(String)request.getSession().getAttribute("login");
		
		request.getSession().setAttribute("pageNum", "1");
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		int limit = 10;

		int totalCount = itemdao.totalCount(); // 게시판 종류별 전체 게시물 수 리턴

		List<OrderItem> tlist = itemdao.tlist(pageNum, limit);// list를 만들건데 board 타입을 넣어서 만든다.

		int maxpage = (int) ((double) totalCount / limit + 0.95);
		/*
		 * startpage : 화면에 출력될 시작 페이지 현재페이지 | 시작페이지 1 1 1/10.0 => 0.1 + 0.9 => (int)1.0
		 * -1 => 0 * 10 +1 => 1 10 1 11 11 505 501 int startpage= ((int)(pageNum/10.0 +
		 * 0.9) -1)*10 +1; //10.0 -> 한페이지에 10개 보여줌
		 */
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 +1 ;
		/*
		 * endpage : 화면에 출력할 마지막 페이지 번호. 한 화면에 10개의 페이지를 보여줌
		 */
		int endpage = startpage + 9;
		// endpage 는 maxpage를 넘어가면 안됨
		if (endpage > maxpage)
			endpage = maxpage;

		// 글 번호
		int boardnum = totalCount - (pageNum - 1) * limit;


		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		
		
	//	List<OrderItem> buylist = itemdao.buylist(id); // 굿즈 상품들 보임
		request.setAttribute("tlist", tlist);
		return "market/list";

	}
}
