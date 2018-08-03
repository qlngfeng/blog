package com.profound.blog.bean;

public class IndexBlog {
	private String blogtype;
	private String blogtitle;
	private String releaseDate;
	private int clickHit;
	private String content;
	private String username;
	private String summary;
	private int blog_id;
	public String getBlogtype() {
		return blogtype;
	}
	public void setBlogtype(String blogtype) {
		this.blogtype = blogtype;
	}
	public String getBlogtitle() {
		return blogtitle;
	}
	public void setBlogtitle(String blogtitle) {
		this.blogtitle = blogtitle;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public int getClickHit() {
		return clickHit;
	}
	public void setClickHit(int clickHit) {
		this.clickHit = clickHit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public int getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}
	public IndexBlog(String blogtype, String blogtitle, String releaseDate, int clickHit, String content,
			String username, String summary, int blog_id) {
		super();
		this.blogtype = blogtype;
		this.blogtitle = blogtitle;
		this.releaseDate = releaseDate;
		this.clickHit = clickHit;
		this.content = content;
		this.username = username;
		this.summary = summary;
		this.blog_id = blog_id;
	}
	public IndexBlog() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "IndexBlog [blogtype=" + blogtype + ", blogtitle=" + blogtitle + ", releaseDate=" + releaseDate
				+ ", clickHit=" + clickHit + ", content=" + content + ", username=" + username + ", summary=" + summary
				+ ", blog_id=" + blog_id + "]";
	}
	
}
