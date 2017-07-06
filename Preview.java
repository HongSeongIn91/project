package preview.model;

import java.util.Date;

public class Preview {

	private Integer pre_num;
	private Integer pre_mv_num;
	private String pre_m_id;
	private Date pre_regdate;
	private String pre_content;
	
	public Preview(Integer pre_num, Integer pre_mv_num, String pre_m_id,
			Date pre_regdate, String pre_content) {
		super();
		this.pre_num = pre_num;
		this.pre_mv_num = pre_mv_num;
		this.pre_m_id = pre_m_id;
		this.pre_regdate = pre_regdate;
		this.pre_content = pre_content;
	}

	public Integer getPre_num() {
		return pre_num;
	}

	public Integer getPre_mv_num() {
		return pre_mv_num;
	}

	public String getPre_m_id() {
		return pre_m_id;
	}

	public Date getPre_regdate() {
		return pre_regdate;
	}

	public String getPre_content() {
		return pre_content;
	}
	
}
