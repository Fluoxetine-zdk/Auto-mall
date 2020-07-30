package ctgu.entity;

public class Carmodle {
    private Integer modleid;

    private String modlename;

    public Integer getModleid() {
        return modleid;
    }

    public void setModleid(Integer modleid) {
        this.modleid = modleid;
    }

    public String getModlename() {
        return modlename;
    }

    public void setModlename(String modlename) {
        this.modlename = modlename == null ? null : modlename.trim();
    }
}