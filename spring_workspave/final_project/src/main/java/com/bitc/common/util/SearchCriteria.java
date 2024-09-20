package com.bitc.common.util;

public class SearchCriteria extends Criteria {

	// Criteria를 상속받으니 검색에 필요한 것만 필드를 더해준다.
	private String searchName;
	private String searchValue;

	public SearchCriteria(int page, int perPageNum, String searchName, String searchValue) {
		super(page, perPageNum);
		this.searchName = searchName;
		this.searchValue = searchValue;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchName=" + searchName + ", searchValue=" + searchValue + ", toString()="
				+ super.toString() + "]";
	}

} // end SearchCriteria class
