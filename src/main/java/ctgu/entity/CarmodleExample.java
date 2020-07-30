package ctgu.entity;

import java.util.ArrayList;
import java.util.List;

public class CarmodleExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CarmodleExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andModleidIsNull() {
            addCriterion("modleid is null");
            return (Criteria) this;
        }

        public Criteria andModleidIsNotNull() {
            addCriterion("modleid is not null");
            return (Criteria) this;
        }

        public Criteria andModleidEqualTo(Integer value) {
            addCriterion("modleid =", value, "modleid");
            return (Criteria) this;
        }

        public Criteria andModleidNotEqualTo(Integer value) {
            addCriterion("modleid <>", value, "modleid");
            return (Criteria) this;
        }

        public Criteria andModleidGreaterThan(Integer value) {
            addCriterion("modleid >", value, "modleid");
            return (Criteria) this;
        }

        public Criteria andModleidGreaterThanOrEqualTo(Integer value) {
            addCriterion("modleid >=", value, "modleid");
            return (Criteria) this;
        }

        public Criteria andModleidLessThan(Integer value) {
            addCriterion("modleid <", value, "modleid");
            return (Criteria) this;
        }

        public Criteria andModleidLessThanOrEqualTo(Integer value) {
            addCriterion("modleid <=", value, "modleid");
            return (Criteria) this;
        }

        public Criteria andModleidIn(List<Integer> values) {
            addCriterion("modleid in", values, "modleid");
            return (Criteria) this;
        }

        public Criteria andModleidNotIn(List<Integer> values) {
            addCriterion("modleid not in", values, "modleid");
            return (Criteria) this;
        }

        public Criteria andModleidBetween(Integer value1, Integer value2) {
            addCriterion("modleid between", value1, value2, "modleid");
            return (Criteria) this;
        }

        public Criteria andModleidNotBetween(Integer value1, Integer value2) {
            addCriterion("modleid not between", value1, value2, "modleid");
            return (Criteria) this;
        }

        public Criteria andModlenameIsNull() {
            addCriterion("modlename is null");
            return (Criteria) this;
        }

        public Criteria andModlenameIsNotNull() {
            addCriterion("modlename is not null");
            return (Criteria) this;
        }

        public Criteria andModlenameEqualTo(String value) {
            addCriterion("modlename =", value, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameNotEqualTo(String value) {
            addCriterion("modlename <>", value, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameGreaterThan(String value) {
            addCriterion("modlename >", value, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameGreaterThanOrEqualTo(String value) {
            addCriterion("modlename >=", value, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameLessThan(String value) {
            addCriterion("modlename <", value, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameLessThanOrEqualTo(String value) {
            addCriterion("modlename <=", value, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameLike(String value) {
            addCriterion("modlename like", value, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameNotLike(String value) {
            addCriterion("modlename not like", value, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameIn(List<String> values) {
            addCriterion("modlename in", values, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameNotIn(List<String> values) {
            addCriterion("modlename not in", values, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameBetween(String value1, String value2) {
            addCriterion("modlename between", value1, value2, "modlename");
            return (Criteria) this;
        }

        public Criteria andModlenameNotBetween(String value1, String value2) {
            addCriterion("modlename not between", value1, value2, "modlename");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}