package com.fox.paging.domain;


import lombok.Data;

@Data
public class Pagination {

    private int      totalRecordCount;     // 검색된 전체 데이터 수
                                           // menu_id 에 해당하는  검색된
    private int      totalPageCount;       // 전체 페이지 수 -> totalpagecount
    private int      startPage;            // 첫 페이지 번호 -> startnum
    private int      endPage;              // 끝 페이지 번호 ->endnum
    private int      limitStart;           // LIMIT 시작 위치
    private boolean  existPrevPage;        // 이전 페이지 존재 여부
    private boolean  existNextPage;        // 다음 페이지 존재 여부

    public Pagination(int totalRecordCount, SearchDTO params) {
        if (totalRecordCount > 0) {
            this.totalRecordCount = totalRecordCount;
            calculation(params);
        }
    }

    private void calculation(SearchDTO params) {
        // 
        // 전체 페이지 수 계산
      //  totalPageCount = ((totalRecordCount - 1) / params.getRecordSize()) + 1;
        totalPageCount =  (int) Math.ceil( (double) totalRecordCount / (double) params.getRecordSize() );

        // 현재 페이지 번호가 전체 페이지 수보다 큰 경우, 현재 페이지 번호에 전체 페이지 수 저장
        if (params.getPage() > totalPageCount) {
            params.setPage(totalPageCount);
        }
        // 첫 페이지 번호 계산 1 , 11 ,21 ...
        this.startPage = ((params.getPage() - 1) / params.getPageSize()) * params.getPageSize() + 1;
        
        // 끝 페이지 번호 계산 : ex) 시작페이지 1 + 화면에뜨는 게시글 10 = 11 > 11 - 1 = 10
        this.endPage   = this.startPage + params.getPageSize() - 1;
        
        //현재 페이징 그룹의 시작 페이지가 1보다 클경우 이전 버튼을 보여줌 ex) 1~10 X : 11~21 O
        this.existPrevPage = (this.startPage > 1);
      
        
        // 총페이지수보다 끝페이지수가 작거나 총페이지수가 총 2페이지보다 높을경우 다음 버튼이 나옴
        this.existNextPage = (this.endPage < this.totalPageCount);
        
        // 끝 페이지가 전체 페이지 수보다 큰 경우, 끝 페이지 전체 페이지 수 저장
        // 전체페이지수가 67일경우 10씩 넘어간다는 가정하에 67로 맞춰줌
        if (this.endPage > this.totalPageCount) {
            this.endPage = this.totalPageCount;
        }
}
    
}