package javaTest;

class EngRandom {
	  public static void main(String[] args) {

		  char[] love = new char[4];
		  int count = 0;
		 
		while(true){  

	    for (int i = 0; i < love.length; i++) {
	      love[i] = (char) ((Math.random() * 26) + 65);
	      System.out.print(love[i] + " ");
	    }//end for
	    
	    ++count;
	    if(count%4 == 0) {System.out.println();}
	    
	    if(love[0] == 'L' && love[1] == 'O' && love[2] == 'V' && love[3] == 'E') {
	    	System.out.println("총"+ count*4 + "개의 글자를 생성했습니다.");
	    	break;
	    	}//end if
	    
		}//end while
	    
	    
  }//end main
}//end class