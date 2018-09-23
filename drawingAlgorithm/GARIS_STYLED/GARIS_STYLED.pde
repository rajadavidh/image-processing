// STANDAR TEMPLATE TUBES GRAFCIT @IT TELKOM | 2011
	//--------------------------------- inisialisasi, ga perlu dirubah
	static int canvasW = 600;
	static int canvasH = 600;
	public void setup() {
	  size(canvasW, canvasH);
	  background(255);
	}
        
	//--------------------------------- variable global ditulis disini
	//dx>dy
	int xx1 = 0;
	int yy1 = 0;
	int xx2 = -200;
	int yy2 = 200;
	int x3 = 200;
	int y3 = 200;
	int x4 = 0;
	int y4 = 0;
	int x5 = -3;
	int y5 = 14;
        int putus=1;
        int tx=100;
        int ty=30;
	color warna = color (255,0,255);
        int sudut = 180;
        int tebal = 50;
	
	

	
	//--------------------------------- disini mulai codingnya
	public void draw() {
          System.out.println(sin(22/7));
	  drawHelpLines();
	  
	  //garis y = x
	  gambargaris(-600,-600,600,600);
	  
	  //garis y = -x
	  gambargaris(-600,600,600,-600);
	  
	  //garis tegak
	  //garis miring
	  
	  //kuadran 1
	  //dx>dy
	  //gambargaris(x1,y1,x2,y2);
	  
	  //dy>dx
	  //gambargaris(x1,y1,x3,y3);
	  
	  //kuadran 2
	  //dy>dx
	  //gambargaris(-x1,y1,-x3,y3);
	  
	  //dx>dy
	  //gambargaris(-x1,y1,-x2,y2);

	  
	  //kuadran 3
	  //dx>dy
	  //gambargaris(-x1,-y1,-x2,-y2);
	  //dy>dx
	  //gambargaris(-x1,-y1,-x3,-y3);
	  
	  //kuadran 4
	  //dy>dx
	  //gambargaris(x1,-y1,x3,-y3);
	  //dx>dy
	  //gambargaris(x1,-y1,x2,-y2);
	  
	  
	  //gambar garis lagi
	  //gambargariswarnatebalputus2(x1, y1, x2, y2, warna, tebal, putus);
	
	  //garis tebal baru berhasil untuk gradien negatif dan belum bisa putus2
	  gambargaris2(xx1,yy1,xx2,yy2,warna,tebal,putus);
          translasi(xx1,yy1,xx2,yy2,warna,tebal,putus,tx,ty);
          rotasi(xx1,yy1,xx2,yy2,warna,tebal,putus,0,0,sudut);
	  gambargaris(-60,-60,60,60);
	  
		  
	}
	//--------------------------------- procedure/fungsi bikinan sendiri
	//--------------------------------- silahkan ditulis dibawah sini
	
	//void gambargaristebalputus2(int xx1, int yy1, int xx2, int yy2, color warna, int tebal, int putus)
	
	void gambargaris(int xx1, int yy1, int xx2, int yy2){
	  //variabel lokal
	  int dx = abs(xx2-xx1);
	  int dy = abs(yy2-yy1);
	  int P;
	  int x,y,awal,akhir;
	  
	  //modifikasi inputan ke bresenham  
	  if (dy>dx) {
	   //swap
	   if (yy1<yy2){
	    awal = yy1;
	    akhir = yy2;
	   } else {
	    awal = yy2;
	    akhir = yy1;
	   }			
	   P = 2*dx-dy;
	  } else {
	   //tetap
	   if (xx1<xx2){
	    awal = xx1;
	    akhir = xx2;
	   } else {			
	     awal = xx2;
	     akhir = xx1;
	   }		
	   P = 2*dy-dx;
	  }
	 
	  //plot x0,y0
	  x = xx1;
	  y = yy1;
	  stdPoint(x,y);
	  //perulangan bresenham
	  for (int i = awal; i < akhir; i++) {
	    if (P<0) {    
	    
	     if (dy>dx) {
	       //swap
	        if (yy1<yy2){
	          y++;
	        } else {
	          y--;
	        }
	        stdPoint(x,y);
	        P += 2*dx;
	     } else {
	       //tetap
	        if (xx1<xx2){
	          x++;
	        } else {
	          x--;
	        }
	        stdPoint(x,y);
	        P += 2*dy;
	     }
	     
	   } else {
	     if (yy1<yy2) {
	       if (xx1<xx2) {
	         //kuadran 1
	         x++;        
	       } else {
	         //kuadran 2
	         x--;
	       }
	       y++; 
	     } else {
	       if (xx1<xx2) {
	         //kuadran 4
	         x++;        
	       } else {
	         //kuadran 3
	         x--;
	       }
	       y--;
	     }
	     
	     stdPoint(x,y);
	     if (dy>dx) {
	       //swap
	       P += 2*dx-2*dy;
	     } else {
	       //tetap
	       P += 2*dy-2*dx;
	     }
	   }
	   
	  }
	 
	} 

	void gambargaris2(int xx1, int yy1, int xx2, int yy2,color warna,int tebal,int putus){
		  //variabel lokal
		  int dx = abs(xx2-xx1);
		  int dy = abs(yy2-yy1);
		  int P;
		  int x,y,awal,akhir;
		  
		  //modifikasi inputan ke bresenham  
		  if (dy>dx) {
		   //swap
		   if (yy1<yy2){
		    awal = yy1;
		    akhir = yy2;
		   } else {
		    awal = yy2;
		    akhir = yy1;
		   }			
		   P = 2*dx-dy;
		  } else {
		   //tetap
		   if (xx1<xx2){
		    awal = xx1;
		    akhir = xx2;
		   } else {			
		     awal = xx2;
		     akhir = xx1;
		   }		
		   P = 2*dy-dx;
		  }
		 
		  //plot x0,y0
		  x = xx1;
		  y = yy1;
		  stroke(warna);
		  stdPoint(x,y);
		  tebelinkeluar(x,y,tebal);
		  //perulangan bresenham
                  int count=0;
	          if (putus == 1)  count =0;
		  for (int i = awal; i < akhir; i++) {
		    
		    if (P<0) {    
		    
		     if (dy>dx) {
		       //swap
		        if (yy1<yy2){
		          y++;
		        } else {
		          y--;
		        }
                        if (count % 15 <= 0.5*15 && putus==1) {
		          stdPoint(x,y);
		          tebelinkeluar(x,y,tebal);
		        } 
                        if (putus != 1){ stdPoint(x,y); tebelinkeluar(x,y,tebal);}
		        P += 2*dx;
		     } else {
		       //tetap
		        if (xx1<xx2){
		          x++;
		        } else {
		          x--;
		        }
                        stroke(warna);
                        if (count % 15 <= 0.5*15 && putus==1) {
		          stdPoint(x,y);
		          tebelinkeluar(x,y,tebal);
		        } 
                        if (putus != 1){
                          stdPoint(x,y);
		          tebelinkeluar(x,y,tebal);
		        }
		        P += 2*dy;
		        
		     }
		     
		   } else {
		     if (yy1<yy2) {
		       if (xx1<xx2) {
		         //kuadran 1
		         x++;        
		       } else {
		         //kuadran 2
		         x--;
		       }
		       y++; 
		     } else {
		       if (xx1<xx2) {
		         //kuadran 4
		         x++;        
		       } else {
		         //kuadran 3
		         x--;
		       }
		       y--;
		     }
		     stroke(warna);
                     if (count % 15 <= 0.5*15 && putus==1) {
		          stdPoint(x,y);
		          tebelinkeluar(x,y,tebal);
		     } 
                     if (putus != 1){
                          stdPoint(x,y);
		          tebelinkeluar(x,y,tebal);
		     }   				     
		     if (dy>dx) {
		       //swap
		       P += 2*dx-2*dy;
		     } else {
		       //tetap
		       P += 2*dy-2*dx;
		     }
		     
		   }
                    count++;
		  }
		  
	} 

	void tebelinkeluar(int xxx,int yyy, int tebal){
		if (tebal>1){
	    	 int tb,tbx;
	    	 tb = yyy;
	    	 tbx = xxx;
		    	 for (int t=0; t<tebal; t++){
		    		 	stroke(warna);	
			        	
			        	if ((yy2-yy1)*(xx2-xx1) <0) {
			        		stroke(warna);
                                                stdPoint(tbx+t,tb+t);
			        		stdPoint(tbx+t,tb+t-1);
			        	}
                                        else {
                                                stroke(warna);
                                                stdPoint(tbx-t,tb+t);
			        		stdPoint(tbx-t,tb+t-1);
			        	}
		    	 }
	    	
	     }
		
	}
        void translasi (int xx1, int yy1, int xx2, int yy2,color warna,int tebal,int putus,int tx, int ty){
          int x1=xx1+tx;
          int x2=xx2+tx;
          int y1=yy1+ty;
          int y2=yy2+ty;
          gambargaris2(x1,y1,x2,y2,warna,tebal,putus);
        }
        
        void rotasi (int xx1, int yy1, int xx2, int yy2,color warna,int tebal,int putus,int xr, int yr, float angle){
          int x1=(int)Math.round(xr+(xx1-xr)*cos(angle/180*(3.14))-(yy1-yr)*sin(angle/180*(3.14)));
          int y1=(int)Math.round(yr+(xx1-xr)*sin(angle/180*(3.14))+(yy1-yr)*cos(angle/180*(3.14)));
          int x2=(int)Math.round(xr+(xx2-xr)*cos(angle/180*(3.14))-(yy2-yr)*sin(angle/180*(3.14)));
          int y2=(int)Math.round(yr+(xx2-xr)*sin(angle/180*(3.14))+(yy2-yr)*cos(angle/180*(3.14)));
          gambargaris2(x1,y1,x2,y2,warna,tebal,putus);
        }	
	// -------------------------------- normalisasi, ga perlu dirubah

	void stdPoint(int xxx, int yyy)
	{
	  point(xxx+(canvasW/2), (yyy*-1)+(canvasH/2));
	}

	void drawHelpLines()
	{
	  stroke(0, 0, 255);
	  for (int z=0; z<canvasW; z=z+1) {
	    point((canvasW/2), z);
	    point(z, (canvasH/2));
	  }
	  stroke(0, 0, 0);
	}
