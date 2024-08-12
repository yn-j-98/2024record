package product;

public class ProductDTO {
	private int num; // 상품 PK 
	private String name; // 이름
	private String details; //상세내용
	private int price; // 상품가격
	private int cnt;// 상품개수
	private String seller; //관리자 역할
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	@Override
	public String toString() {
		return "ProductDTO [num=" + num + ", name=" + name + ", details=" + details + ", price=" + price + ", cnt="
				+ cnt + ", seller=" + seller + "]";
	}
	
	
}
