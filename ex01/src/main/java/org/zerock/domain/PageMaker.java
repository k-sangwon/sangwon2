package org.zerock.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

  private int totalCount; // 총 레코드 수
  private int startPage;  // 시작 페이지 번호
  private int endPage;	  // 끝 페이지 번호
  private boolean prev;   // [이전]표시 여부
  private boolean next;	  // [다음]표시 여부

  private int displayPageNum = 10;// 페이지 번호 개수

  private Criteria cri;// 페이지번호, 게시물 개수정보

  public void setCri(Criteria cri) {
    this.cri = cri;
  }

  public void setTotalCount(int totalCount) {
    this.totalCount = totalCount;

    calcData(); //startPage, endPage, prev, next 변수의 정보를 구성
  }

  private void calcData() {

    endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

    startPage = (endPage - displayPageNum) + 1;

    int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

    if (endPage > tempEndPage) {
      endPage = tempEndPage;
    }

    prev = startPage == 1 ? false : true;

    next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

  }

  public int getTotalCount() {
    return totalCount;
  }

  public int getStartPage() {
    return startPage;
  }

  public int getEndPage() {
    return endPage;
  }

  public boolean isPrev() {
    return prev;
  }

  public boolean isNext() {
    return next;
  }

  public int getDisplayPageNum() {
    return displayPageNum;
  }

  public Criteria getCri() {
    return cri;
  }

  public String makeQuery(int page) {

    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
        .queryParam("perPageNum", cri.getPerPageNum()).build();

    return uriComponents.toUriString();// url 에   ?page=2&perPageNum=5 이 만들어짐
  }
  
  
  public String makeSearch(int page){
    
    UriComponents uriComponents =
              UriComponentsBuilder.newInstance()
              .queryParam("page", page)
              .queryParam("perPageNum", cri.getPerPageNum())
              .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
              .queryParam("keyword", ((SearchCriteria)cri).getKeyword())
              .build();             
    
    return uriComponents.toUriString();
  } 
}
