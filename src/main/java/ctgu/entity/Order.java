package ctgu.entity;

public class Order {
    private Integer orderid;

    private Integer userid;

    private String orderDate;

    private String handDate;

    private Float totalprice;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate == null ? null : orderDate.trim();
    }

    public String getHandDate() {
        return handDate;
    }

    public void setHandDate(String handDate) {
        this.handDate = handDate == null ? null : handDate.trim();
    }

    public Float getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Float totalprice) {
        this.totalprice = totalprice;
    }
}