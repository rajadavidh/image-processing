  // STANDAR TEMPLATE TUBES GRAFCIT @IT TELKOM | 2011
//--------------------------------- inisialisasi, ga perlu dirubah
static int canvasW = 600;
static int canvasH = 600;
void setup() {
  size(canvasW, canvasH);
  background(255);
}

//--------------------------------- variable global ditulis disini
int xx1;
int x1 = -100;  //titik x1
int y1 = 95;    // titik y1
int x2 = 105;   //titik x2
int y2 = -100;  //titik y2
int tx = 70;  //titik translasi
int ty = 30;  //titik translasi
int xr = 0;   // titik rotasi
int yr = 0;   //titik rotasi
int rad = 45;  //derajat kemiringan roasi
float sekala = 2; //skala

int px = 10;   //mengganti ketebalan garis
color warna = color (250,100,90);    //ganti warna garis
int mode = 1; //pilih mode 0 : kotak putus2
              // 1 : kotak morse
              // 2 : kotak biasa
//--------------------------------- disini mulai codingnya
void draw() {
  drawHelpLines();
  if (mode == 0) {
    kotak_putus_tebel();
  }
  else if (mode == 1) {
    kotak_morse_tebel();
  }
  else if (mode ==2) {
    kotak_tebel();
  }
  rotasi (x1, x2, y1, y2, xr, yr, rad);
  skala(x1, x2, y1, y2, sekala);

}

public void kotak_tebel() {   //menggambar kotak tebal
for (int i=0; i<px; i++) {
 kotak(x1-i,x2+i,y1+i,y2-i);
 kotak(x1+tx-i,x2+tx+i,y1+ty+i,y2+ty-i);
}

}

public void kotak_putus_tebel() {    //menggambar kotak putus2 tebal
for (int i=0; i<px; i++) {
  kotak_putus (x1-i, x2+i, y1+i, y2-i, i);
  kotak_putus (x1-i+tx, x2+i+tx, y1+i+ty ,y2-i+ty , i);  
  }
}

public void kotak_morse_tebel() {    //menggambar kotak morse tebal
for (int i=0; i<px; i++) {
  kotak_morse(x1-i, x2+i, y1+i, y2-i, i);
  kotak_morse(x1-i+tx, x2+i+tx, y1+i+ty, y2-i+ty, i);  
  }
}


public void kotak_putus (int x1, int x2, int y1, int y2, int d) {  //gambar kotak putus
  stroke (warna);
  for (int x=x1, c = 0; x<=x2; x++, c++){
    if ((c - d)%10>=5 || c - d < 1 || c >= x2 - x1 - d) {
    stdPoint (x,y1);
    stdPoint (x,y2);
    }
  }
  for (int y=y2, c = 0; y<=y1; y++, c++) {
    if ((c - d)%10>=5 || c - d  < 1 || c >= y1 - y2 - d) {
    stdPoint (x2,y);
    stdPoint (x1,y);
    }
  }
}

public void kotak_morse (int x1, int x2, int y1, int y2, int d) {  //gambar kotak morse
  stroke (warna);
  for (int x=x1, c = 0; x<=x2; x++, c++){
    if ((c - d)%20>=10 || c - d < 1 || c >= x2 - x1 - d || (((c-d)%20) == 3) || (((c-d)%20) == 7)) {
    stdPoint (x,y1);
    stdPoint (x,y2);
    }
  }
  for (int y=y2, c = 0; y<=y1; y++, c++) {
    if ((c - d)%20>=10 || c - d  < 1 || c >= y1 - y2 - d || (((c-d)%20) == 3) || (((c-d)%20) == 7)) {
    stdPoint (x2,y);
    stdPoint (x1,y);
    }
  }
}

public void kotak (int x1, int x2, int y1, int y2) { //menggambar kotak biasa
  stroke (warna);
  for (int x=x1; x<=x2; x++){
    stdPoint (x,y1);
    stdPoint (x,y2);
    }
  for (int y=y2; y<=y1; y++) {
    stdPoint (x2,y);
    stdPoint (x1,y);
    }
}

public void rotasi (int x1, int x2, int y1, int y2, int xr, int yr, int rad) {  //prosedur rotasi
  stroke (warna);
  float derajat = rad*PI/180;
  int x3=x1+(x2-x1);
  int y3=y1;
  int x4=x1;
  int y4=y1-(y1-y2);
  int xx1=(int)(xr+((x1-xr)*cos(derajat))-(y1-yr)*sin(derajat));
  int xx2=(int)(xr+((x2-xr)*cos(derajat))-(y2-yr)*sin(derajat));
  int xx3=(int)(xr+((x3-xr)*cos(derajat))-(y3-yr)*sin(derajat));
  int xx4=(int)(xr+((x4-xr)*cos(derajat))-(y4-yr)*sin(derajat));
  int yy1=(int)(yr+((x1-xr)*cos(derajat))+(y1-yr)*cos(derajat));
  int yy2=(int)(xr+((x2-xr)*cos(derajat))+(y2-yr)*sin(derajat));
  int yy3=(int)(xr+((x3-xr)*cos(derajat))+(y3-yr)*sin(derajat));
  int yy4=(int)(xr+((x4-xr)*cos(derajat))+(y4-yr)*sin(derajat));
  gambargaris (xx1,yy1,xx3,yy3);
  gambargaris (xx1,yy1,xx4,yy4);
  gambargaris (xx3,yy3,xx2,yy2);
  gambargaris (xx4,yy4,xx2,yy2);
  
  //int xx1 = (int) (x1-xr)*cos(rad);
}

void skala(int x1, int x2, int y1, int y2, float sekala){
    int x3=x1+(x2-x1);
    int y3=y1;
    int x4=x1;
    int y4=y1-(y1-y2);
  if (sekala >= 1) {
    int xx1 = (int)x1-(1/2*(int)(sekala)*((x2-x1)*(int)sekala));
    int xx2 = (int)x2+(1/2*(int)(sekala)*((x2-x1)*(int)sekala));
    int xx3 = (int)x3+(1/2*(int)(sekala)*((x2-x1)*(int)sekala));
    int xx4 = (int)x4-(1/2*(int)(sekala)*((x2-x1)*(int)sekala));
    int yy1 = (int)y1+(1/2*(int)(sekala)*((y1-y2)*(int)sekala));
    int yy2 = (int)y2-(1/2*(int)(sekala)*((y1-y2)*(int)sekala));
    int yy3 = (int)y3+(1/2*(int)(sekala)*((y1-y2)*(int)sekala));
    int yy4 = (int)y4-(1/2*(int)(sekala)*((y1-y2)*(int)sekala));
    gambargaris (xx1,yy1,xx3,yy3);
    gambargaris (xx1,yy1,xx4,yy4);
    gambargaris (xx3,yy3,xx2,yy2);
    gambargaris (xx4,yy4,xx2,yy2);
    }
}


void gambargaris(int xx1, int yy1, int xx2, int yy2){   //prosedur menggambar garis
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


//--------------------------------- procedure/fungsi bikinan sendiri
//--------------------------------- silahkan ditulis dibawah sini

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
