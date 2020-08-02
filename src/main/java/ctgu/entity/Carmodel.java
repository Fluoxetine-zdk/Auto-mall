package ctgu.entity;

public class Carmodel {
    private Integer modelid;

    private String modelname;

    public Integer getModelid() {
        return modelid;
    }

    public void setModelid(Integer modelid) {
        this.modelid = modelid;
    }

    public String getModelname() {
        return modelname;
    }

    public void setModelname(String modelname) {
        this.modelname = modelname == null ? null : modelname.trim();
    }
}