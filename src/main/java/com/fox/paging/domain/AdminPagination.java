package com.fox.paging.domain;


import lombok.Data;

@Data
public class AdminPagination {

    private int      totalRecordCount;     // 검색된 전체 데이터 수
                                           // menu_id 에 해당하는  검색된
    private int      totalPageCount;       // 전체 페이지 수 -> totalpagecount
    private int      startPage;            // 첫 페이지 번호 -> startnum
    private int      endPage;              // 끝 페이지 번호 ->endnum
    private int      limitStart;           // LIMIT 시작 위치
    private boolean  existPrevPage;        // 이전 페이지 존재 여부
    private boolean  existNextPage;        // 다음 페이지 존재 여부

    public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	public boolean isExistPrevPage() {
		return existPrevPage;
	}

	public void setExistPrevPage(boolean existPrevPage) {
		this.existPrevPage = existPrevPage;
	}

	public boolean isExistNextPage() {
		return existNextPage;
	}

	public void setExistNextPage(boolean existNextPage) {
		this.existNextPage = existNextPage;
	}

	public AdminPagination(int totalRecordCount, AdminSearchDTO params) {
        if (totalRecordCount > 0) {
            this.totalRecordCount = totalRecordCount;
            calculation(params);
        }
    }

    private void calculation(AdminSearchDTO params) {
        // 
        // 전체 페이지 수 계산
      //  totalPageCount = ((totalRecordCount - 1) / params.getRecordSize()) + 1;
        totalPageCount =  (int) Math.ceil( (double) totalRecordCount / (double) params.getRecordSize() );

        // 현재 페이지 번호가 전체 페이지 수보다 큰 경우, 현재 페이지 번호에 전체 페이지 수 저장
        if (params.getPage() > totalPageCount) {
            params.setPage(totalPageCount);
        }
        // 첫 페이지 번호 계산
        this.startPage = ((params.getPage() - 1) / params.getPageSize()) * params.getPageSize() + 1;

        // 끝 페이지 번호 계산
        this.endPage   = this.startPage + params.getPageSize() - 1;
        //끝페이지보다 시작페이지가 작으면 이전버튼 보여줌
        this.existPrevPage = (this.endPage > this.startPage );
        // 총 페이지보다 끝페이지가 작으면 다음페이지 보여줌
        this.existNextPage = (this.endPage < this.totalPageCount);
        
        // 끝 페이지가 전체 페이지 수보다 큰 경우, 끝 페이지 전체 페이지 수 저장
        if (this.endPage > this.totalPageCount) {
            this.endPage = this.totalPageCount;
        }
}
    
}