package org.zerock.domain;

public class Criteria {

	//리스트에서 출력하고자 하는 해당 페이지번호와 게시물 개수의 정보
  private int page; //페이지번호
  private int perPageNum;//페이지 게시물 개수

  private int rowEnd;
  private int rowStart;
  public Criteria() {
    this.page = 1;
    this.perPageNum = 5;
  }

  public void setPage(int page) {

    if (page <= 0) {
      this.page = 1;
      return;
    }

    this.page = page;
  }

  public void setPerPageNum(int perPageNum) {

    if (perPageNum <= 0 || perPageNum > 100) {
      this.perPageNum = 10;
      return;
    }

    this.perPageNum = perPageNum;
  }

  public int getPage() {
    return page;
  }

  // method for MyBatis SQL Mapper -
  public int getPageStart() {

    return (this.page - 1) * perPageNum;
  }

  // method for MyBatis SQL Mapper
  public int getPerPageNum() {

    return this.perPageNum;
  }

  @Override
  public String toString() {
    return "Criteria [page=" + page + ", "
        + "perPageNum=" + perPageNum + "]";
  }
}
