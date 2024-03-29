package ctgu.entity;

public class Brand {
    private Integer brandid;

    private String brandname;

    public Integer getBrandid() {
        return brandid;
    }

    public void setBrandid(Integer brandid) {
        this.brandid = brandid;
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname == null ? null : brandname.trim();
    }

    @Override
    public String toString() {
        return "Brand{" +
                "brandid=" + brandid +
                ", brandname='" + brandname + '\'' +
                '}';
    }
}
