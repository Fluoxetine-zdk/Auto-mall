package ctgu.entity;

import java.util.Date;

public class Orders {
    private Integer orderid;

    private String username;

    private Date createdate;

    private Integer status;

    private Float totalprice;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Float getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Float totalprice) {
        this.totalprice = totalprice;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderid=" + orderid +
                ", username='" + username + '\'' +
                ", createdate=" + createdate +
                ", status=" + status +
                ", totalprice=" + totalprice +
                '}';
    }
}
